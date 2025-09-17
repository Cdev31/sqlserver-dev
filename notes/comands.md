# Apuntes SQL Server – Bases del Motor y Comandos de Exploración

## 1. Bases de datos del sistema en SQL Server

SQL Server crea automáticamente **4 bases de datos principales del sistema** que cumplen roles internos:

- **master**  
  - Contiene toda la información de configuración del servidor.  
  - Almacena los logins, endpoints, configuración de instancias, y metadatos de todas las demás bases.  
  - Si se daña, SQL Server no arranca.  
  - Ejemplo de información: lista de bases de datos, ubicaciones de archivos.

- **tempdb**  
  - Base temporal que se recrea cada vez que el servidor se reinicia.  
  - Almacena:
    - Tablas temporales (`#tabla`, `##tabla`).
    - Variables de tabla.
    - Resultados intermedios de operaciones (ej: `ORDER BY`, `GROUP BY`, `JOIN` complejos).  
  - Suele ser la base que más crece con cargas de trabajo pesadas.

- **model**  
  - Es la **plantilla** para crear nuevas bases de datos.  
  - Cada vez que haces `CREATE DATABASE`, SQL Server copia la estructura de `model`.  
  - Si agregas objetos a `model` (tablas, procedimientos), se replican en toda nueva base (no recomendable salvo casos controlados).

- **msdb**  
  - Se usa por el **SQL Server Agent**.  
  - Almacena:
    - Jobs programados (tareas automáticas).
    - Backups y su historial.
    - Restauraciones realizadas.
    - Información de Service Broker y Database Mail.

---

## 2. Enlistar tablas de una base de datos

```sql
USE NombreDeLaBD;
GO

-- Método 1: usando la vista de sistema
SELECT name
FROM sys.tables;

-- Método 2: usando INFORMATION_SCHEMA
SELECT TABLE_NAME
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_TYPE = 'BASE TABLE';
```

## 3. Ver estructura de una 

```sql
-- Método 1: vista de columnas
SELECT COLUMN_NAME, DATA_TYPE, IS_NULLABLE, CHARACTER_MAXIMUM_LENGTH
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'NombreTabla';

-- Método 2: vista interna
EXEC sp_help 'NombreTabla';
```

## 4. Ver constraints de una base de datos

```sql
-- Constraints de una tabla específica
SELECT CONSTRAINT_NAME, CONSTRAINT_TYPE, TABLE_NAME
FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
WHERE TABLE_NAME = 'NombreTabla';

-- Detalles de claves foráneas
SELECT f.name AS FK_name,
       OBJECT_NAME(f.parent_object_id) AS TableName,
       COL_NAME(fc.parent_object_id, fc.parent_column_id) AS ColumnName,
       OBJECT_NAME(f.referenced_object_id) AS RefTableName,
       COL_NAME(fc.referenced_object_id, fc.referenced_column_id) AS RefColumnName
FROM sys.foreign_keys AS f
INNER JOIN sys.foreign_key_columns AS fc
    ON f.OBJECT_ID = fc.constraint_object_id
WHERE f.parent_object_id = OBJECT_ID('NombreTabla');
```

