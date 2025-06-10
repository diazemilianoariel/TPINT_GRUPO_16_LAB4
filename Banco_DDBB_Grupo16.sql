-- 1. Crear la base de datos
CREATE DATABASE IF NOT EXISTS banco_utn_integrador;
USE banco_utn_integrador;

-- 2. Crear tabla TipoCuenta (cargado previamente)
CREATE TABLE TipoCuenta (
    idTipoCuenta INT PRIMARY KEY AUTO_INCREMENT,
    descripcion VARCHAR(50) NOT NULL UNIQUE
);

-- 3. Crear tabla TipoMovimiento (cargado previamente)
CREATE TABLE TipoMovimiento (
    idTipoMovimiento INT PRIMARY KEY AUTO_INCREMENT,
    descripcion VARCHAR(100) NOT NULL UNIQUE
);

-- 4. Crear tabla Provincia (para desplegables)
CREATE TABLE Provincia (
    idProvincia INT PRIMARY KEY AUTO_INCREMENT,
    nombreProvincia VARCHAR(100) NOT NULL UNIQUE
);

-- 5. Crear tabla Localidad (para desplegables)
CREATE TABLE Localidad (
    idLocalidad INT PRIMARY KEY AUTO_INCREMENT,
    nombreLocalidad VARCHAR(100) NOT NULL,
    idProvincia INT NOT NULL,
    FOREIGN KEY (idProvincia) REFERENCES Provincia(idProvincia)
);

-- 6. Crear tabla Usuario (para Login - Administrador y Clientes)
CREATE TABLE Usuario (
    idUsuario INT PRIMARY KEY AUTO_INCREMENT,
    nombreUsuario VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL, -- Almacenar hash de la contraseña, no texto plano
    tipoUsuario ENUM('Administrador', 'Cliente') NOT NULL,
    fechaAlta TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    activo BOOLEAN DEFAULT TRUE
);

-- 7. Crear tabla Cliente
CREATE TABLE Cliente (
    idCliente INT PRIMARY KEY AUTO_INCREMENT,
    dni VARCHAR(20) NOT NULL UNIQUE,
    cuil VARCHAR(20),
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    sexo VARCHAR(20),
    nacionalidad VARCHAR(50),
    fechaNacimiento DATE,
    direccion VARCHAR(255),
    idLocalidad INT,
    idProvincia INT,
    correoElectronico VARCHAR(100) UNIQUE,
    telefono VARCHAR(50),
    idUsuario INT UNIQUE NOT NULL, -- Un cliente tiene un único usuario de login
    activo BOOLEAN DEFAULT TRUE,
    FOREIGN KEY (idLocalidad) REFERENCES Localidad(idLocalidad),
    FOREIGN KEY (idProvincia) REFERENCES Provincia(idProvincia),
    FOREIGN KEY (idUsuario) REFERENCES Usuario(idUsuario)
);

-- 8. Crear tabla Cuenta
CREATE TABLE Cuenta (
    idCuenta INT PRIMARY KEY AUTO_INCREMENT,
    idCliente INT NOT NULL,
    idTipoCuenta INT NOT NULL,
    numeroCuenta VARCHAR(20) NOT NULL UNIQUE, -- Se podría generar un formato CBU aquí
    cbu VARCHAR(22) NOT NULL UNIQUE,
    fechaCreacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    saldo DECIMAL(15, 2) NOT NULL DEFAULT 10000.00, -- Monto inicial fijo de $10.000
    activo BOOLEAN DEFAULT TRUE, -- Para bajas lógicas y límite de 3 cuentas activas
    FOREIGN KEY (idCliente) REFERENCES Cliente(idCliente),
    FOREIGN KEY (idTipoCuenta) REFERENCES TipoCuenta(idTipoCuenta)
);

-- 9. Crear tabla Prestamo
CREATE TABLE Prestamo (
    idPrestamo INT PRIMARY KEY AUTO_INCREMENT,
    idCliente INT NOT NULL,
    idCuentaAsociada INT NOT NULL, -- Cuenta donde se deposita el dinero
    fechaAlta TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    importePedido DECIMAL(15, 2) NOT NULL,
    plazoMeses INT NOT NULL,
    importePorMes DECIMAL(15, 2) NOT NULL, -- Cuota fija (sin intereses por mora)
    cantidadCuotas INT NOT NULL,
    aprobado BOOLEAN DEFAULT FALSE, -- Por defecto no aprobado
    fechaAprobacion DATE, -- Se registra cuando se aprueba
    activo BOOLEAN DEFAULT TRUE, -- Para bajas lógicas
    FOREIGN KEY (idCliente) REFERENCES Cliente(idCliente),
    FOREIGN KEY (idCuentaAsociada) REFERENCES Cuenta(idCuenta)
);

-- 10. Crear tabla Cuota
CREATE TABLE Cuota (
    idCuota INT PRIMARY KEY AUTO_INCREMENT,
    idPrestamo INT NOT NULL,
    numeroCuota INT NOT NULL,
    monto DECIMAL(15, 2) NOT NULL,
    fechaVencimiento DATE, -- Fecha estimada para la gestión
    fechaPago DATE, -- Se registra cuando se paga
    pagada BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (idPrestamo) REFERENCES Prestamo(idPrestamo)
);

-- Datos iniciales (obligatorios para TipoCuenta, TipoMovimiento, Provincia, Localidad)
-- TipoCuenta
INSERT INTO TipoCuenta (descripcion) VALUES ('Caja de Ahorro');
INSERT INTO TipoCuenta (descripcion) VALUES ('Cuenta Corriente');


-- TipoMovimiento
INSERT INTO TipoMovimiento (descripcion) VALUES ('Alta de Cuenta');
INSERT INTO TipoMovimiento (descripcion) VALUES ('Alta de Préstamo');
INSERT INTO TipoMovimiento (descripcion) VALUES ('Pago de Préstamo');
INSERT INTO TipoMovimiento (descripcion) VALUES ('Transferencia');

-- Provincias (Ejemplos, puedes agregar más de Argentina si quieres)
INSERT INTO Provincia (nombreProvincia) VALUES ('Buenos Aires');
INSERT INTO Provincia (nombreProvincia) VALUES ('Córdoba');
INSERT INTO Provincia (nombreProvincia) VALUES ('Santa Fe');

-- Localidades (Ejemplos, asumiendo IDs de Provincia)
-- Si Buenos Aires es id 1
INSERT INTO Localidad (nombreLocalidad, idProvincia) VALUES ('General Pacheco', (SELECT idProvincia FROM Provincia WHERE nombreProvincia = 'Buenos Aires'));
INSERT INTO Localidad (nombreLocalidad, idProvincia) VALUES ('Tigre', (SELECT idProvincia FROM Provincia WHERE nombreProvincia = 'Buenos Aires'));
-- Si Córdoba es id 2
INSERT INTO Localidad (nombreLocalidad, idProvincia) VALUES ('Córdoba Capital', (SELECT idProvincia FROM Provincia WHERE nombreProvincia = 'Córdoba'));

-- Un usuario administrador inicial para poder ingresar al sistema
-- IMPORTANTE: En una aplicación real, la contraseña NUNCA debe guardarse en texto plano.
-- Aquí 'admin123' es solo para testeo. Luego deberás implementar en Java el hasheo de contraseñas.
INSERT INTO Usuario (nombreUsuario, password, tipoUsuario) VALUES ('admin', 'admin123', 'Administrador');