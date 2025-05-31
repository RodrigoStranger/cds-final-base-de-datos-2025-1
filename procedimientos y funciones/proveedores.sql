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