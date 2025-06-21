USE FabiaNatura;

-- ===============================================
--              GET Proveedores
-- ===============================================
DELIMITER $$
CREATE PROCEDURE IF NOT EXISTS ObtenerTodosLosProveedores()
BEGIN
    SELECT 
        p.ruc,
        p.nombre,
        p.fecha_registro,
        tp.telefono
    FROM Proveedores p
    INNER JOIN Telefonos_Proveedores tp ON p.ruc = tp.ruc;
END $$
DELIMITER ;

-- ===============================================
--              GET Proveedores por RUC
-- ===============================================
DELIMITER $$
CREATE PROCEDURE IF NOT EXISTS ObtenerProveedorPorRUC(IN p_ruc VARCHAR(11))
BEGIN
    SELECT 
        p.ruc,
        p.nombre,
        p.fecha_registro,
        tp.telefono
    FROM Proveedores p
    INNER JOIN Telefonos_Proveedores tp ON p.ruc = tp.ruc
    WHERE p.ruc = p_ruc;
END $$
DELIMITER ;

-- ===============================================
--              POST Proveedores
-- ===============================================
-- En el frontend:
-- El RUC no debe estar vacío
-- El nombre no debe estar vacío
-- El teléfono no debe estar vacío
-- Se debe validar que el RUC no exista en la base de datos
-- Se debe validar que el telefono no exista en la tabla Telefonos_Proveedores y Telefonos_Personas
-- ===============================================

DELIMITER $$
CREATE PROCEDURE IF NOT EXISTS AgregarProveedor(
    IN p_ruc VARCHAR(11),
    IN p_nombre VARCHAR(100),
    IN p_telefonoProveedor VARCHAR(15)
)
BEGIN
    INSERT INTO Proveedores (
        ruc,
        nombre
    ) VALUES (
        p_ruc,
        p_nombre
    );
    INSERT INTO Telefonos_Proveedores (
        ruc,
        telefono
    ) VALUES (
        p_ruc,
        p_telefonoProveedor
    );
END $$
DELIMITER;


-- ===============================================
--              PUT Proveedores
-- ===============================================
-- En el frontend:
-- El RUC no debe estar vacío
-- El nombre no debe estar vacío
-- El teléfono no debe estar vacío
-- Se debe validar que el RUC no exista en la base de datos
-- Se debe validar que el telefono no exista en la tabla Telefonos_Proveedores y Telefonos_Personas
-- ===============================================

DELIMITER $$
CREATE PROCEDURE IF NOT EXISTS ActualizarProveedor(
    IN p_ruc VARCHAR(11),
    IN p_nombre VARCHAR(100),
    IN p_telefonoProveedor VARCHAR(15)
)
BEGIN
    UPDATE Proveedores
    SET 
        nombre = p_nombre,
        fecha_registro = CURRENT_TIMESTAMP
    WHERE ruc = p_ruc;

    UPDATE Telefonos_Proveedores
    SET 
        telefono = p_telefonoProveedor
    WHERE ruc = p_ruc;
END $$
DELIMITER ;