-- Script para verificar la base de datos
-- Ejecuta este script en MySQL Workbench o en la línea de comandos de MySQL

-- 1. Verificar que la base de datos existe
SHOW DATABASES LIKE 'BancoTpIntegrador3';

-- 2. Usar la base de datos
USE BancoTpIntegrador3;

-- 3. Verificar que las tablas existen
SHOW TABLES;

-- 4. Verificar datos en la tabla TipoUsuario
SELECT * FROM TipoUsuario;

-- 5. Verificar datos en la tabla Usuario
SELECT u.IdUsuario, u.NombreUsuario, u.Estado, tu.Descripcion as TipoUsuario
FROM Usuario u 
JOIN TipoUsuario tu ON u.IdTipoUsuario = tu.IdTipoUsuario;

-- 6. Contar usuarios
SELECT COUNT(*) as TotalUsuarios FROM Usuario;

-- 7. Verificar usuarios activos
SELECT COUNT(*) as UsuariosActivos FROM Usuario WHERE Estado = TRUE; 