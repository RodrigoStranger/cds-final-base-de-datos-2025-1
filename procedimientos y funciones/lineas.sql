USE FabiaNatura;

DELIMITER $$
CREATE PROCEDURE IF NOT EXISTS AgregarLinea(
    IN p_ruc CHAR(11),
    IN p_nombre_linea VARCHAR(100)
)
BEGIN
    -- Validación de que el nombre de la línea no esté vacío
    IF p_nombre_linea IS NULL OR p_nombre_linea = '' THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El nombre de la línea no puede estar vacío';
    END IF;

    -- Validación de que el RUC y el nombre no estén vacíos
    IF (p_ruc IS NOT NULL AND p_ruc != '') THEN
        -- Verificar que el RUC tenga exactamente 11 caracteres
        IF LENGTH(p_ruc) != 11 THEN
            SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El RUC debe tener exactamente 11 caracteres';
        END IF;

        -- Verificar si el RUC existe en la tabla Proveedores
        IF NOT EXISTS (SELECT 1 FROM Proveedores WHERE ruc = p_ruc) THEN
            SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El RUC no existe en la base de datos';
        END IF;
    END IF;

    -- Verificar si el nombre de la línea es único en la tabla Lineas
    IF EXISTS (SELECT 1 FROM Lineas WHERE nombre_linea = p_nombre_linea) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El nombre de la línea ya existe en la base de datos';
    END IF;

    -- Insertar la nueva línea en la tabla Lineas
    INSERT INTO Lineas (ruc, nombre_linea, fecha_registro)
    VALUES (p_ruc, p_nombre_linea, CURRENT_TIMESTAMP);
END $$
DELIMITER ;