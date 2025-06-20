<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8" />
    <title>SISTEMA BANCARIO UTN</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
	<header class="navbar navbar-dark bg-secondary">
	    <div class="container-fluid d-flex justify-content-between align-items-center">
	        <span class="navbar-brand mb-0 h1">SISTEMA BANCARIO UTN</span>
	        <a href="login.jsp" class="btn btn-outline-light btn-sm">Cerrar sesión</a>
	    </div>
	</header>
	<nav class="navbar bg-light border-bottom shadow-sm">
	    <div class="container d-flex flex-column align-items-center py-3">
	        <div class="mb-3 w-100 d-flex justify-content-center flex-wrap gap-2">
	            <span class="fw-bold text-secondary me-3 align-self-center" style="cursor:default; user-select:none;">
	                ADMINISTRADOR
	            </span>
	            <a href="menuAdministrador.jsp" class="btn btn-secondary btn-sm text-nowrap">Inicio Admin</a>
	            <a href="ADMINabmlClientes.jsp" class="btn btn-secondary btn-sm text-nowrap">Gestión Clientes</a>
	            <a href="ADMINabmlUsuarios.jsp" class="btn btn-secondary btn-sm text-nowrap">Gestión Usuarios</a>
	            <a href="ADMINclienteListaCuentas.jsp" class="btn btn-secondary btn-sm text-nowrap">Gestión Cuentas</a>
	            <a href="ADMINlistaPrestamos.jsp" class="btn btn-secondary btn-sm text-nowrap">Autorizar Préstamos</a>
	            <a href="ADMINreportes.jsp" class="btn btn-secondary btn-sm text-nowrap">Reportes Admin</a>
	            <a href="ADMINlistadoClientes.jsp" class="btn btn-secondary btn-sm text-nowrap">Listado Clientes</a>
	        </div>
	        <div class="w-100 d-flex justify-content-center flex-wrap gap-2">
	            <span class="fw-bold text-secondary me-3 align-self-center" style="cursor:default; user-select:none;">
	                CLIENTE
	            </span>
	            <a href="menuCliente.jsp" class="btn btn-secondary btn-sm text-nowrap">Inicio Cliente</a>
	            <a href="CLIENTElistaMovimientos.jsp" class="btn btn-secondary btn-sm text-nowrap">Movimientos</a>
	            <a href="CLIENTEtransferencias.jsp" class="btn btn-secondary btn-sm text-nowrap">Transferencias</a>
	            <a href="CLIENTEsolicitarPrestamos.jsp" class="btn btn-secondary btn-sm text-nowrap">Solicitar Préstamo</a>
	            <a href="CLIENTEpagoPrestamos.jsp" class="btn btn-secondary btn-sm text-nowrap">Pago Préstamos</a>
	            <a href="CLIENTEinfoPersonal.jsp" class="btn btn-secondary btn-sm text-nowrap">Mi Información</a>
	        </div>
	    </div>
	</nav>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
