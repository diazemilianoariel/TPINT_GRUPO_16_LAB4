<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Panel de Administración</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="CSS/estilos.css">
</head>
<body class="bg-light">
    <jsp:include page="_layoutHeaderNav.jsp" />
    <main class="container py-5">
        <div class="dashboard-links d-flex flex-column align-items-center gap-3">
            <h4 class="card-title text-center mb-4">Panel de Administración</h4>
            <a href="ADMINabmlClientes.jsp" class="btn btn-secondary btn-sm w-50">Gestión de Clientes (ABML)</a>
            <a href="ADMINabmlUsuarios.jsp" class="btn btn-secondary btn-sm w-50">Gestión de Usuarios (ABML)</a>
            <a href="ADMINclienteListaCuentas.jsp" class="btn btn-secondary btn-sm w-50">Gestión de Cuentas (ABML)</a>
            <a href="ADMINlistaPrestamos.jsp" class="btn btn-secondary btn-sm w-50">Autorizar Préstamos</a>
            <a href="ADMINreportes.jsp" class="btn btn-secondary btn-sm w-50">Ver Informes y Reportes</a>
            <a href="ADMINlistadoClientes.jsp" class="btn btn-secondary btn-sm w-50">Ver Listado de Clientes</a>
        </div>
    </main>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
