DELIMITER //

CREATE PROCEDURE `sp_IngresarCliente`(
  IN pDni VARCHAR(10),
  IN pCuil VARCHAR(15),
  IN pNombre VARCHAR(50),
  IN pApellido VARCHAR(50),
  IN pSexo CHAR(1),
  IN pNacionalidad VARCHAR(50),
  IN pFechaNacimiento DATE,
  IN pDireccion VARCHAR(100),
  IN pCorreoElectronico VARCHAR(50),
  IN pTelefono VARCHAR(50),
  IN pIdLocalidad INT
)
BEGIN
  DECLARE vIdUsuario INT;

  -- 1. Insertar usuario vacío (solo con campos NULL)
  INSERT INTO Usuario (NombreUsuario, Password, IdTipoUsuario, Estado)
  VALUES (NULL, NULL, 2, 1);

  -- 2. Obtener el último ID insertado
  SET vIdUsuario = LAST_INSERT_ID();

  -- 3. Insertar cliente con ese IdUsuario
  INSERT INTO Cliente (
    Dni, Cuil, Nombre, Apellido, Sexo, Nacionalidad, FechaNacimiento,
    Direccion, CorreoElectronico, Telefono, IdLocalidad, IdUsuario, Estado
  )
  VALUES (
    pDni, pCuil, pNombre, pApellido, pSexo, pNacionalidad, pFechaNacimiento,
    pDireccion, pCorreoElectronico, pTelefono, pIdLocalidad, vIdUsuario, 1
  );
END //

DELIMITER ;