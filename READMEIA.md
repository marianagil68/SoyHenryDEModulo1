# 🧠 Data Integration & Analytics Project

## 📊 Descripción general

Este proyecto tiene como objetivo desarrollar un **pipeline completo de ingeniería y análisis de datos**, desde la integración de fuentes en SQL hasta la transformación y preparación del dataset para modelos de machine learning en Python.  

El trabajo simula un entorno empresarial real donde es necesario:
- Integrar información proveniente de distintas fuentes,  
- Optimizar la calidad y el rendimiento de la base de datos, y  
- Transformar los datos en conocimiento útil para la toma de decisiones.  

El resultado final es un conjunto de **scripts SQL** y un **notebook en Python** que permiten ejecutar el proceso de principio a fin, generando un dataset listo para análisis avanzado o modelado predictivo.

---

## 🗂️ Estructura del proyecto

El proyecto está dividido en tres fases, cada una centrada en una etapa clave del flujo de datos:

### 🔹 1. Integración y análisis exploratorio (SQL)
📄 `PrimerAvanceProyectoIntegrador.docx`

- Carga y exploración de los datos en SQL.  
- Identificación de los **productos y vendedores más relevantes**.  
- Análisis de **comportamiento de clientes** y adopción de productos.  
- Uso de **funciones de ventana** para evaluar la participación dentro de cada categoría.  

> **Resultados:** consultas SQL optimizadas y reportes interpretativos que describen los patrones de ventas y concentración de mercado.

---

### 🔹 2. Optimización y automatización de la base de datos (SQL avanzado)
📄 `SegundoAvanceDelPI.docx`

- Limpieza y mejora de la calidad de los datos.  
- Creación de un **trigger** que registra automáticamente cuando un producto supera un umbral de ventas acumuladas.  
- **Registro y análisis de eventos** en una tabla de monitoreo.  
- Implementación de **índices individuales y compuestos** para optimizar tiempos de ejecución en consultas críticas.  

> **Resultados:** una base de datos más eficiente, segura y lista para escalar a entornos de análisis en producción.

---

### 🔹 3. Transformación y feature engineering (Python + Pandas)
📄 `TercerAvanceDelPIr.docx`

- Cálculo y validación del campo `TotalPrice` a partir de precios unitarios y descuentos.  
- Detección de **outliers** mediante el rango intercuartílico (IQR).  
- Creación de nuevas variables temporales y categóricas (hora de venta, tipo de día, etc.).  
- Cálculo de **edad y experiencia** de los empleados vinculados a las ventas.  
- Generación de un **dataset final** unificado, listo para análisis o modelado predictivo.  

> **Resultados:** un dataset limpio, enriquecido y estructurado, diseñado para maximizar el valor analítico de los datos.

---

## 🧰 Stack tecnológico

| Fase | Tecnología | Propósito |
|------|-------------|------------|
| 1 | **SQL** | Integración y exploración de datos |
| 2 | **SQL avanzado (Triggers, Índices)** | Calidad y optimización de la base de datos |
| 3 | **Python + Pandas** | Transformación y preparación de datos para análisis |

---

## ⚙️ Ejecución del proyecto

### 🔸 Requisitos
- **Base de datos:** MySQL / PostgreSQL / SQL Server  
- **Python 3.x**  
- Librerías: `pandas`, `numpy`, `matplotlib` *(opcional para visualización)*  
- Entorno: **Jupyter Notebook** o **VS Code**

### 🔸 Pasos de ejecución
1. Clonar o descargar el repositorio.  
2. Ejecutar los scripts SQL para:
   - Crear la base de datos,  
   - Ejecutar las consultas analíticas,  
   - Implementar el trigger y los índices.  
3. Abrir el notebook (`.ipynb`) y ejecutar cada celda para:
   - Cargar los datasets,  
   - Aplicar las transformaciones,  
   - Generar el dataset final limpio.  

---

## 📈 Resultados esperados

- Análisis descriptivo del rendimiento de productos y vendedores.  
- Sistema automatizado de monitoreo de ventas mediante trigger.  
- Base de datos optimizada con índices.  
- Dataset final con variables derivadas listas para modelado o dashboards.

---

## 🚀 Próximos pasos

- Integración con herramientas de visualización (Power BI / Tableau).  
- Desarrollo de un modelo predictivo sobre el dataset generado.  
- Automatización del pipeline con Airflow o Prefect.

---

## 👤 Autor

**Nombre:** [Tu Nombre Completo]  
**Correo:** [tu.email@ejemplo.com]  
**LinkedIn:** [https://www.linkedin.com/in/tuusuario](https://www.linkedin.com/in/tuusuario)  
**GitHub:** [https://github.com/tuusuario](https://github.com/tuusuario)
