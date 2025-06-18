<!-- _layoutHeaderNav.jsp (solo contiene el header y el nav de Bootstrap) -->
<!-- Estos links temporales son para ver ambos menús para la primera entrega -->
<!-- En la entrega 2, esta lógica será manejada por un Servlet/Filtro de autenticación -->


<!-- ESTE LAYOUT ES EL ENCARGADO DE CENTRALIZAR Y UTILIZAR EN CADA UNA DE LAS PAGINA EL MISMO MENU DE NAGEVACION , 
VAYAN MIRANCHO CHICOS , SE VAN A DAR CUENTA QUE EN CADA PAGINA ESTA ESTE MISMO LAYOUT, ES PARA NO ANDAR COPIANDO EL MISMO MENU EN TODAS LAS 
PAGINAS  -->
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="CSS/estilos.css">

<header class="navbar navbar-dark bg-secondary">


    <div class="container-fluid d-flex justify-content-between align-items-center">
        <span class="navbar-brand mb-0 h1">SISTEMA BANCARIO UTN</span>
        <a href="login.jsp" class="btn btn-outline-light btn-sm">Cerrar sesión</a>
    </div>
    
    
</header>


<nav class="navbar navbar-expand-lg navbar-light bg-light border-bottom shadow-sm">
    <div class="container">
        <ul class="navbar-nav mx-auto mb-2 mb-lg-0">
        
        
            <li class="nav-item"><a class="nav-link" href="menuAdministrador.jsp">Inicio Admin</a></li>
            <li class="nav-item"><a class="nav-link" href="ADMINabmlClientes.jsp">Gestión Clientes</a></li>
            <li class="nav-item"><a class="nav-link" href="ADMINabmlUsuarios.jsp">Gestión Usuarios</a></li>
            <li class="nav-item"><a class="nav-link" href="ADMINclienteListaCuentas.jsp">Gestión Cuentas</a></li>
            <li class="nav-item"><a class="nav-link" href="ADMINlistaPrestamos.jsp">Autorizar Préstamos</a></li>
            <li class="nav-item"><a class="nav-link" href="ADMINreportes.jsp">Reportes Admin</a></li>
            <li class="nav-item"><a class="nav-link" href="ADMINlistadoClientes.jsp">Listado Clientes</a></li>
            
            
            
            
            <li class="nav-item mx-2"><span class="nav-link text-muted">|</span></li>
            <li class="nav-item mx-2"><span class="nav-link text-muted">|</span></li>
            
            
            
            
            <li class="nav-item"><a class="nav-link" href="menuCliente.jsp">Inicio Cliente</a></li>
            <li class="nav-item"><a class="nav-link" href="CLIENTElistaMovimientos.jsp">Movimientos</a></li>
            <li class="nav-item"><a class="nav-link" href="CLIENTEtransferencias.jsp">Transferencias</a></li>
            <li class="nav-item"><a class="nav-link" href="CLIENTEsolicitarPrestamos.jsp">Solicitar Préstamo</a></li>
            <li class="nav-item"><a class="nav-link" href="CLIENTEpagoPrestamos.jsp">Pago Préstamos</a></li>
            <li class="nav-item"><a class="nav-link" href="CLIENTEinfoPersonal.jsp">Mi Información</a></li>
            
            
            
        </ul>
    </div>
</nav>

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
