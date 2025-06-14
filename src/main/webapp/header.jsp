<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page session="true" %>

<%
    session.setAttribute("usuario", "adminbank");
    session.setAttribute("tipoUsuario", 2);
%>
<header class="navbar navbar-dark bg-secondary">
    <div class="container-fluid d-flex justify-content-between align-items-center">
        <span class="navbar-brand mb-0 h1">SISTEMA BANCARIO UTN</span>
        <a href="login.jsp" class="btn btn-outline-light btn-sm">Cerrar sesión</a>
    </div>
</header>
<%
    Integer tipoUsuario = (Integer) session.getAttribute("tipoUsuario");
    if (tipoUsuario != null) {
%>
<nav class="navbar navbar-expand-lg navbar-light bg-light border-bottom shadow-sm">
    <div class="container">
        <ul class="navbar-nav mx-auto mb-2 mb-lg-0">
            <% if (tipoUsuario == 1) { %>
                <li class="nav-item">
                    <a class="nav-link" href="">Lista Clientes</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="">Lista Cuentas</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="listaPrestamos.jsp">Lista Préstamos</a>
                </li>
                
            <% } else if (tipoUsuario == 2) { %>
                <li class="nav-item">
                    <a class="nav-link" href="listaMovimientos.jsp">Lista Movimientos</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="">Lista Cuentas</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="solicitarPrestamos.jsp">Solicitar Préstamo</a>
                </li>
            <% } %>
        </ul>
    </div>
</nav>
<% } %>
