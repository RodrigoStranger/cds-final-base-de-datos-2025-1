USE FabiaNatura;

-- ===============================================
--                  POST Lineas
-- ===============================================
-- En el Frontend:
-- El nombre de la linea no debe estar vacío
-- Se debe validar que el nombre de la linea no exista en la base de datos
-- Se debe hacer un seleccionador para los proveedores: la línea solo puede contener 1 proveedor
-- Campos obligatorios: nombre_linea
-- Campos opcionales: ruc (null)
-- ===============================================
DELIMITER $$
CREATE PROCEDURE IF NOT EXISTS AgregarLinea(
    IN p_ruc CHAR(11), -- Puede ser NULL
    IN p_nombre_linea VARCHAR(100)
)
BEGIN
    INSERT INTO Lineas (ruc, nombre_linea)
    VALUES (p_ruc, p_nombre_linea);
END $$
DELIMITER ;

-- ===============================================
--                 GET Lineas
-- ===============================================
DELIMITER $$
CREATE PROCEDURE IF NOT EXISTS ObtenerLineas()
BEGIN
    SELECT 
        l.cod_linea,
        l.ruc,
        l.nombre_linea,
        l.fecha_registro,
        p.nombre AS proveedor
    FROM Lineas l
    LEFT JOIN Proveedores p ON l.ruc = p.ruc;
END $$
DELIMITER ;

-- ===============================================
--            GET Linea por cod_linea
-- ===============================================
DELIMITER $$
CREATE PROCEDURE IF NOT EXISTS ObtenerLineaPorCodLinea(
    IN p_cod_linea INT
)
BEGIN
    SELECT 
        l.cod_linea,
        l.ruc,
        l.nombre_linea,
        l.fecha_registro,
        p.nombre AS proveedor
    FROM Lineas l
    LEFT JOIN Proveedores p ON l.ruc = p.ruc
    WHERE l.cod_linea = p_cod_linea;
END $$
DELIMITER ;

-- ===============================================
--            PUT Linea por cod_linea
-- ===============================================
-- En el Frontend:
-- El nombre de la linea no debe estar vacío
-- Se debe validar que el nombre de la linea no exista en la base de datos
-- Se debe hacer un seleccionador para los proveedores: la línea solo puede contener 1 proveedor
-- Campos obligatorios: cod_linea, nombre_linea
-- Campos opcionales: ruc (null)
-- ===============================================
DELIMITER $$
CREATE PROCEDURE IF NOT EXISTS ActualizarLinea(
    IN p_cod_linea INT,
    IN p_ruc CHAR(11), -- Puede ser NULL
    IN p_nombre_linea VARCHAR(100)
)
BEGIN
    UPDATE Lineas
    SET 
        ruc = p_ruc,
        nombre_linea = p_nombre_linea,
        fecha_registro = CURRENT_TIMESTAMP
    WHERE cod_linea = p_cod_linea;
END $$
DELIMITER ;