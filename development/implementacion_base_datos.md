# Manual de implementación de la base de datos Agrofrutos

## 1. Introducción

El presente documento describe el procedimiento para implementar la base de datos del proyecto Agrofrutos utilizando MySQL. Se detallan los requisitos previos, la ejecución de los scripts SQL, la creación de las tablas, la inserción de registros y la verificación de la estructura de la base de datos.

## 2. Objetivo

Establecer un procedimiento ordenado para crear e implementar la base de datos del proyecto Agrofrutos, garantizando que las tablas, las relaciones y los registros se encuentren correctamente configurados.

## 3. Requisitos previos

Para realizar la implementación de la base de datos, se requiere lo siguiente:

- MySQL Server 8.x instalado y funcionando.
- MySQL Workbench o acceso a la consola de MySQL.
- Los scripts SQL del proyecto (`01_creacion_base_datos.sql` y `02_insercion_registros.sql`).
- Un usuario de MySQL con permisos para crear bases de datos, tablas e insertar registros.

## 4. Archivos de implementación

Los archivos SQL utilizados se encuentran en la carpeta `scripts/` del proyecto.

| Archivo | Descripción |
|---|---|
| `01_creacion_base_datos.sql` | Contiene las instrucciones SQL DDL para crear la base de datos, las 14 tablas y sus relaciones. |
| `02_insercion_registros.sql` | Contiene las instrucciones SQL DML para insertar los registros iniciales en las tablas (mínimo 10 por tabla). |

Los scripts deben ejecutarse en el orden indicado para garantizar que las tablas existan antes de insertar los registros.

## 5. Procedimiento de implementación

### 5.1. Iniciar el servicio de MySQL

Primero, se debe comprobar que MySQL Server se encuentre instalado y en ejecución. Posteriormente, se debe abrir MySQL Workbench e ingresar a la conexión configurada para acceder al servidor de base de datos.

### 5.2. Crear la base de datos y las tablas

Se debe abrir el archivo `01_creacion_base_datos.sql` desde MySQL Workbench y ejecutar las instrucciones SQL.

Este procedimiento permite crear la base de datos `agrofrutos_db`, las 14 tablas correspondientes y las restricciones necesarias para mantener la integridad de los datos.

La estructura contempla las siguientes 14 entidades:

- `Document_Type`: almacena los tipos de documentos de identidad.
- `Role`: registra los roles y permisos del sistema.
- `Product`: almacena los productos agrícolas (Palta, Maracuyá, Mango).
- `Store`: registra los almacenes y su capacidad.
- `Contact`: almacena los mensajes recibidos mediante el formulario de contacto web.
- `Customer`: registra la información de los clientes.
- `Partner`: almacena la información de los socios productores.
- `User`: registra los usuarios y credenciales del sistema.
- `Parcel`: registra las parcelas de los socios.
- `Plot_Product`: almacena la relación entre parcelas y productos sembrados.
- `Caliber`: almacena la información de los calibres por producto.
- `Harvest_Reception`: registra la recepción de las cosechas.
- `Harvest_Receipt_Detail`: almacena los detalles de las recepciones.
- `Inventory_Stock`: registra las existencias e inventario disponible.

### 5.3. Verificar la creación de la base de datos

Después de ejecutar el script, se debe actualizar el panel de esquemas de MySQL Workbench y comprobar que aparezca la base de datos `agrofrutos_db`.

También se pueden ejecutar las siguientes instrucciones:

```sql
SHOW DATABASES;

USE agrofrutos_db;

SHOW TABLES;

### 5.4. Insertar los registros iniciales
Una vez creada la estructura, se debe abrir el archivo 02_insercion_registros.sql y ejecutar sus instrucciones.

Este script permite incorporar los registros iniciales (mínimo 10 por tabla) necesarios para realizar pruebas y verificar el funcionamiento de las tablas y sus relaciones.

Se debe comprobar que la ejecución finalice correctamente y que no se presenten errores relacionados con las claves primarias, las claves foráneas o los tipos de datos.

### 5.5. Comprobar los registros insertados
Para verificar que los datos se hayan almacenado correctamente en las 14 tablas, se ejecutan consultas como las siguientes:
USE agrofrutos_db;

SELECT * FROM Document_Type;
SELECT * FROM Role;
SELECT * FROM Product;
SELECT * FROM Store;
SELECT * FROM Contact;
SELECT * FROM Customer;
SELECT * FROM Partner;
SELECT * FROM User;
SELECT * FROM Parcel;
SELECT * FROM Plot_Product;
SELECT * FROM Caliber;
SELECT * FROM Harvest_Reception;
SELECT * FROM Harvest_Receipt_Detail;
SELECT * FROM Inventory_Stock;

Estas consultas permiten visualizar los 10 registros almacenados en cada una de las tablas.

También se puede utilizar la función COUNT(*) para conocer la cantidad de registros existentes en una tabla:

SELECT COUNT(*) AS total_socios FROM Partner;

### 5.6. Verificar las relaciones entre las tablas
Las relaciones de la base de datos se establecen mediante claves primarias y claves foráneas. Estas restricciones permiten mantener la integridad referencial entre las entidades relacionadas.

Para comprobar las relaciones creadas, se deben revisar las claves foráneas definidas en las tablas desde MySQL Workbench.

También se puede ejecutar la siguiente consulta:

SELECT
    TABLE_NAME,
    CONSTRAINT_NAME,
    COLUMN_NAME,
    REFERENCED_TABLE_NAME,
    REFERENCED_COLUMN_NAME
FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE
WHERE TABLE_SCHEMA = 'agrofrutos_db'
  AND REFERENCED_TABLE_NAME IS NOT NULL;

  El resultado permite identificar las tablas que contienen claves foráneas y las columnas a las que hacen referencia.

6. Resultado esperado
Al finalizar la implementación, se espera contar con la base de datos agrofrutos_db creada en MySQL, con sus 14 tablas, relaciones y registros iniciales (10 por tabla) disponibles.

Asimismo, las consultas de verificación deben permitir visualizar las tablas y comprobar que los datos se hayan almacenado correctamente.

7. Recomendaciones
Ejecutar primero el script de creación y después el script de inserción.

Verificar que la conexión corresponda al servidor MySQL correcto.

Revisar los mensajes de ejecución después de ejecutar cada script.

No compartir contraseñas ni credenciales de acceso a la base de datos.

Realizar copias de seguridad antes de ejecutar modificaciones importantes.

Actualizar este manual cuando se realicen cambios en la estructura o en los scripts SQL.

8. Conclusión
La implementación de la base de datos permite disponer de una estructura organizada para gestionar la información de los socios, parcelas, productos, cosechas, calibres, inventario, almacenes y contactos del proyecto Agrofrutos.

El uso de scripts SQL facilita la creación de las tablas y la inserción de registros de manera ordenada, mientras que las consultas de verificación permiten comprobar los resultados de la implementación.