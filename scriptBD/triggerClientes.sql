CREATE DEFINER=`root`@`localhost` TRIGGER `bancotpintegrador`.`clientes_BEFORE_INSERT` BEFORE INSERT ON `clientes` FOR EACH ROW
BEGIN
 DECLARE vIdUsuario INT;

  IF NEW.IdUsuario IS NULL THEN
    INSERT INTO Usuarios (NombreUsuario, Password, IdTipoUsuario)
    VALUES (NULL, NULL, 2);

    SET vIdUsuario = LAST_INSERT_ID();
    SET NEW.IdUsuario = vIdUsuario;
  END IF;

END