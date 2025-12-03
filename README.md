# Proyecto Data Warehouse: Análisis de Asteroides (NEOs)

## Descripción del Proyecto
Este proyecto consiste en el diseño e implementación de un **Data Warehouse** (Almacén de Datos) utilizando **PostgreSQL** para el análisis de Objetos Cercanos a la Tierra (NEOs).

El objetivo principal fue modelar una base de datos analítica bajo la arquitectura de **Esquema en Estrella (Star Schema)**. Esto permite transformar datos complejos y dispersos en un modelo optimizado para realizar consultas analíticas rápidas y facilitar la toma de decisiones.

## Tecnologías Utilizadas
* **Base de Datos:** PostgreSQL 14
* **Gestión y Administración:** pgAdmin 4
* **Lenguaje:** SQL 
* **Modelado de Datos:** Esquema Dimensional (Hechos y Dimensiones)

## Arquitectura del Data Warehouse
El modelo sigue una estructura de **Esquema en Estrella**, con una tabla central de hechos conectada a varias dimensiones descriptivas:

### Estructura de Tablas
* **⭐ Tabla de Hechos (Fact Table):**
    * `fato_neo`: Contiene las métricas clave (diámetro, distancia MOID, sigma) y las claves foráneas.
* **📦 Dimensiones:**
    * `dim_neo`: Datos descriptivos del asteroide (Nombre, ID original, Clasificación PHA).
    * `dim_orbita`: Parámetros orbitales (Clase, excentricidad, semi-eje mayor).
    * `dim_risco`: Datos relacionados con la peligrosidad e intersección de órbita.
    * `dim_tempo`: Dimensión temporal para análisis histórico por año/mes.

### Diagrama Entidad-Relación (ERD)
Así es como se relacionan las tablas en el almacén de datos:

![Diagrama del Esquema en Estrella](img/Diagrama_Entidad_Relacion.png)


## Análisis y Consultas (Business Intelligence)
El proyecto incluye un script de análisis (`Analisis_Consultas.sql`) capaz de responder preguntas de negocio complejas.


Puedes ver todo el código SQL en la carpeta `/sql` de este repositorio.

---
Proyecto desarrollado por **Fernando Vasco** - Estudiante de Ingeniería Informática UGR*
