

USE BancoTpIntegrador;


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



USE BancoTpIntegrador;
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


USE BancoTpIntegrador;
-- TiposUsuario
INSERT INTO TiposUsuario (Descripcion) VALUES ('Administrador');
INSERT INTO TiposUsuario (Descripcion) VALUES ('Cliente');



USE BancoTpIntegrador;
-- Usuarios
INSERT INTO Usuarios (NombreUsuario, Password, IdTipoUsuario) VALUES ('adminbank', 'admin123', 1);
INSERT INTO Usuarios (NombreUsuario, Password, IdTipoUsuario) VALUES ('clienteAmoMariaFernanda', 'cliente1', 2);
INSERT INTO Usuarios (NombreUsuario, Password, IdTipoUsuario) VALUES ('clienteVenecioSalvador', 'cliente2', 2);



USE BancoTpIntegrador;
-- Clientes
INSERT INTO Clientes (
  Dni, Cuil, Nombre, Apellido, Sexo, FechaNacimiento,
  Direccion, IdLocalidad, IdUsuario  
) VALUES (
  '30123456', '20-30123456-5', 'Tamara', 'Marilyn', 'F', '1993-08-20',
  'Calle Sol 123', 5, NULL
);


INSERT INTO Clientes (Dni, Cuil, Nombre, Apellido, Sexo, FechaNacimiento, Direccion, IdLocalidad, IdUsuario) VALUES ('12345678', '20-12345678-3', 'María Fernanda', 'Amo', 'F', '1995-11-24', 'Rambla Leandro Mendizábal 15 Apt. 29 ', 15, NULL);
INSERT INTO Clientes (Dni, Cuil, Nombre, Apellido, Sexo, FechaNacimiento, Direccion, IdLocalidad, IdUsuario) VALUES ('91011121', '20-91011121-3', 'Salvador', 'Venecio', 'M', '1964-02-10', 'Pasadizo Ildefonso Peñalver 67', 18, NULL);




USE BancoTpIntegrador;
-- TiposCuenta
INSERT INTO TiposCuenta (Descripcion) VALUES ('Caja de Ahorro');
INSERT INTO TiposCuenta (Descripcion) VALUES ('Cuenta Corriente');
INSERT INTO TiposCuenta (Descripcion) VALUES ('Cuenta Sueldo');
INSERT INTO TiposCuenta (Descripcion) VALUES ('Cuenta Dólar');

USE BancoTpIntegrador;
-- Cuentas
INSERT INTO Cuentas (IdCliente, FechaCreacion, IdTipoCuenta, NumeroCuenta, Cbu, Saldo) VALUES (1, '2022-12-31', 1, '3260842187', '4996864450897117307369', 2560000);
INSERT INTO Cuentas (IdCliente, FechaCreacion, IdTipoCuenta, NumeroCuenta, Cbu, Saldo) VALUES (2, '2024-08-13', 2, '2554039848', '2702798028225840886633', 23020.94);
INSERT INTO Cuentas (IdCliente, FechaCreacion, IdTipoCuenta, NumeroCuenta, Cbu, Saldo) VALUES (2, '2023-05-14', 3, '8585583166', '1722281252935679048636', 35616.18);
INSERT INTO Cuentas (IdCliente, FechaCreacion, IdTipoCuenta, NumeroCuenta, Cbu, Saldo) VALUES (3, '2023-09-18', 4, '9752058817', '8247290269994889654420', 23069.43);

USE BancoTpIntegrador;
-- Prestamos
INSERT INTO Prestamos (IdCliente, IdCuentaAsociada, FechaAlta, ImportePedido, PlazoMeses, ImportePorMes, Interes, CantidadCuotas) VALUES (1, 1, '2025-03-21', 473118.4, 36, 17100.6, 30.12, 36);
INSERT INTO Prestamos (IdCliente, IdCuentaAsociada, FechaAlta, ImportePedido, PlazoMeses, ImportePorMes, Interes, CantidadCuotas) VALUES (2, 2, '2024-06-16', 213899.66, 12, 24682.24, 38.47, 12);
INSERT INTO Prestamos (IdCliente, IdCuentaAsociada, FechaAlta, ImportePedido, PlazoMeses, ImportePorMes, Interes, CantidadCuotas) VALUES (3, 4, '2024-12-07', 464346.89, 36, 15403.42, 19.42, 36);


-- USE BancoTpIntegrador;
-- Cuotas aun no lo agrego
-- INSERT INTO Cuotas (IdPrestamo, NumeroCuota, Monto, FechaPago) VALUES (1, 1, 16527.34, '2025-06-15');
-- INSERT INTO Cuotas (IdPrestamo, NumeroCuota, Monto, FechaPago) VALUES (2, 2, 11831.24, '2025-06-15');
-- INSERT INTO Cuotas (IdPrestamo, NumeroCuota, Monto, FechaPago) VALUES (3, 3, 18292.05, '2025-06-15');


USE BancoTpIntegrador;
-- TiposMovimiento
INSERT INTO TiposMovimiento (Descripcion) VALUES ('Transferencia');
INSERT INTO TiposMovimiento (Descripcion) VALUES ('Depósito');
INSERT INTO TiposMovimiento (Descripcion) VALUES ('Extracción');
INSERT INTO TiposMovimiento (Descripcion) VALUES ('Pago Prestamo');
INSERT INTO TiposMovimiento (Descripcion) VALUES ('Cobro');
INSERT INTO TiposMovimiento (Descripcion) VALUES ('Débito Automático');

USE BancoTpIntegrador;
-- Movimientos
INSERT INTO Movimientos (FechaHora, Referencia, Importe, IdTipoMovimiento, IdCuentaOrigen, IdCuentaDestino) VALUES ('2025-04-18 21:16:35', 'deposito a cuenta', 1051.02, 2, 3, 1);
INSERT INTO Movimientos (FechaHora, Referencia, Importe, IdTipoMovimiento, IdCuentaOrigen, IdCuentaDestino) VALUES ('2025-03-28 07:14:33', 'tranferencia a cuenta', 42979.87, 1, 4, 3);
-- INSERT INTO Movimientos (FechaHora, Referencia, Importe, IdTipoMovimiento, IdCuentaOrigen, IdCuentaDestino) VALUES ('2025-03-29 04:10:35', 'pago prestamo', 47194.34, 10, 4, 2);
INSERT INTO Movimientos (FechaHora, Referencia, Importe, IdTipoMovimiento, IdCuentaOrigen, IdCuentaDestino) VALUES ('2024-07-03 20:58:32', 'deposito', 27372.81, 1, 3, 2);




