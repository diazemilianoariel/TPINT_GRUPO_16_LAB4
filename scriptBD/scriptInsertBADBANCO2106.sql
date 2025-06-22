CREATE DATABASE IF NOT EXISTS BancoTpIntegrador3;
USE BancoTpIntegrador3;

-- Provincias
CREATE TABLE Provincias (
  IdProvincia INT AUTO_INCREMENT PRIMARY KEY,
  Descripcion VARCHAR(100) NOT NULL
);

-- Localidades
CREATE TABLE Localidades (
  IdLocalidad INT AUTO_INCREMENT PRIMARY KEY,
  Descripcion VARCHAR(100) NOT NULL,
  IdProvincia INT,
  FOREIGN KEY (IdProvincia) REFERENCES Provincias(IdProvincia)
);

-- Tipos de usuario
CREATE TABLE TiposUsuario (
  IdTipoUsuario INT AUTO_INCREMENT PRIMARY KEY,
  Descripcion VARCHAR(50)
 
);

-- Usuariossp_IngresarClientesp_IngresarClientesp_IngresarCliente
CREATE TABLE Usuarios (
  IdUsuario INT AUTO_INCREMENT PRIMARY KEY,
  NombreUsuario VARCHAR(50),
  Password VARCHAR(255),
  IdTipoUsuario INT,
  Estado BOOLEAN DEFAULT 1,
  FOREIGN KEY (IdTipoUsuario) REFERENCES TiposUsuario(IdTipoUsuario)
);

-- Clientes
CREATE TABLE Clientes (
  IdCliente INT AUTO_INCREMENT PRIMARY KEY,
  Dni VARCHAR(10),
  Cuil VARCHAR(15),
  Nombre VARCHAR(50),
  Apellido VARCHAR(50),
  Sexo VARCHAR(1),
  Nacionalidad VARCHAR(50),
  FechaNacimiento DATE,
  Direccion VARCHAR(100),
  CorreoElectronico VARCHAR(50),
  Telefono VARCHAR(50),
  IdLocalidad INT,
  IdUsuario INT,
  Estado BOOLEAN DEFAULT 1,
  FOREIGN KEY (IdLocalidad) REFERENCES Localidades(IdLocalidad),
  FOREIGN KEY (IdUsuario) REFERENCES Usuarios(IdUsuario)
);

-- Tipos de cuenta
CREATE TABLE TiposCuenta (
  IdTipoCuenta INT AUTO_INCREMENT PRIMARY KEY,
  Descripcion VARCHAR(50)
);

-- Cuentas
CREATE TABLE Cuentas (
  IdCuenta INT AUTO_INCREMENT PRIMARY KEY,
  IdCliente INT,
  FechaCreacion DATE,
  IdTipoCuenta INT,
  NumeroCuenta VARCHAR(20),
  Cbu VARCHAR(22),
  Saldo DECIMAL(15,2),
  Estado BOOLEAN DEFAULT 1,
  FOREIGN KEY (IdCliente) REFERENCES Clientes(IdCliente),
  FOREIGN KEY (IdTipoCuenta) REFERENCES TiposCuenta(IdTipoCuenta)
);

-- Prestamos
CREATE TABLE Prestamos (
  IdPrestamo INT AUTO_INCREMENT PRIMARY KEY,
  IdCliente INT,
  IdCuentaAsociada INT,
  FechaAlta DATE,
  ImportePedido DECIMAL(15,2),
  PlazoMeses INT,
  ImportePorMes DECIMAL(15,2),
  Interes DECIMAL(5,2),
  CantidadCuotas INT,
  Estado BOOLEAN DEFAULT 1,
  FOREIGN KEY (IdCliente) REFERENCES Clientes(IdCliente),
  FOREIGN KEY (IdCuentaAsociada) REFERENCES Cuentas(IdCuenta)
);

-- Cuotas
CREATE TABLE Cuotas (
  IdCuota INT AUTO_INCREMENT PRIMARY KEY,
  IdPrestamo INT,
  NumeroCuota INT,
  Monto DECIMAL(15,2),
  FechaPago DATE,
  Estado BOOLEAN DEFAULT 0,
  FOREIGN KEY (IdPrestamo) REFERENCES Prestamos(IdPrestamo)
  );

-- Tipos de movimiento
CREATE TABLE TiposMovimiento (
  IdTipoMovimiento INT AUTO_INCREMENT PRIMARY KEY,
  Descripcion VARCHAR(100)
);

-- Movimientos
CREATE TABLE Movimientos (
  IdMovimiento INT AUTO_INCREMENT PRIMARY KEY,
  FechaHora DATETIME,
  Referencia VARCHAR(255),
  Importe DECIMAL(15,2),
  IdTipoMovimiento INT,
  IdCuentaOrigen INT,
  IdCuentaDestino INT,
  FOREIGN KEY (IdTipoMovimiento) REFERENCES TiposMovimiento(IdTipoMovimiento),
  FOREIGN KEY (IdCuentaOrigen) REFERENCES Cuentas(IdCuenta),
  FOREIGN KEY (IdCuentaDestino) REFERENCES Cuentas(IdCuenta)
);



-- insert 
USE BancoTpIntegrador3;
-- Provincias
INSERT INTO Provincias (Descripcion) VALUES ('San Luis');
INSERT INTO Provincias (Descripcion) VALUES ('Misiones');
INSERT INTO Provincias (Descripcion) VALUES ('Cordoba');
INSERT INTO Provincias (Descripcion) VALUES ('Buenos Aires');
INSERT INTO Provincias (Descripcion) VALUES ('La Rioja');
INSERT INTO Provincias (Descripcion) VALUES ('Tierra del Fuego');
INSERT INTO Provincias (Descripcion) VALUES ('Mendoza');
INSERT INTO Provincias (Descripcion) VALUES ('Santa Cruz');
INSERT INTO Provincias (Descripcion) VALUES ('Formosa');
INSERT INTO Provincias (Descripcion) VALUES ('Tucuman');
INSERT INTO Provincias (Descripcion) VALUES ('Jujuy');
INSERT INTO Provincias (Descripcion) VALUES ('Neuquen');
INSERT INTO Provincias (Descripcion) VALUES ('La Pampa');
INSERT INTO Provincias (Descripcion) VALUES ('Rio Negro');
INSERT INTO Provincias (Descripcion) VALUES ('Entre Rios');
INSERT INTO Provincias (Descripcion) VALUES ('Chaco');
INSERT INTO Provincias (Descripcion) VALUES ('Chubut');
INSERT INTO Provincias (Descripcion) VALUES ('Santa Fe');



USE BancoTpIntegrador3;
-- Localidades
INSERT INTO Localidades (Descripcion, IdProvincia) VALUES ('Villa Mercedez', 1);
INSERT INTO Localidades (Descripcion, IdProvincia) VALUES ('Posadas', 2);
INSERT INTO Localidades (Descripcion, IdProvincia) VALUES ('Rio Cuarto', 3);
INSERT INTO Localidades (Descripcion, IdProvincia) VALUES ('Florencio Varela', 4);
INSERT INTO Localidades (Descripcion, IdProvincia) VALUES ('Chilecito', 5);
INSERT INTO Localidades (Descripcion, IdProvincia) VALUES ('Rio Grande', 6);
INSERT INTO Localidades (Descripcion, IdProvincia) VALUES ('Lujan de Cuyo', 7);
INSERT INTO Localidades (Descripcion, IdProvincia) VALUES ('Caleta Olivia', 8);
INSERT INTO Localidades (Descripcion, IdProvincia) VALUES ('Clorinda', 9);
INSERT INTO Localidades (Descripcion, IdProvincia) VALUES ('Tafi', 10);
INSERT INTO Localidades (Descripcion, IdProvincia) VALUES ('Tilcara', 11);
INSERT INTO Localidades (Descripcion, IdProvincia) VALUES ('Zapala', 12);
INSERT INTO Localidades (Descripcion, IdProvincia) VALUES ('Santa Rosa', 13);
INSERT INTO Localidades (Descripcion, IdProvincia) VALUES ('Viedma', 14);
INSERT INTO Localidades (Descripcion, IdProvincia) VALUES ('Colon', 15);
INSERT INTO Localidades (Descripcion, IdProvincia) VALUES ('Villa Angela', 16);
INSERT INTO Localidades (Descripcion, IdProvincia) VALUES ('Puerto Madryn', 17);
INSERT INTO Localidades (Descripcion, IdProvincia) VALUES ('Rafaela', 18);


USE BancoTpIntegrador3;
-- TiposUsuario
INSERT INTO TiposUsuario (Descripcion) VALUES ('Administrador');
INSERT INTO TiposUsuario (Descripcion) VALUES ('Cliente');



USE BancoTpIntegrador3;
-- Usuarios
INSERT INTO Usuarios (NombreUsuario, Password, IdTipoUsuario, Estado) VALUES ('adminbank', 'admin123', 1 , 1);
INSERT INTO Usuarios (NombreUsuario, Password, IdTipoUsuario, Estado) VALUES ('clienteAmoMariaFernanda', 'cliente1', 2, 1);
INSERT INTO Usuarios (NombreUsuario, Password, IdTipoUsuario, Estado) VALUES ('clienteVenecioSalvador', 'cliente2', 2, 1);
INSERT INTO Usuarios (NombreUsuario, Password, IdTipoUsuario, Estado) VALUES ('clientetamaramarilyn', 'cliente3', 2, 1);


USE BancoTpIntegrador3;
-- Clientes

INSERT INTO Clientes (
  Dni, Cuil, Nombre, Apellido, Sexo, Nacionalidad, FechaNacimiento,
  Direccion, CorreoElectronico, Telefono, IdLocalidad, IdUsuario,Estado 
) VALUES (
  '12345688', '21-12345688-5', 'Maria Fernanda', 'Amo', 'F', 'ARGENTINA', '1990-06-20', 
  'Rambla 999', 'mariafernandaamo@hotmail.com', '1588977400', 2, 2, 1 
);

INSERT INTO Clientes (
  Dni, Cuil, Nombre, Apellido, Sexo, Nacionalidad, FechaNacimiento,
  Direccion, CorreoElectronico, Telefono, IdLocalidad, IdUsuario,Estado 
) VALUES (
  '31553699', '20-31553699-5', 'Salvador', 'Venecio', 'M', 'ARGENTINA', '1985-10-02', 
  'Calle ILDEFONZO 3456', 'salvadorvenecio@hotmail.com', '1578599666', 1, 3, 1 
);


INSERT INTO Clientes (
  Dni, Cuil, Nombre, Apellido, Sexo, Nacionalidad, FechaNacimiento,
  Direccion, CorreoElectronico, Telefono, IdLocalidad, IdUsuario,Estado 
) VALUES (
  '30123456', '20-30123456-5', 'Tamara', 'Marilyn', 'F', 'ARGENTINA', '1993-08-20', 
  'Calle Sol 123', 'tamaramarilyn@hotmail.com', '1500055500', 1, 4, 1 
);





USE BancoTpIntegrador3;
-- TiposCuenta
INSERT INTO TiposCuenta (Descripcion) VALUES ('Caja de Ahorro');
INSERT INTO TiposCuenta (Descripcion) VALUES ('Cuenta Corriente');

USE BancoTpIntegrador3;
-- Cuentas
INSERT INTO Cuentas (IdCliente, FechaCreacion, IdTipoCuenta, NumeroCuenta, Cbu, Saldo, Estado) VALUES (1, '2022-12-31', 1, '3260842187', '4996864450897117307369', 2560000, 1);
INSERT INTO Cuentas (IdCliente, FechaCreacion, IdTipoCuenta, NumeroCuenta, Cbu, Saldo, Estado) VALUES (2, '2024-08-13', 2, '2554039848', '2702798028225840886633', 23020.94, 1);
INSERT INTO Cuentas (IdCliente, FechaCreacion, IdTipoCuenta, NumeroCuenta, Cbu, Saldo, Estado) VALUES (2, '2023-05-14', 1, '8585583166', '1722281252935679048636', 35616.18, 1);
INSERT INTO Cuentas (IdCliente, FechaCreacion, IdTipoCuenta, NumeroCuenta, Cbu, Saldo, Estado) VALUES (3, '2023-09-18', 2, '9752058817', '8247290269994889654420', 23069.43, 1);

USE BancoTpIntegrador3;
-- Prestamos
INSERT INTO Prestamos (IdCliente, IdCuentaAsociada, FechaAlta, ImportePedido, PlazoMeses, ImportePorMes, Interes, CantidadCuotas, Estado) VALUES (1, 1, '2025-03-21', 473118.4, 36, 17100.6, 30.12, 36, 1);
INSERT INTO Prestamos (IdCliente, IdCuentaAsociada, FechaAlta, ImportePedido, PlazoMeses, ImportePorMes, Interes, CantidadCuotas, Estado) VALUES (2, 2, '2024-06-16', 213899.66, 12, 24682.24, 38.47, 12, 1);
INSERT INTO Prestamos (IdCliente, IdCuentaAsociada, FechaAlta, ImportePedido, PlazoMeses, ImportePorMes, Interes, CantidadCuotas, Estado) VALUES (3, 4, '2024-12-07', 464346.89, 36, 15403.42, 19.42, 36, 1);


-- USE BancoTpIntegrador3;
-- Cuotas aun no lo agrego
-- INSERT INTO Cuotas (IdPrestamo, NumeroCuota, Monto, FechaPago) VALUES (1, 1, 16527.34, '2025-06-15');
-- INSERT INTO Cuotas (IdPrestamo, NumeroCuota, Monto, FechaPago) VALUES (2, 2, 11831.24, '2025-06-15');
-- INSERT INTO Cuotas (IdPrestamo, NumeroCuota, Monto, FechaPago) VALUES (3, 3, 18292.05, '2025-06-15');


USE BancoTpIntegrador3;
-- TiposMovimientoclientes_BEFORE_INSERT
INSERT INTO TiposMovimiento (Descripcion) VALUES ('Alta Cuenta');
INSERT INTO TiposMovimiento (Descripcion) VALUES ('Alta Prestamo');
INSERT INTO TiposMovimiento (Descripcion) VALUES ('Pago Prestamo');
INSERT INTO TiposMovimiento (Descripcion) VALUES ('Transferencia');


USE BancoTpIntegrador3;
-- Movimientos
INSERT INTO Movimientos (FechaHora, Referencia, Importe, IdTipoMovimiento, IdCuentaOrigen, IdCuentaDestino) VALUES ('2025-04-18 21:16:35', 'deposito a cuenta', 1051.02, 2, 3, 1);
INSERT INTO Movimientos (FechaHora, Referencia, Importe, IdTipoMovimiento, IdCuentaOrigen, IdCuentaDestino) VALUES ('2025-03-28 07:14:33', 'tranferencia a cuenta', 42979.87, 1, 4, 3);
-- INSERT INTO Movimientos (FechaHora, Referencia, Importe, IdTipoMovimiento, IdCuentaOrigen, IdCuentaDestino) VALUES ('2025-03-29 04:10:35', 'pago prestamo', 47194.34, 10, 4, 2);
INSERT INTO Movimientos (FechaHora, Referencia, Importe, IdTipoMovimiento, IdCuentaOrigen, IdCuentaDestino) VALUES ('2024-07-03 20:58:32', 'deposito a cuenta', 27372.81, 1, 3, 2);


-- prueba del trigger (SI AGREGAN UN CLIENTE SE AGREGA AUTOMATICAMENTE A LA TABLA USUARIOS GENERANDO UN IDUSUARIO QUE SE CARGA EN LA TABLA CLIENTES, Y NOMBREUSUARIO Y PASSWORD VACIO)
INSERT INTO Clientes (
Dni, Cuil, Nombre, Apellido, Sexo, Nacionalidad, FechaNacimiento,
Direccion, CorreoElectronico, Telefono, IdLocalidad, IdUsuario,Estado 
) VALUES (
 '29685599', '20-29685599-5', 'Homero', 'Chispa', 'M', 'ARGENTINA', '1986-06-14', 
 'Calle luna 689', 'homerochispa@hotmail.com', '15777888', 3, NULL, 1 
 );

-- vuelvo a probar procedimiento almacenado y trigger funciona correctamente 2106
INSERT INTO Clientes (
Dni, Cuil, Nombre, Apellido, Sexo, Nacionalidad, FechaNacimiento,
Direccion, CorreoElectronico, Telefono, IdLocalidad, IdUsuario,Estado 
) VALUES (
 '20125697', '21-20125697-4', 'Margarita', 'Crepe', 'F', 'ARGENTINA', '1963-03-10', 
 'Calle arbolada 1256', 'margaritacrepe@hotmail.com', '15010012', 4, NULL, 1 
 );

