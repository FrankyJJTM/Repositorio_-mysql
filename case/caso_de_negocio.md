# Caso de negocio de la Asociación Agrofrutos

## 1. Introducción

La Asociación Agrofrutos está orientada a la actividad agrícola y agrupa a productores que desarrollan labores relacionadas con el cultivo, la cosecha y la comercialización de productos agrícolas. Para organizar sus actividades, es importante disponer de información confiable sobre los socios, sus parcelas, las cosechas recibidas, los productos, los calibres, los almacenes y las existencias disponibles.

El proyecto Agrofrutos propone una base de datos relacional desarrollada en MySQL para centralizar y organizar la información del negocio. Esta estructura permitirá almacenar los datos de manera ordenada, mantener las relaciones entre las entidades y facilitar las consultas necesarias para las actividades de gestión.

## 2. Descripción de la situación actual

La gestión de información agrícola requiere registrar y consultar datos de distintas áreas de la asociación. Entre ellos se encuentran la información personal de los socios, la ubicación y extensión de sus parcelas, las entregas de cosecha, los productos agrícolas, sus calibres y las cantidades almacenadas.

Cuando esta información no se encuentra organizada en una base de datos centralizada, pueden presentarse dificultades para localizar registros, relacionar las entregas con los socios y las parcelas, consultar las existencias de productos y mantener actualizada la información.

Por esta razón, se plantea implementar una base de datos relacional que permita estructurar la información y establecer relaciones entre los datos que forman parte de las operaciones de Agrofrutos.

## 3. Problema identificado

La necesidad principal consiste en organizar y centralizar la información relacionada con las actividades de la Asociación Agrofrutos, evitando la dispersión de los registros y facilitando su consulta.

Entre las necesidades identificadas se encuentran:

- Mantener un registro organizado de los socios y sus parcelas.
- Registrar las recepciones de cosecha y sus respectivos detalles.
- Organizar la información de los productos agrícolas y sus calibres.
- Controlar las cantidades registradas en el inventario.
- Registrar los almacenes donde se encuentran las existencias.
- Almacenar los mensajes recibidos mediante el formulario de contacto.
- Mantener la integridad y consistencia de la información mediante relaciones entre tablas.

## 4. Objetivo general

Diseñar e implementar una base de datos relacional en MySQL para organizar y centralizar la información de la Asociación Agrofrutos, facilitando el registro, la consulta y la administración de los datos relacionados con sus socios, parcelas, cosechas, productos, calibres, inventario, almacenes y contactos.

## 5. Objetivos específicos

- Diseñar el modelo lógico de la base de datos, identificando las entidades, los atributos y las relaciones.
- Elaborar el modelo físico con los tipos de datos, las claves primarias y las claves foráneas.
- Crear las tablas necesarias para almacenar la información del negocio.
- Establecer relaciones que mantengan la integridad referencial entre las entidades.
- Incorporar registros iniciales para comprobar el funcionamiento de la base de datos.
- Facilitar la consulta y verificación de la información almacenada.
- Documentar la estructura mediante un diccionario de datos y scripts SQL.

## 6. Alcance del proyecto

El proyecto comprende el diseño y la implementación de una base de datos relacional para gestionar la información principal de Agrofrutos.

### 6.1. Información incluida

La base de datos contempla las siguientes entidades:

| Entidad | Información que almacena |
|---|---|
| Socios (`Partner`) | Datos de identificación, código de socio, teléfono, dirección y estado de certificación. |
| Parcelas (`Parcel`) | Ubicación, extensión, código de trazabilidad y socio relacionado. |
| Contactos (`Contact`) | Nombre, apellidos, teléfono, correo, mensaje y fecha de envío. |
| Recepciones de cosecha (`Harvest_Reception`) | Fecha de entrega, código de ingreso del lote, estado de calidad y observaciones. |
| Detalles de recepción (`Harvest_Receipt_Details`) | Cantidades recibidas, precio unitario establecido, importe total, producto y calibre. |
| Productos (`Product`) | Nombre, variedad y tipo de certificación. |
| Calibres (`Caliber`) | Código, rango de peso e información sobre el uso previsto. |
| Inventario (`Inventory_Stock`) | Código de lote de origen, cantidad disponible y fecha de actualización. |
| Almacenes (`Store`) | Nombre, ubicación y capacidad del almacén. |

### 6.2. Fuera del alcance

La implementación de la base de datos, por sí sola, no implica desarrollar automáticamente módulos completos de facturación, contabilidad, pagos bancarios, logística de transporte o reportes avanzados. Estas funcionalidades podrán incorporarse posteriormente si forman parte de los requisitos del proyecto.

## 7. Beneficiarios

Los principales beneficiarios del proyecto son:

- **Administradores de la asociación:** podrán disponer de información organizada para las actividades de gestión.
- **Socios productores:** sus datos y la información de sus parcelas podrán mantenerse registrados de forma estructurada.
- **Personal encargado de la recepción de cosechas:** podrá consultar los registros de recepción y sus detalles.
- **Personal responsable del inventario y almacenes:** contará con una estructura para registrar y consultar productos y cantidades.
- **Usuarios de la página web:** podrán enviar consultas mediante el formulario de contacto, cuyos datos podrán almacenarse en la tabla correspondiente cuando la aplicación esté conectada a la base de datos.

## 8. Reglas generales del negocio

Las siguientes reglas orientan el diseño de la base de datos y deben validarse con los responsables del negocio:

1. Cada socio debe contar con un identificador único dentro del sistema.
2. Un socio puede tener asociadas una o varias parcelas.
3. Cada parcela debe estar relacionada con un socio registrado.
4. Una recepción de cosecha debe identificar al socio y a la parcela correspondientes.
5. Una recepción puede contener uno o varios detalles de productos recibidos.
6. Cada detalle de recepción debe identificar el producto y el calibre correspondiente.
7. Un producto puede contar con diferentes calibres.
8. Los registros de inventario deben identificar el producto, el calibre y el almacén correspondientes.
9. Los mensajes de contacto deben conservar los datos proporcionados por el usuario y su fecha de registro.
10. Las claves primarias y foráneas deben utilizarse para mantener la integridad de las relaciones entre las tablas.

Estas reglas describen el comportamiento esperado del modelo de datos; las validaciones definitivas deben ajustarse a los requisitos reales de la asociación.

## 9. Beneficios esperados

La implementación de la base de datos permitirá:

- Centralizar la información del negocio.
- Facilitar la búsqueda y consulta de registros.
- Relacionar la información de los socios con sus parcelas y entregas de cosecha.
- Organizar los datos de productos, calibres, inventario y almacenes.
- Reducir inconsistencias mediante restricciones de integridad.
- Disponer de una estructura documentada que facilite el mantenimiento y las futuras mejoras del sistema.

## 10. Tecnologías utilizadas

- **MySQL:** sistema gestor de bases de datos relacionales.
- **SQL:** lenguaje utilizado para crear la estructura, definir relaciones y manipular registros.
- **MySQL Workbench:** herramienta gráfica para administrar la base de datos y ejecutar scripts SQL, si se utiliza en la implementación.
- **Oracle SQL Developer Data Modeler:** herramienta utilizada para elaborar los modelos de datos del proyecto.

## 11. Conclusión

El proyecto de base de datos Agrofrutos busca establecer una estructura organizada y consistente para gestionar la información fundamental de la asociación. El diseño de las entidades y sus relaciones constituye la base para implementar las tablas en MySQL y facilitar futuras operaciones de consulta, mantenimiento e integración con las aplicaciones del proyecto.

La documentación se complementa con el modelo lógico, el modelo físico, el diccionario de datos, el manual de implementación y los scripts SQL correspondientes.

