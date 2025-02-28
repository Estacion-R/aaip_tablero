
# 📊 Índice de Transparencia - AAIP

<!-- badges: start -->
<!-- badges: end -->

Este repositorio contiene el código fuente del **Tablero de Índice de Transparencia** desarrollado con `R Markdown` y `bslib`.  

El objetivo del tablero es ofrecer una **visualización interactiva** de los datos del Índice de Transparencia, permitiendo analizar la información a través de **filtros, gráficos dinámicos y tablas interactivas**.

---

## 📁 **Estructura del Proyecto**

El proyecto está organizado de la siguiente manera:


## 📁 Estructura de Carpetas del Proyecto

```plaintext
📁 mi_tablero/
│── 📁 archivo/                 # Carpeta para archivos auxiliares o exportaciones
│── 📁 data/                    # Carpeta con los datos originales utilizados en el tablero
│── 📁 docs/                    # Documentación del proyecto (README, manuales, etc.)
│── 📁 estilo/                  # Archivos de estilos y configuración de diseño
│   ├── estilo_tablero.css      # Estilos personalizados para el tablero
│── 📁 lib/                     # Librerías o scripts adicionales
│── 📁 output_tablero/          # Carpeta donde se guarda el tablero generado en HTML
│   ├── Indice_Transparencia_AAIP.html  # Archivo final del tablero
│── 📁 output_graficos/         # Carpeta para exportar gráficos generados
│── 📁 R/                       # Código fuente del proyecto
│   ├── 00_librerias.R         # Carga de paquetes y librerías necesarias
│   ├── 00_funciones.R         # Funciones auxiliares
│   ├── 01_extraer.R           # Extracción de datos
│   ├── 02_transformar.R       # Transformación y limpieza de datos
│   ├── 03_filtros.R           # Definición de filtros interactivos
│   ├── 04_graficos.R          # Generación de gráficos con Plotly
│   ├── 99_manual_estilo.R     # Configuración de colores y estilos
│   ├── 📁 modulos/            # Módulos individuales del tablero
│       ├── mod_tarjeta_global.R     # Módulo de resumen global
│       ├── mod_tabla_general.R      # Módulo de tabla principal
│       ├── mod_serie_tiempo.R       # Módulo de gráficos de serie de tiempo
│       ├── mod_tabla_x_dimension.R  # Módulo de tablas por dimensión
│── 📄 .gitignore               # Archivo para ignorar archivos innecesarios en Git
│── 📄 aaip_tablero.Rproj       # Archivo de proyecto de RStudio
│── 📄 tablero_aaip.Rmd         # Archivo principal que genera el tablero
│── 📄 EJECUTAR_TABLERO.R       # Script para ejecutar el tablero rápidamente
```

---

## 🚀 **Requisitos**
Antes de ejecutar el tablero, asegúrate de tener instalado **R (versión 4.0 o superior)** y los paquetes necesarios.

### **🔹 Instalar librerías**
En la carpeta `R/00_librerias` encontrarás los scripts necesarios para instalar las librerías requeridas.

---

🛠️ Cómo Generar el Tablero

El tablero se genera a partir del archivo main_dashboard.Rmd. Para ejecutarlo y obtener un archivo HTML:

1. Abrir el proyecto de Rstudio
1. Ejecutar el script `EJECUTAR_TABLERO.R`
1. Revisar en la carpeta `output_tablero` el archivo HTML generado


🔄 Cómo Actualizar los Datos

Si necesitas actualizar los datos:

- Reemplaza el archivo de datos en la carpeta `data`
- En caso de que el nombre del archivo haya cambiado, revisar la ruta en el script `R/01_extraer.R`
- Ejecuta nuevamente el script `EJECUTAR_TABLERO.R`
