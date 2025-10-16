# Data Engeneering

## Descripción General

Este proyecto tiene como objetivo desarrollar un **pipeline completo de ingeniería y análisis de datos**, desde la integración de fuentes en SQL hasta la transformación y preparación del dataset para modelos de machine learning en Python.  

Para este proyecto es necesario:
- Integrar información proveniente de distintas fuentes,  
- Optimizar la calidad y el rendimiento de la base de datos, y  
- Transformar los datos en conocimiento útil para la toma de decisiones.  

El resultado final es un conjunto de **scripts SQL** y un **notebook en Python** que permiten ejecutar el proceso de principio a fin, generando un dataset listo para análisis avanzado o modelado predictivo.

---

## Estructura del proyecto

El proyecto está dividido en tres fases, cada una centrada en una etapa clave del flujo de datos:

### 1. Integración y análisis exploratorio (SQL)
[Resultados.docx](Modulo1/Avance1/Resultados.docx)

- Carga y exploración de los datos en SQL.  
- Identificación de los **productos y vendedores más relevantes**.  
- Análisis de **comportamiento de clientes** y adopción de productos.  
- Uso de **funciones de ventana** para evaluar la participación dentro de cada categoría.  

> **Resultados:** consultas SQL optimizadas y reportes interpretativos que describen los patrones de ventas y concentración de mercado.

---

### 2. Optimización y automatización de la base de datos (SQL avanzado)
[ResultadosAvance2.docx](Modulo1/Avance2/ResultadosAvance2.docx)

- Limpieza y mejora de la calidad de los datos.  
- Creación de un **trigger** que registra automáticamente cuando un producto supera un umbral de ventas acumuladas.  
- **Registro y análisis de eventos** en una tabla de monitoreo.  
- Implementación de **índices individuales y compuestos** para optimizar tiempos de ejecución en consultas críticas.  

> **Resultados:** una base de datos más eficiente, segura y lista para escalar a entornos de análisis en producción.

---

### 3. Transformación y feature engineering (Python + Pandas)
[avance3.ipynb](Modulo1/Avance3/avance3.ipynb)

- Cálculo y validación del campo `TotalPrice` a partir de precios unitarios y descuentos.  
- Detección de **outliers** mediante el rango intercuartílico (IQR).  
- Creación de nuevas variables temporales y categóricas (hora de venta, tipo de día, etc.).  
- Cálculo de **edad y experiencia** de los empleados vinculados a las ventas.  
- Generación de un **dataset final** unificado, listo para análisis o modelado predictivo.  

> **Resultados:** un dataset limpio, enriquecido y estructurado, diseñado para maximizar el valor analítico de los datos.

---

## Estructura del Repositorio

```
proyecto-integrador-modulo1/
 ├── README.md               # Documento descriptivo del proyecto
 ├── Módulo 1	             # 
     ├── Avance 1
		 ├──*.SQL			 # consultas
		 ├──*.docx			 # Resultados
     ├── Avance 2
 		 ├──*.SQL			 # consultas
		 ├──*.docx			 # Resultados
	 ├── Avance 3
		 ├──avance3.ipynb	 # Notebook de Python

```
---

## 👤 Autor

**Nombre:** Mariana Mabel Gil  
**Correo:** marianagil@gmail.com  
**LinkedIn:** https://www.linkedin.com/in/mariana-gil-24667718/  
**GitHub:** https://github.com/marianagil68

---


