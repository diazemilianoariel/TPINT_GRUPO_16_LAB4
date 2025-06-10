<%-- login.jsp --%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login - Banco UTN</title>
   <link rel="stylesheet" type="text/css" href="CSS/estilos.css">
</head>


<body>
    <div class="login-container">
        <h2>Acceso al Sistema Bancario</h2>
        
        
        <form action="LoginServlet" method="post"> <!-- Action apuntará a tu Servlet de Login -->
            <div class="form-group">
                <label for="usuario">Usuario:</label>
                <input type="text" id="usuario" name="usuario" required>
            </div>
            <div class="form-group">
                <label for="password">Contraseña:</label>
                <input type="password" id="password" name="password" required>
            </div>
            <button type="submit" class="btn-login">Ingresar</button>
            <div class="message-area">
                <!-- Aquí se mostrarán mensajes de error del login -->
                <% String mensajeError = (String) request.getAttribute("mensajeError"); %>
                <% if (mensajeError != null) { %>
                    <p style="color: red;"><%= mensajeError %></p>
                <% } %>
            </div>
        </form>
    </div>
</body>
</html>