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
	 
	 	 <h4>Datos de Acceso (Usuario y Contraseña)</h4>
            <div class="form-group">
                <label for="usuarioAcceso">Usuario para Acceso:</label>
                <input type="text" id="usuarioAcceso" name="usuarioAcceso" value="${clienteAEditar.usuarioAcceso.nombreUsuario}" required>
            </div>
            <div class="form-group">
                <label for="passwordAcceso">Contraseña:</label>
                <input type="password" id="passwordAcceso" name="passwordAcceso" required>
            </div>
            <div class="form-group">
                <label for="confirmPasswordAcceso">Confirmar Contraseña:</label>
                <input type="password" id="confirmPasswordAcceso" name="confirmPasswordAcceso" required>
            </div>

            <button type="submit" class="btn">Guardar Cliente</button>
            <button type="reset" class="btn">Limpiar Formulario</button>
            <a href="clientesListado.jsp" class="btn">Cancelar y Volver</a>
	 	
	 	
	 
	 </main>
	 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>