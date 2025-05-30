USE FabiaNatura;

-- ===============================================
--             POST Categorias
-- ===============================================
-- En el Frontend:
-- El nombre de la categoría no debe estar vacío
-- Se debe validar que el nombre de la categoría no exista en la base de datos
-- Campos obligatorios: nombre_categoria
-- Campos opcionales: descripcion (null)
-- ===============================================
DELIMITER $$
CREATE PROCEDURE IF NOT EXISTS AgregarCategoria(
    IN p_nombre_categoria VARCHAR(50),
    IN p_descripcion TEXT -- Puede ser NULL
)
BEGIN
    INSERT INTO Categorias (nombre, descripcion)
    VALUES (p_nombre_categoria, p_descripcion);
END $$
DELIMITER ;

-- ===============================================
--              GET Categorias
-- ===============================================
DELIMITER $$
CREATE PROCEDURE IF NOT EXISTS ObtenerTodasLasCategorias()
BEGIN
    SELECT 
        cod_categoria,
        nombre,
        descripcion,
        fecha_registro
    FROM Categorias;
END $$
DELIMITER ;

-- ===============================================
--            GET Categoria por cod_categoria
-- ===============================================
DELIMITER $$
CREATE PROCEDURE IF NOT EXISTS ObtenerCategoriaPorId(
    IN p_cod_categoria INT
)
BEGIN
    SELECT 
        cod_categoria,
        nombre,
        descripcion,
        fecha_registro
    FROM Categorias
    WHERE cod_categoria = p_cod_categoria;
END $$
DELIMITER ;

-- ===============================================
--            PUT Actualizar Categoria
-- ===============================================
-- En el Frontend:
-- El nombre de la categoría no debe estar vacío
-- Se debe validar que el nombre de la categoría no exista en la base de datos
-- Campos obligatorios: cod_categoria, nombre_categoria
-- Campos opcionales: descripcion (null)
-- ===============================================
DELIMITER $$
CREATE PROCEDURE IF NOT EXISTS ActualizarCategoria(
    IN p_cod_categoria INT,
    IN p_nombre_categoria VARCHAR(50),
    IN p_descripcion TEXT -- Puede ser NULL
)
BEGIN
    UPDATE Categorias
    SET 
        nombre = p_nombre_categoria,
        descripcion = p_descripcion,
        fecha_registro = CURRENT_TIMESTAMP
    WHERE cod_categoria = p_cod_categoria;
END $$
DELIMITER ;