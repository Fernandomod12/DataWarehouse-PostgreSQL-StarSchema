/* =========================================================
 PROYECTO DATA WAREHOUSE - CONSULTAS ANALÍTICAS Y ETL
 Autor: Fernando Vasco
 Base de Datos: PostgreSQL
=========================================================
*/

-- 1. KPI ANUAL: Conteo comparativo de asteroides PHA (Peligrosos) vs NEO (Cercanos) por año
-- Uso de agregación condicional (CASE WHEN) para reportes de Business Intelligence.
SELECT
  t.ano,
  COUNT(CASE WHEN n.pha = 'Y' THEN 1 END) AS total_pha,
  COUNT(CASE WHEN n.neo = 'Y' THEN 1 END) AS total_neo
FROM fato_neo f
JOIN dim_neo n ON f.neo_id = n.id
JOIN dim_tempo t ON f.tempo_id = t.id
GROUP BY t.ano
ORDER BY t.ano;

-- 2. DETECCIÓN DE RIESGOS RECIENTES
-- Listado de los 10 asteroides peligrosos detectados en los últimos 5 años,
-- ordenados por la distancia mínima de intersección (MOID).
SELECT
  n.full_name,
  f.moid,
  t.ano
FROM fato_neo f
JOIN dim_neo n ON f.neo_id = n.id
JOIN dim_tempo t ON f.tempo_id = t.id
WHERE n.pha = 'Y'
  AND t.ano >= EXTRACT(YEAR FROM CURRENT_DATE) - 5
ORDER BY f.moid ASC
LIMIT 10;

-- 3. TOP 10 ASTEROIDES GIGANTES CON DATOS FIABLES
-- Buscamos los diámetros más grandes, priorizando aquellos con menor incertidumbre (sigma).
SELECT n.full_name, f.diameter, f.diameter_sigma
FROM fato_neo f
JOIN dim_neo n ON f.neo_id = n.id
WHERE f.diameter IS NOT NULL AND f.diameter_sigma IS NOT NULL
ORDER BY f.diameter DESC, f.diameter_sigma ASC
LIMIT 10;

-- 4. PROCESO ETL: TRANSFORMACIÓN DE FECHAS
-- Extracción de Año, Mes y Trimestre a partir del campo 'epoch_cal' para poblar la dimensión tiempo.
UPDATE dim_tempo
SET 
  ano = EXTRACT(YEAR FROM TO_DATE(epoch_cal::text, 'YYYYMMDD')),
  mes = EXTRACT(MONTH FROM TO_DATE(epoch_cal::text, 'YYYYMMDD')),
  trimestre = EXTRACT(QUARTER FROM TO_DATE(epoch_cal::text, 'YYYYMMDD'));

-- 5. RANKING AVANZADO (WINDOW FUNCTIONS)
-- Uso de ROW_NUMBER() para clasificar asteroides sin necesidad de subconsultas complejas o GROUP BY.
SELECT full_name, diameter, diameter_sigma
FROM (
    SELECT 
        n.full_name,
        f.diameter,
        f.diameter_sigma,
        ROW_NUMBER() OVER (ORDER BY f.diameter DESC, f.diameter_sigma ASC) AS pos
    FROM fato_neo f
    JOIN dim_neo n ON f.neo_id = n.id
    WHERE f.diameter IS NOT NULL AND f.diameter_sigma IS NOT NULL
) sub
WHERE pos <= 10;

-- 6. MANTENIMIENTO DE DATOS
-- Actualización masiva de la precisión del diámetro cruzando con datos de origen.
UPDATE fato_neo f
SET diameter_sigma = ROUND(neo.diameter_sigma::numeric, 6)
FROM neo
JOIN dim_neo d ON d.original_id = neo.id
WHERE f.neo_id = d.id;
