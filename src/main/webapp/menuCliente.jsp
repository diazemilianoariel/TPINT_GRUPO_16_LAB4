<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
<title>Panel de Cliente</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="CSS/estilos.css">
</head>
<body class="bg-light">
	<jsp:include page="_layoutHeaderNav.jsp" />
	<main class="container py-5">
	    <div class="dashboard-links d-flex flex-column align-items-center gap-3">
	        <h4 class="card-title text-center mb-4">Panel de Cliente</h4>
	        <a href="CLIENTElistaMovimientos.jsp" class="btn btn-secondary btn-sm w-50">Gestión de Movimientos</a>
	        <a href="CLIENTEtransferencias.jsp" class="btn btn-secondary btn-sm w-50">Gestión de Transferencias</a>
	        <a href="CLIENTEsolicitarPrestamos.jsp" class="btn btn-secondary btn-sm w-50">Solicitud de Préstamos</a>
	        <a href="CLIENTEpagoPrestamos.jsp" class="btn btn-secondary btn-sm w-50">Paga tus préstamos</a>
	        <a href="CLIENTEinfoPersonal.jsp" class="btn btn-secondary btn-sm w-50">Mi Información Personal</a>
	    </div>
	</main>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
