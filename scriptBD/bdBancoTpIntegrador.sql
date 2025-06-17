CREATE DATABASE IF NOT EXISTS BancoTpIntegrador;
USE BancoTpIntegrador;

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
  FechaNacimiento DATE,
  Direccion VARCHAR(100),
  IdLocalidad INT,
  IdUsuario INT,
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