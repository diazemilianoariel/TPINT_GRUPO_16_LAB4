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
      <h2>Gestión de Clientes</h2>
        <h3>Formulario de Cliente</h3>

        <div class="messages error-message" style="display: none;">
            Hubo un error en la carga del formulario.
        </div>

        <form action="ClienteServlet" method="post">
            <input type="hidden" name="action" value="guardarCliente">
            <input type="hidden" name="clienteId" value="${clienteAEditar.id}"> <!-- JSP EL para pre-llenar -->

            <div class="form-group">
                <label for="dni">DNI:</label>
                <input type="text" id="dni" name="dni" value="${clienteAEditar.dni}" required>
            </div>
            <div class="form-group">
                <label for="cuil">CUIL:</label>
                <input type="text" id="cuil" name="cuil" value="${clienteAEditar.cuil}">
            </div>
            <div class="form-group">
                <label for="nombre">Nombre:</label>
                <input type="text" id="nombre" name="nombre" value="${clienteAEditar.nombre}" required>
            </div>
            <div class="form-group">
                <label for="apellido">Apellido:</label>
                <input type="text" id="apellido" name="apellido" value="${clienteAEditar.apellido}" required>
            </div>
            <div class="form-group">
                <label for="sexo">Sexo:</label>
                
                
                <select id="sexo" name="sexo" class="form-select">
                    <option value="">Seleccione</option>
                    <option value="M" ${clienteAEditar.sexo == 'M' ? 'selected' : ''}>Masculino</option>
                    <option value="F" ${clienteAEditar.sexo == 'F' ? 'selected' : ''}>Femenino</option>
                    <option value="O" ${clienteAEditar.sexo == 'O' ? 'selected' : ''}>Otro</option>
                </select>
                
                
            </div>
            <div class="form-group">
                <label for="fechaNacimiento">Fecha de Nacimiento:</label>
                <input type="date" id="fechaNacimiento" name="fechaNacimiento" value="${clienteAEditar.fechaNacimiento}">
            </div>
            <div class="form-group">
                <label for="direccion">Dirección:</label>
                <input type="text" id="direccion" name="direccion" value="${clienteAEditar.direccion}">
            </div>
            <div class="form-group">
                <label for="localidad">Localidad:</label>
                <input type="text" id="localidad" name="localidad" value="${clienteAEditar.localidad}">
            </div>
            <div class="form-group">
                <label for="provincia">Provincia:</label>
                <input type="text" id="provincia" name="provincia" value="${clienteAEditar.provincia}">
            </div>
            <div class="form-group">
                <label for="correo">Correo Electrónico:</label>
                <input type="text" id="correo" name="correo" value="${clienteAEditar.correoElectronico}">
            </div>
            <div class="form-group">
                <label for="telefono">Teléfono:</label>
                <input type="text" id="telefono" name="telefono" value="${clienteAEditar.telefono}">
            </div>

            <hr>
         

            <button type="submit" class="btn">Guardar Cliente</button>
            <button type="reset" class="btn">Limpiar Formulario</button>
            <a href="clientesListado.jsp" class="btn">Cancelar y Volver</a>
        </form>
    
    
    
    
        </main>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>



</html>
