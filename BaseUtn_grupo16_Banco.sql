CREATE SCHEMA IF NOT EXISTS `BancoUTN_TPIntegrador` DEFAULT CHARACTER SET utf8 ;
USE `BancoUTN_TPIntegrador` ;

CREATE TABLE IF NOT EXISTS `Provincias` (
  `IdProvincia` INT NOT NULL AUTO_INCREMENT,
  `Descripcion` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`IdProvincia`)
) ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS `Localidades` (
  `IdLocalidad` INT NOT NULL AUTO_INCREMENT,
  `Descripcion` VARCHAR(100) NOT NULL,
  `IdProvincia` INT NOT NULL,
  PRIMARY KEY (`IdLocalidad`),
  INDEX `fk_Localidad_Provincia_idx` (`IdProvincia` ASC),
  CONSTRAINT `fk_Localidad_Provincia`
    FOREIGN KEY (`IdProvincia`)
    REFERENCES `Provincias` (`IdProvincia`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
) ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS `TiposUsuario` (
  `IdTipoUsuario` INT NOT NULL AUTO_INCREMENT,
  `Descripcion` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`IdTipoUsuario`)
) ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS `Usuarios` (
  `IdUsuario` INT NOT NULL AUTO_INCREMENT,
  `NombreUsuario` VARCHAR(50) UNIQUE NOT NULL,
  `Password` VARCHAR(255) NOT NULL,
  `IdTipoUsuario` INT NOT NULL,
  `FechaAlta` DATE NOT NULL,
  `EstadoActivo` BOOLEAN NOT NULL DEFAULT TRUE, -- Para bajas lógicas 
  PRIMARY KEY (`IdUsuario`),
  INDEX `fk_Usuario_TipoUsuario_idx` (`IdTipoUsuario` ASC),
  CONSTRAINT `fk_Usuario_TipoUsuario`
    FOREIGN KEY (`IdTipoUsuario`)
    REFERENCES `TiposUsuario` (`IdTipoUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
) ENGINE = InnoDB;



CREATE TABLE IF NOT EXISTS `Clientes` (
  `IdCliente` INT NOT NULL AUTO_INCREMENT,
  `DNI` VARCHAR(10) UNIQUE NOT NULL,
  `CUIL` VARCHAR(15) UNIQUE,
  `Nombre` VARCHAR(50) NOT NULL,
  `Apellido` VARCHAR(50) NOT NULL,
  `Sexo` VARCHAR(1) NOT NULL, -- Ej: 'M', 'F', 'O'
  `Nacionalidad` VARCHAR(50),
  `FechaNacimiento` DATE,
  `Direccion` VARCHAR(100),
  `IdLocalidad` INT, -- Relacion con Localidad
  `CorreoElectronico` VARCHAR(100),
  `Telefono` VARCHAR(20),
  `IdUsuario` INT UNIQUE NOT NULL, -- Clave Foránea a Usuarios (1-to-1) 
  `Estado` BOOLEAN NOT NULL DEFAULT TRUE, -- Para bajas lógicas 
  PRIMARY KEY (`IdCliente`),
  INDEX `fk_Cliente_Localidad_idx` (`IdLocalidad` ASC),
  INDEX `fk_Cliente_Usuario_idx` (`IdUsuario` ASC),
  CONSTRAINT `fk_Cliente_Localidad`
    FOREIGN KEY (`IdLocalidad`)
    REFERENCES `Localidades` (`IdLocalidad`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Cliente_Usuario`
    FOREIGN KEY (`IdUsuario`)
    REFERENCES `Usuarios` (`IdUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
) ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS `TiposCuenta` (
  `IdTipoCuenta` INT NOT NULL AUTO_INCREMENT,
  `Descripcion` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`IdTipoCuenta`)
) ENGINE = InnoDB;




CREATE TABLE IF NOT EXISTS `Cuentas` (
  `IdCuenta` INT NOT NULL AUTO_INCREMENT,
  `IdCliente` INT NOT NULL,
  `FechaCreacion` DATE NOT NULL,
  `IdTipoCuenta` INT NOT NULL,
  `NumeroCuenta` VARCHAR(20) UNIQUE NOT NULL,
  `CBU` VARCHAR(22) UNIQUE NOT NULL,
  `Saldo` DECIMAL(15, 2) NOT NULL,
  `Estado` BOOLEAN NOT NULL DEFAULT TRUE, -- Para bajas lógicas 
  PRIMARY KEY (`IdCuenta`),
  INDEX `fk_Cuenta_Cliente_idx` (`IdCliente` ASC),
  INDEX `fk_Cuenta_TipoCuenta_idx` (`IdTipoCuenta` ASC),
  CONSTRAINT `fk_Cuenta_Cliente`
    FOREIGN KEY (`IdCliente`)
    REFERENCES `Clientes` (`IdCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Cuenta_TipoCuenta`
    FOREIGN KEY (`IdTipoCuenta`)
    REFERENCES `TiposCuenta` (`IdTipoCuenta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `chk_SaldoPositivo` CHECK (`Saldo` >= 0) -- Las cuentas no pueden tener saldos negativos 
) ENGINE = InnoDB;



CREATE TABLE IF NOT EXISTS `Prestamos` (
  `IdPrestamo` INT NOT NULL AUTO_INCREMENT,
  `IdCliente` INT NOT NULL,
  `IdCuentaAsociada` INT NOT NULL, -- Cuenta donde se deposita el dinero 
  `FechaAlta` DATE NOT NULL,
  `ImportePedido` DECIMAL(15, 2) NOT NULL,
  `PlazoMeses` INT NOT NULL,
  `ImportePorMes` DECIMAL(15, 2) NOT NULL, -- Incluye intereses 
  `Interes` DECIMAL(5, 2), -- Añadido explícitamente para registro, aunque la cuota sea fija 
  `CantidadCuotas` INT NOT NULL,
  `Estado` VARCHAR(20) NOT NULL, -- Ej: 'PENDIENTE', 'APROBADO', 'RECHAZADO' 
  PRIMARY KEY (`IdPrestamo`),
  INDEX `fk_Prestamo_Cliente_idx` (`IdCliente` ASC),
  INDEX `fk_Prestamo_Cuenta_idx` (`IdCuentaAsociada` ASC),
  CONSTRAINT `fk_Prestamo_Cliente`
    FOREIGN KEY (`IdCliente`)
    REFERENCES `Clientes` (`IdCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Prestamo_Cuenta`
    FOREIGN KEY (`IdCuentaAsociada`)
    REFERENCES `Cuentas` (`IdCuenta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
) ENGINE = InnoDB;




CREATE TABLE IF NOT EXISTS `Cuotas` (
  `IdCuota` INT NOT NULL AUTO_INCREMENT,
  `IdPrestamo` INT NOT NULL,
  `NumeroCuota` INT NOT NULL,
  `Monto` DECIMAL(15, 2) NOT NULL,
  `FechaPago` DATE, -- NULL si está pendiente 
  `EstadoPago` VARCHAR(20) NOT NULL, -- Ej: 'PENDIENTE', 'PAGADA'
  PRIMARY KEY (`IdCuota`),
  INDEX `fk_Cuota_Prestamo_idx` (`IdPrestamo` ASC),
  CONSTRAINT `fk_Cuota_Prestamo`
    FOREIGN KEY (`IdPrestamo`)
    REFERENCES `Prestamos` (`IdPrestamo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
) ENGINE = InnoDB;




CREATE TABLE IF NOT EXISTS `TiposMovimiento` (
  `IdTipoMovimiento` INT NOT NULL AUTO_INCREMENT,
  `Descripcion` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`IdTipoMovimiento`)
) ENGINE = InnoDB;




CREATE TABLE IF NOT EXISTS `Movimientos` (
  `IdMovimiento` INT NOT NULL AUTO_INCREMENT,
  `FechaHora` DATETIME NOT NULL,
  `Concepto` VARCHAR(255),
  `Importe` DECIMAL(15, 2) NOT NULL,
  `IdTipoMovimiento` INT NOT NULL,
  `IdCuentaOrigen` INT NOT NULL, -- Cuenta afectada (origen en transf., destino en alta) 
  `IdCuentaDestino` INT, -- Solo para transferencias 
  PRIMARY KEY (`IdMovimiento`),
  INDEX `fk_Movimiento_TipoMovimiento_idx` (`IdTipoMovimiento` ASC),
  INDEX `fk_Movimiento_CuentaOrigen_idx` (`IdCuentaOrigen` ASC),
  INDEX `fk_Movimiento_CuentaDestino_idx` (`IdCuentaDestino` ASC),
  CONSTRAINT `fk_Movimiento_TipoMovimiento`
    FOREIGN KEY (`IdTipoMovimiento`)
    REFERENCES `TiposMovimiento` (`IdTipoMovimiento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Movimiento_CuentaOrigen`
    FOREIGN KEY (`IdCuentaOrigen`)
    REFERENCES `Cuentas` (`IdCuenta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Movimiento_CuentaDestino`
    FOREIGN KEY (`IdCuentaDestino`)
    REFERENCES `Cuentas` (`IdCuenta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
) ENGINE = InnoDB;


-- ingreso de datos para probar 
-- Tipos de Usuario
INSERT INTO `TiposUsuario` (`IdTipoUsuario`, `Descripcion`) VALUES (1, 'ADMINISTRADOR');
INSERT INTO `TiposUsuario` (`IdTipoUsuario`, `Descripcion`) VALUES (2, 'CLIENTE');

-- Tipos de Cuenta
INSERT INTO `TiposCuenta` (`IdTipoCuenta`, `Descripcion`) VALUES (1, 'Caja de Ahorro');
INSERT INTO `TiposCuenta` (`IdTipoCuenta`, `Descripcion`) VALUES (2, 'Cuenta Corriente');

-- Tipos de Movimiento
INSERT INTO `TiposMovimiento` (`IdTipoMovimiento`, `Descripcion`) VALUES (1, 'Alta de cuenta');
INSERT INTO `TiposMovimiento` (`IdTipoMovimiento`, `Descripcion`) VALUES (2, 'Alta de préstamo');
INSERT INTO `TiposMovimiento` (`IdTipoMovimiento`, `Descripcion`) VALUES (3, 'Pago de préstamo');
INSERT INTO `TiposMovimiento` (`IdTipoMovimiento`, `Descripcion`) VALUES (4, 'Transferencia'); 

-- Provincias
INSERT INTO Provincias (Descripcion) VALUES ('Buenos Aires');
INSERT INTO Provincias (Descripcion) VALUES ('Cordoba');
INSERT INTO Provincias (Descripcion) VALUES ('Santa Fe');


-- Localidades
INSERT INTO Localidades (Descripcion, IdProvincia) VALUES ('CABA', 1);
INSERT INTO Localidades (Descripcion, IdProvincia) VALUES ('La Plata', 1);
INSERT INTO Localidades (Descripcion, IdProvincia) VALUES ('Rosario', 3);
INSERT INTO Localidades (Descripcion, IdProvincia) VALUES ('Cordoba Capital', 2);


-- probamos insertando datos en las tablas principales 

 --  administrador 
INSERT INTO Usuarios (NombreUsuario, Password, IdTipoUsuario, FechaAlta, EstadoActivo)
VALUES ('adminbank', 'admin123', 1, CURDATE(), TRUE);


-- Usuariocliente
INSERT INTO Usuarios (NombreUsuario, Password, IdTipoUsuario, FechaAlta, EstadoActivo)
VALUES ('cliente1_usr', 'pass123', 2, CURDATE(), TRUE);

INSERT INTO Usuarios (NombreUsuario, Password, IdTipoUsuario, FechaAlta, EstadoActivo)
VALUES ('cliente2_usr', 'passabc', 2, CURDATE(), TRUE);

INSERT INTO Usuarios (NombreUsuario, Password, IdTipoUsuario, FechaAlta, EstadoActivo)
VALUES ('cliente3_usr', 'passxyz', 2, CURDATE(), TRUE);


-- cliente 
INSERT INTO Clientes (DNI, CUIL, Nombre, Apellido, Sexo, Nacionalidad, FechaNacimiento, Direccion, IdLocalidad, CorreoElectronico, Telefono, IdUsuario, Estado)
VALUES ('11111111', '20-11111111-1', 'Pepito', 'Jerez', 'M', 'Argentino', '1980-05-15', 'Calle Falsa 123', 1, 'pepito.jerez@email.com', '1123456789', (SELECT IdUsuario FROM Usuarios WHERE NombreUsuario = 'cliente1_usr'), TRUE);

INSERT INTO Clientes (DNI, CUIL, Nombre, Apellido, Sexo, Nacionalidad, FechaNacimiento, Direccion, IdLocalidad, CorreoElectronico, Telefono, IdUsuario, Estado)
VALUES ('22222222', '27-22222222-2', 'Maria', 'Gomez', 'F', 'Argentina', '1990-10-20', 'Av. Siempre Viva 742', 2, 'maria.gomez@email.com', '1198765432', (SELECT IdUsuario FROM Usuarios WHERE NombreUsuario = 'cliente2_usr'), TRUE);

INSERT INTO Clientes (DNI, CUIL, Nombre, Apellido, Sexo, Nacionalidad, FechaNacimiento, Direccion, IdLocalidad, CorreoElectronico, Telefono, IdUsuario, Estado)
VALUES ('33333333', '20-33333333-3', 'Carlos', 'Lopez', 'M', 'Argentino', '1995-03-01', 'Ruta 3 km 50', 3, 'carlos.lopez@email.com', '3415556677', (SELECT IdUsuario FROM Usuarios WHERE NombreUsuario = 'cliente3_usr'), TRUE);




-- Cuentas
-- Asumiendo que IdTipoCuenta 1 es 'Caja de Ahorro' y 2 es 'Cuenta Corriente'
-- Necesitas los IdCliente de los clientes recién creados
INSERT INTO Cuentas (IdCliente, FechaCreacion, IdTipoCuenta, NumeroCuenta, CBU, Saldo, Estado)
VALUES ((SELECT IdCliente FROM Clientes WHERE DNI = '11111111'), CURDATE(), 1, 'CA001-123456', '0000000000000000000001', 10000.00, TRUE); -- Monto inicial 10.000


INSERT INTO Cuentas (IdCliente, FechaCreacion, IdTipoCuenta, NumeroCuenta, CBU, Saldo, Estado)
VALUES ((SELECT IdCliente FROM Clientes WHERE DNI = '11111111'), CURDATE(), 2, 'CC001-654321', '0000000000000000000002', 5000.00, TRUE);

INSERT INTO Cuentas (IdCliente, FechaCreacion, IdTipoCuenta, NumeroCuenta, CBU, Saldo, Estado)
VALUES ((SELECT IdCliente FROM Clientes WHERE DNI = '22222222'), CURDATE(), 1, 'CA002-789012', '0000000000000000000003', 10000.00, TRUE);



INSERT INTO Prestamos (IdCliente, IdCuentaAsociada, FechaAlta, ImportePedido, PlazoMeses, ImportePorMes, Interes, CantidadCuotas, Estado)
VALUES (
    (SELECT IdCliente FROM Clientes WHERE DNI = '11111111'),
    (SELECT IdCuenta FROM Cuentas WHERE NumeroCuenta = 'CA001-123456'),
    CURDATE(),
    100000.00,
    12,
    9500.00, -- Ejemplo de importe por mes con intereses
    0.14, -- Ejemplo de tasa de interés anual o similar
    12,
    'PENDIENTE'
);



INSERT INTO Prestamos (IdCliente, IdCuentaAsociada, FechaAlta, ImportePedido, PlazoMeses, ImportePorMes, Interes, CantidadCuotas, Estado)
VALUES (
    (SELECT IdCliente FROM Clientes WHERE DNI = '22222222'),
    (SELECT IdCuenta FROM Cuentas WHERE NumeroCuenta = 'CA002-789012'),
    CURDATE(),
    50000.00,
    6,
    9000.00,
    0.10,
    6,
    'APROBADO'
);


-- Cuotas
-- Necesitas IdPrestamo
INSERT INTO Cuotas (IdPrestamo, NumeroCuota, Monto, FechaPago, EstadoPago)
VALUES ((SELECT IdPrestamo FROM Prestamos WHERE ImportePedido = 50000.00 LIMIT 1), 1, 9000.00, CURDATE(), 'PAGADA');
INSERT INTO Cuotas (IdPrestamo, NumeroCuota, Monto, FechaPago, EstadoPago)
VALUES ((SELECT IdPrestamo FROM Prestamos WHERE ImportePedido = 50000.00 LIMIT 1), 2, 9000.00, NULL, 'PENDIENTE');
INSERT INTO Cuotas (IdPrestamo, NumeroCuota, Monto, FechaPago, EstadoPago)
VALUES ((SELECT IdPrestamo FROM Prestamos WHERE ImportePedido = 100000.00 LIMIT 1), 1, 9500.00, NULL, 'PENDIENTE');


-- Movimientos
-- Asumiendo IdTipoMovimiento 1:Alta cuenta, 2:Alta prestamo, 3:Pago prestamo, 4:Transferencia
-- Necesitas IdCuentaOrigen y IdCuentaDestino (si aplica)
INSERT INTO Movimientos (FechaHora, Concepto, Importe, IdTipoMovimiento, IdCuentaOrigen, IdCuentaDestino)
VALUES (NOW(), 'Alta de Cuenta: CA001-123456', 10000.00, 1, (SELECT IdCuenta FROM Cuentas WHERE NumeroCuenta = 'CA001-123456'), NULL);

INSERT INTO Movimientos (FechaHora, Concepto, Importe, IdTipoMovimiento, IdCuentaOrigen, IdCuentaDestino)
VALUES (NOW(), 'Depósito inicial CC001-654321', 5000.00, 1, (SELECT IdCuenta FROM Cuentas WHERE NumeroCuenta = 'CC001-654321'), NULL);

INSERT INTO Movimientos (FechaHora, Concepto, Importe, IdTipoMovimiento, IdCuentaOrigen, IdCuentaDestino)
VALUES (NOW(), 'Pago Cuota Prestamo #1', -9000.00, 3, (SELECT IdCuenta FROM Cuentas WHERE NumeroCuenta = 'CA002-789012'), NULL);

-- Ejemplo de transferencia: Cliente1 a Cliente2 (desde CC001-654321 a CA002-789012)
INSERT INTO Movimientos (FechaHora, Concepto, Importe, IdTipoMovimiento, IdCuentaOrigen, IdCuentaDestino)
VALUES (NOW(), 'Transferencia a Maria Gomez', -100.00, 4, (SELECT IdCuenta FROM Cuentas WHERE NumeroCuenta = 'CC001-654321'), (SELECT IdCuenta FROM Cuentas WHERE NumeroCuenta = 'CA002-789012'));

INSERT INTO Movimientos (FechaHora, Concepto, Importe, IdTipoMovimiento, IdCuentaOrigen, IdCuentaDestino)
VALUES (NOW(), 'Transferencia de Juan Perez', 100.00, 4, (SELECT IdCuenta FROM Cuentas WHERE NumeroCuenta = 'CA002-789012'), (SELECT IdCuenta FROM Cuentas WHERE NumeroCuenta = 'CC001-654321'));







