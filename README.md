
¡Absolutamente! Aquí tienes una versión más detallada del README.md, expandiendo las descripciones y añadiendo algunos detalles técnicos:

# Biblioteca - Rol Center Personalizado y Gestión Mejorada para Microsoft Dynamics 365 Business Central

Este proyecto de extensión para Microsoft Dynamics 365 Business Central transforma la gestión de bibliotecas al introducir un rol center a medida para el gerente, optimizar la gestión de datos y automatizar procesos clave.

## Características Destacadas

### 1. Rol Center del Gerente de Biblioteca: Un Panel de Control Intuitivo

El nuevo rol center ofrece al gerente una visión holística y en tiempo real del estado de la biblioteca. Sus principales componentes son:

* **KPI's (Indicadores Clave de Rendimiento):** Métricas personalizables que muestran datos críticos como el número total de libros, usuarios activos, préstamos pendientes, tasas de devolución y más.
* **Gráficos Interactivos:** Visualizaciones dinámicas (gráficos de barras, circulares, etc.) que resumen tendencias y patrones en los datos de la biblioteca.
* **Listas Detalladas:** Acceso rápido a listas de libros más prestados, usuarios con retrasos, próximas devoluciones y otros datos relevantes.
* **Actividades y Notificaciones:** Un área dedicada para mostrar tareas pendientes, recordatorios y alertas importantes.
* **Contenedores Personalizables:** Flexibilidad para añadir, eliminar o reorganizar los elementos del rol center según las necesidades de cada biblioteca.

/![Role Center Inicial](/Imagenes/RolCenter_Principal.png)

### 2. Gestión de Datos Optimizada: Listas y Tarjetas Intuitivas

La gestión de datos se simplifica gracias a:

* **Listas Detalladas:** Cada tabla (libros, socios, préstamos, etc.) cuenta con una lista que muestra todos los registros de forma clara y organizada.
* **Tarjetas Informativas:** Al seleccionar un registro de la lista, se abre una tarjeta que proporciona información detallada y permite editar los campos.
* **Búsqueda y Filtrado Avanzados:** Encuentra rápidamente registros específicos utilizando filtros por campos, palabras clave o rangos de fechas.
* **Acciones Rápidas:** Realiza acciones comunes (editar, eliminar, imprimir) directamente desde las listas y tarjetas.

/![Lista de libros](/Imagenes/ListaLibros.png)

/![Carta de libros](/Imagenes/CardLibros.png)

### 3. Automatización de Números de Serie: Integración con Ventas y Cobros

La asignación de números de serie a los productos se automatiza mediante:

* **Eventos de Business Central:** La extensión se suscribe a eventos de creación de documentos de ventas y cobros.
* **Lógica de Asignación:** Al crear un nuevo documento, se genera automáticamente un número de serie único y se asigna al producto correspondiente.
* **Configuración Flexible:** El formato y la secuencia de los números de serie se pueden personalizar según las necesidades de la biblioteca.

/![Números de serie](/Imagenes/NosSerie.png)

/![Configuración de ventas y cobros](/Imagenes/confVentasCobros.png)
### 4. Validación de Fechas de Caducidad NIF: Cumplimiento Normativo

La extensión garantiza la validez de los NIF (Número de Identificación Fiscal) mediante:

* **Validación en Tiempo Real:** Al introducir o modificar un NIF, se verifica su formato y fecha de caducidad.
* **Avisos y Alertas:** Si un NIF es inválido o está próximo a caducar, se muestra un mensaje de advertencia al usuario.
* **Informes Personalizados:** Genera informes periódicos que listan los NIF caducados o próximos a caducar.

/![Comprobador de NIF](/Imagenes/NIFCheck.png)

## Tecnologías Utilizadas

* **Microsoft Dynamics 365 Business Central:** Plataforma base para la gestión empresarial.
* **AL (Lenguaje de Aplicaciones):** Lenguaje de programación utilizado para desarrollar la extensión.
* **Visual Studio Code:** Entorno de desarrollo integrado para AL.
* **Extensiones de Business Central:** Paquetes que amplían las funcionalidades estándar de Business Central.

## Instalación y Configuración

1. **Descargar la Extensión:** Obtén el archivo de extensión `.app` desde la sección de lanzamientos del repositorio.
2. **Importar en Business Central:** Sigue las instrucciones de importación de extensiones en Business Central.
3. **Publicar la Extensión:** Publica la extensión para que esté disponible en tu entorno de Business Central.
4. **Configurar el Rol Center:** Personaliza el diseño y los elementos del rol center según tus preferencias.
