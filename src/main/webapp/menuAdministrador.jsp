
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>T�tulo de esta P�gina</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="CSS/estilos.css">
</head>
<body class="bg-light">
    <jsp:include page="_layoutHeaderNav.jsp" />

    <main class="container py-5">
    	
    	 <h2>Panel de Administraci�n</h2>
        <p>Bienvenido al panel de control del administrador.</p>

	
        <div class="dashboard-links">
            <h3>Operaciones de Administraci�n:</h3>
            <ul>
                <li><a href="ADMINabmlClientes.jsp" class="btn">Gesti�n de Clientes (ABML)</a></li>
                <li><a href="ADMINabmlUsuarios.jsp" class="btn">Gesti�n de Usuarios (ABML)</a></li>
                <li><a href="ADMINclienteListaCuentas.jsp" class="btn">Gesti�n de Cuentas (ABML)</a></li>
                <li><a href="ADMINlistaPrestamos.jsp" class="btn">Autorizar Pr�stamos</a></li>
                <li><a href="ADMINreportes.jsp" class="btn">Ver Informes y Reportes</a></li>
                <li><a href="ADMINlistadoClientes.jsp" class="btn">Ver Listado de Clientes</a></li>
            </ul>
        </div>
    
    
    
        </main>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
