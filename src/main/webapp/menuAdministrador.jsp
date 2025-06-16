
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Título de esta Página</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="CSS/estilos.css">
</head>
<body class="bg-light">
    <jsp:include page="_layoutHeaderNav.jsp" />

    <main class="container py-5">
    	
    	 <h2>Panel de Administración</h2>
        <p>Bienvenido al panel de control del administrador.</p>

	
        <div class="dashboard-links">
            <h3>Operaciones de Administración:</h3>
            <ul>
                <li><a href="ADMINabmlClientes.jsp" class="btn">Gestión de Clientes (ABML)</a></li>
                <li><a href="ADMINabmlUsuarios.jsp" class="btn">Gestión de Usuarios (ABML)</a></li>
                <li><a href="ADMINclienteListaCuentas.jsp" class="btn">Gestión de Cuentas (ABML)</a></li>
                <li><a href="ADMINlistaPrestamos.jsp" class="btn">Autorizar Préstamos</a></li>
                <li><a href="ADMINreportes.jsp" class="btn">Ver Informes y Reportes</a></li>
                <li><a href="ADMINlistadoClientes.jsp" class="btn">Ver Listado de Clientes</a></li>
            </ul>
        </div>
    
    
    
        </main>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
