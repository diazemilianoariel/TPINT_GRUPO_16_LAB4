<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="CSS/estilos.css">
</head>
<body>
<jsp:include page="_layoutHeaderNav.jsp" />

    <main class="container py-5">
    	
    	<h2>Panel de Cliente</h2>
        <p>Bienvenido al panel de control del cliente.</p>

	
        <div class="dashboard-links">
            <h3>Operaciones de cliente:</h3>
            <ul>
                <li><a href="CLIENTElistaMovimientos.jsp" class="btn">Gestión de Movimientos</a></li>
                <li><a href="CLIENTEtransferencias.jsp" class="btn">Gestión de Transferencias</a></li>
                <li><a href="CLIENTEsolicitarPrestamos.jsp" class="btn">Solicitud de Préstamos</a></li>
                <li><a href="CLIENTEpagoPrestamos.jsp" class="btn">Paga tus prestamos</a></li>
                <li><a href="CLIENTEinfoPersonal.jsp" class="btn"> Mi Informacion Personal</a></li>
            </ul>
        </div>
    
    
    		
        </main>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>