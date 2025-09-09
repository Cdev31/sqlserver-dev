-- =============================================
-- EJEMPLOS DE SQL SERVER 
-- =============================================

-- 1. SUBCONSULTAS
-- ================

-- Subconsulta en WHERE
SELECT nombre, apellido, salario
FROM empleados
WHERE salario > (SELECT AVG(salario) FROM empleados)
ORDER BY salario DESC;
-- Comentario: Esto encuentra empleados con salario arriba del promedio

-- Subconsulta en SELECT (correlacionada)
SELECT 
    e.nombre,
    e.apellido,
    e.departamento_id,
    (SELECT COUNT(*) FROM empleados e2 
     WHERE e2.departamento_id = e.departamento_id) AS total_en_depto
FROM empleados e;
-- Nota: Las subconsultas correlacionadas pueden ser lentas en tablas grandes

-- 2. FUNCIONES AGREGADAS Y GROUP BY
-- ================================

SELECT 
    departamento_id,
    COUNT(*) AS cantidad_empleados,
    AVG(salario) AS salario_promedio,
    MAX(salario) AS salario_maximo,
    MIN(salario) AS salario_minimo,
    SUM(salario) AS total_nomina
FROM empleados
WHERE activo = 1  -- Solo empleados activos
GROUP BY departamento_id
HAVING AVG(salario) > 50000  -- Filtra después de agrupar
ORDER BY salario_promedio DESC;
-- HAVING es como WHERE pero para grupos

-- 3. FUNCIONES ESCALARES
-- ======================

CREATE FUNCTION dbo.CalcularImpuesto (@salario DECIMAL(10,2))
RETURNS DECIMAL(10,2)
AS
BEGIN
    DECLARE @impuesto DECIMAL(10,2);
    
    -- Lógica de cálculo de impuesto (simplificada)
    IF @salario <= 10000
        SET @impuesto = @salario * 0.10;
    ELSE IF @salario <= 30000
        SET @impuesto = @salario * 0.15;
    ELSE
        SET @impuesto = @salario * 0.25;
    
    RETURN @impuesto;
END;
-- Comentario: Esta función podría necesitar actualizarse si cambian las tasas impositivas

-- 4. FUNCIONES DE TABLA
-- =====================

CREATE FUNCTION dbo.ObtenerEmpleadosPorDepartamento (@deptoId INT)
RETURNS TABLE
AS
RETURN
(
    SELECT 
        empleado_id,
        nombre,
        apellido,
        salario,
        fecha_contratacion
    FROM empleados
    WHERE departamento_id = @deptoId AND activo = 1
);
-- Uso: SELECT * FROM dbo.ObtenerEmpleadosPorDepartamento(5)

-- 5. VISTAS
-- =========

CREATE VIEW vw_ResumenDepartamentos AS
SELECT 
    d.departamento_id,
    d.nombre AS nombre_departamento,
    COUNT(e.empleado_id) AS total_empleados,
    AVG(e.salario) AS salario_promedio,
    SUM(e.salario) AS total_nomina
FROM departamentos d
LEFT JOIN empleados e ON d.departamento_id = e.departamento_id AND e.activo = 1
GROUP BY d.departamento_id, d.nombre;
-- Las vistas simplifican consultas complejas para los usuarios

-- 6. CURSORES
-- ===========

DECLARE @empleado_id INT, @nombre VARCHAR(50), @salario DECIMAL(10,2);

DECLARE cursor_empleados CURSOR FOR
SELECT empleado_id, nombre, salario
FROM empleados
WHERE departamento_id = 3;

OPEN cursor_empleados;

FETCH NEXT FROM cursor_empleados INTO @empleado_id, @nombre, @salario;

WHILE @@FETCH_STATUS = 0
BEGIN
    -- Procesar cada fila
    PRINT 'Empleado: ' + @nombre + ', Salario: ' + CAST(@salario AS VARCHAR);
    
    -- Aquí iría lógica de procesamiento
    
    FETCH NEXT FROM cursor_empleados INTO @empleado_id, @nombre, @salario;
END;

CLOSE cursor_empleados;
DEALLOCATE cursor_empleados;
-- Nota: Los cursores pueden ser lentos, evitar usarlos si hay forma de hacerlo con conjuntos

-- 7. PROCEDIMIENTOS ALMACENADOS
-- =============================

CREATE PROCEDURE dbo.sp_ActualizarSalario
    @empleado_id INT,
    @nuevo_salario DECIMAL(10,2),
    @usuario_modificacion VARCHAR(50)
AS
BEGIN
    SET NOCOUNT ON;
    
    BEGIN TRY
        BEGIN TRANSACTION;
        
        -- Validar que el salario no sea negativo
        IF @nuevo_salario < 0
        BEGIN
            RAISERROR('El salario no puede ser negativo', 16, 1);
            RETURN;
        END
        
        -- Actualizar salario
        UPDATE empleados 
        SET salario = @nuevo_salario,
            fecha_actualizacion = GETDATE(),
            usuario_actualizacion = @usuario_modificacion
        WHERE empleado_id = @empleado_id;
        
        -- Registrar en historial
        INSERT INTO historial_salarios (empleado_id, salario_anterior, salario_nuevo, fecha_cambio, usuario)
        SELECT empleado_id, salario, @nuevo_salario, GETDATE(), @usuario_modificacion
        FROM empleados
        WHERE empleado_id = @empleado_id;
        
        COMMIT TRANSACTION;
        
        PRINT 'Salario actualizado correctamente';
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        
        DECLARE @ErrorMsg VARCHAR(1000) = ERROR_MESSAGE();
        RAISERROR('Error al actualizar salario: %s', 16, 1, @ErrorMsg);
    END CATCH
END;
-- Los procedimientos encapsulan lógica de negocio

-- 8. USO DE WHILE, IF, TRY CATCH
-- ==============================

DECLARE @contador INT = 1;
DECLARE @total INT = (SELECT COUNT(*) FROM empleados WHERE activo = 1);

WHILE @contador <= @total
BEGIN
    DECLARE @emp_id INT, @sal_actual DECIMAL(10,2);
    
    -- Obtener empleado por número de fila
    SELECT @emp_id = empleado_id, @sal_actual = salario
    FROM (
        SELECT empleado_id, salario, ROW_NUMBER() OVER(ORDER BY empleado_id) as rn
        FROM empleados 
        WHERE activo = 1
    ) AS temp
    WHERE rn = @contador;
    
    -- Aplicar aumento si cumple condición
    IF @sal_actual < 50000
    BEGIN
        BEGIN TRY
            -- Aumento del 10% para salarios bajos
            UPDATE empleados 
            SET salario = salario * 1.10
            WHERE empleado_id = @emp_id;
            
            PRINT 'Aumento aplicado al empleado: ' + CAST(@emp_id AS VARCHAR);
        END TRY
        BEGIN CATCH
            PRINT 'Error al procesar empleado: ' + CAST(@emp_id AS VARCHAR);
            PRINT ERROR_MESSAGE();
        END CATCH
    END
    ELSE
    BEGIN
        PRINT 'Empleado ' + CAST(@emp_id AS VARCHAR) + ' no requiere aumento';
    END
    
    SET @contador = @contador + 1;
END;

-- 9. TRIGGERS
-- ===========

-- En SQL Server no existe BEFORE/AFTER como tal, pero se puede simular con INSTEAD OF
-- Para AFTER INSERT/UPDATE (se ejecuta después de la operación)
CREATE TRIGGER trg_AfterEmpleadoUpdate
ON empleados
AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;
    
    -- Registrar cambios en tabla de auditoría
    IF UPDATE(salario)
    BEGIN
        INSERT INTO auditoria_salarios (empleado_id, salario_anterior, salario_nuevo, fecha_cambio, usuario)
        SELECT 
            i.empleado_id,
            d.salario AS salario_anterior,
            i.salario AS salario_nuevo,
            GETDATE(),
            SYSTEM_USER
        FROM inserted i
        INNER JOIN deleted d ON i.empleado_id = d.empleado_id
        WHERE i.salario <> d.salario;
    END
END;
-- Este trigger se ejecuta después de actualizar empleados

-- Para simular BEFORE (usando INSTEAD OF)
CREATE TRIGGER trg_InsteadOfEmpleadoInsert
ON empleados
INSTEAD OF INSERT
AS
BEGIN
    SET NOCOUNT ON;
    
    -- Validar datos antes de insertar
    IF EXISTS (SELECT 1 FROM inserted WHERE salario < 0)
    BEGIN
        RAISERROR('El salario no puede ser negativo', 16, 1);
        RETURN;
    END
    
    -- Insertar con valores adicionales
    INSERT INTO empleados (nombre, apellido, salario, fecha_contratacion, activo, usuario_creacion)
    SELECT 
        nombre, 
        apellido, 
        salario, 
        COALESCE(fecha_contratacion, GETDATE()), 
        COALESCE(activo, 1),
        SYSTEM_USER
    FROM inserted;
END;
-- Este trigger se ejecuta en lugar del INSERT original

-- 10. OPERADORES LÓGICOS Y JOINS
-- ==============================

SELECT 
    e.nombre,
    e.apellido,
    e.salario,
    d.nombre AS departamento,
    p.nombre AS puesto
FROM empleados e
INNER JOIN departamentos d ON e.departamento_id = d.departamento_id
LEFT JOIN puestos p ON e.puesto_id = p.puesto_id  -- LEFT JOIN para datos opcionales
WHERE (e.salario > 50000 OR e.fecha_contratacion > '2020-01-01')
    AND e.activo = 1
    AND d.nombre LIKE '%Ventas%'
    AND (p.nombre LIKE '%Gerente%' OR p.nombre LIKE '%Senior%')
ORDER BY e.salario DESC, e.apellido ASC;
-- Uso de AND, OR y LIKE con patrones

-- 11. USO DE LIKE CON PATRONES
-- ============================

-- Buscar nombres que empiecen con 'J'
SELECT * FROM empleados WHERE nombre LIKE 'J%';

-- Buscar apellidos que terminen con 'ez'
SELECT * FROM empleados WHERE apellido LIKE '%ez';

-- Buscar nombres que contengan 'an' en cualquier posición
SELECT * FROM empleados WHERE nombre LIKE '%an%';

-- Buscar nombres con segunda letra 'a' y que terminen con 'o'
SELECT * FROM empleados WHERE nombre LIKE '_a%o';

-- Buscar nombres que empiecen con 'A' o 'B'
SELECT * FROM empleados WHERE nombre LIKE '[AB]%';

-- Buscar nombres que empiecen con letras de la A a la D
SELECT * FROM empleados WHERE nombre LIKE '[A-D]%';

-- Buscar nombres que NO empiecen con 'X'
SELECT * FROM empleados WHERE nombre LIKE '[^X]%';

-- 12. EJEMPLOS DE JOINS
-- =====================

-- INNER JOIN (solo registros que existen en ambas tablas)
SELECT e.nombre, e.apellido, d.nombre as departamento
FROM empleados e
INNER JOIN departamentos d ON e.departamento_id = d.departamento_id;

-- LEFT JOIN (todos los empleados, aunque no tengan departamento)
SELECT e.nombre, e.apellido, d.nombre as departamento
FROM empleados e
LEFT JOIN departamentos d ON e.departamento_id = d.departamento_id;

-- RIGHT JOIN (todos los departamentos, aunque no tengan empleados)
SELECT e.nombre, e.apellido, d.nombre as departamento
FROM empleados e
RIGHT JOIN departamentos d ON e.departamento_id = d.departamento_id;

-- FULL JOIN (todos los registros de ambas tablas)
SELECT e.nombre, e.apellido, d.nombre as departamento
FROM empleados e
FULL JOIN departamentos d ON e.departamento_id = d.departamento_id;

-- CROSS JOIN (producto cartesiano, cuidado con el rendimiento)
SELECT e.nombre, d.nombre as departamento
FROM empleados e
CROSS JOIN departamentos d;

-- 13. TRIGGERS PARA AFTER INSERT, UPDATE, DELETE
-- ==============================================

-- Trigger para AFTER INSERT
CREATE TRIGGER trg_AfterEmpleadoInsert
ON empleados
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;
    
    INSERT INTO historial_empleados (empleado_id, accion, fecha, usuario)
    SELECT empleado_id, 'INSERT', GETDATE(), SYSTEM_USER
    FROM inserted;
    
    PRINT 'Registro de inserción completado';
END;

-- Trigger para AFTER UPDATE
CREATE TRIGGER trg_AfterEmpleadoUpdate
ON empleados
AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;
    
    -- Registrar cambios específicos
    IF UPDATE(salario)
    BEGIN
        INSERT INTO historial_salarios (empleado_id, salario_anterior, salario_nuevo, fecha_cambio)
        SELECT 
            i.empleado_id,
            d.salario,
            i.salario,
            GETDATE()
        FROM inserted i
        INNER JOIN deleted d ON i.empleado_id = d.empleado_id;
    END
    
    INSERT INTO historial_empleados (empleado_id, accion, fecha, usuario)
    SELECT empleado_id, 'UPDATE', GETDATE(), SYSTEM_USER
    FROM inserted;
END;

-- Trigger para AFTER DELETE
CREATE TRIGGER trg_AfterEmpleadoDelete
ON empleados
AFTER DELETE
AS
BEGIN
    SET NOCOUNT ON;
    
    INSERT INTO empleados_eliminados (empleado_id, nombre, apellido, salario, fecha_eliminacion)
    SELECT empleado_id, nombre, apellido, salario, GETDATE()
    FROM deleted;
    
    INSERT INTO historial_empleados (empleado_id, accion, fecha, usuario)
    SELECT empleado_id, 'DELETE', GETDATE(), SYSTEM_USER
    FROM deleted;
    
    PRINT 'Registro de eliminación completado';
END;

-- 14. USO DE HAVING
-- =================

SELECT 
    departamento_id,
    COUNT(*) AS total_empleados,
    AVG(salario) AS salario_promedio
FROM empleados
WHERE activo = 1
GROUP BY departamento_id
HAVING AVG(salario) > 50000 AND COUNT(*) > 5
ORDER BY salario_promedio DESC;
-- HAVING filtra resultados después de la agrupación

-- 15. ORDER BY CON MÚLTIPLES COLUMNAS
-- ===================================

SELECT 
    nombre,
    apellido,
    salario,
    fecha_contratacion
FROM empleados
WHERE activo = 1
ORDER BY 
    departamento_id ASC,        -- Primero por departamento
    salario DESC,               -- Luego por salario (descendente)
    apellido ASC,               -- Luego por apellido
    nombre ASC;                 -- Finalmente por nombre