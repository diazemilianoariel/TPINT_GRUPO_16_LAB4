DELIMITER //

CREATE TRIGGER `BancoTpIntegrador3`.`Clientes_BEFORE_INSERT` 
BEFORE INSERT ON `Cliente` FOR EACH ROW
BEGIN
  DECLARE vIdUsuario INT;

  IF NEW.IdUsuario IS NULL THEN
    INSERT INTO Usuario (NombreUsuario, Password, IdTipoUsuario, Estado)
    VALUES (NULL, NULL, 2, 1);
    
    SET vIdUsuario = LAST_INSERT_ID();
    SET NEW.IdUsuario = vIdUsuario;
  END IF;
END//

DELIMITER ;