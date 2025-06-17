CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_IngresarCliente`(
  IN pDni VARCHAR(10),
  IN pCuil VARCHAR(15),
  IN pNombre VARCHAR(50),
  IN pApellido VARCHAR(50),
  IN pSexo CHAR(1),
  IN pFechaNacimiento DATE,
  IN pDireccion VARCHAR(100),
  IN pIdLocalidad INT
)
BEGIN
  DECLARE vIdUsuario INT;

  -- 1. Insertar usuario vacío (solo con campos NULL)
  INSERT INTO Usuarios (NombreUsuario, Password, IdTipoUsuario)
  VALUES (NULL, NULL, 2);

  -- 2. Obtener el último ID insertado
  SET vIdUsuario = LAST_INSERT_ID();

  -- 3. Insertar cliente con ese IdUsuario
  INSERT INTO Clientes (
    Dni, Cuil, Nombre, Apellido, Sexo, FechaNacimiento,
    Direccion, IdLocalidad, IdUsuario
  )
  VALUES (
    pDni, pCuil, pNombre, pApellido, pSexo, pFechaNacimiento,
    pDireccion, pIdLocalidad, vIdUsuario
  );
END