


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
      <h2>Gestión de Clientes (ABML)</h2>

        <div class="messages success-message" style="display: none;">
            Se agregó/modificó/eliminó correctamente.
        </div>
        <div class="messages error-message" style="display: none;">
            Hubo un error al realizar la operación.
        </div>

        <h3>Listado de Clientes</h3>

        <div style="text-align: right; margin-bottom: 20px;">
            <a href="clientesFormulario.jsp?action=agregar" class="btn">Agregar Nuevo Cliente</a>
        </div>

        <div class="search-filter-section">
            <label for="searchCliente">Buscar Cliente (Nombre/DNI/CUIL):</label>
            <input type="text" id="searchCliente" name="searchCliente" placeholder="Ej: Juan Pérez o 12345678">
            <button type="submit" class="btn">Buscar</button> <label for="filterProvincia" style="margin-left: 20px;">Filtrar por Provincia:</label>
            <select id="filterProvincia" name="filterProvincia">
                <option value="">Todas</option>
                <option value="Buenos Aires">Buenos Aires</option>
                <option value="Cordoba">Córdoba</option>
                </select>
            <button type="submit" class="btn">Filtrar</button> 
            
         </div>

        <div class="table-container">
            <table>
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>DNI</th>
                        <th>Nombre Completo</th>
                        <th>Correo</th>
                        <th>Teléfono</th>
                        <th>Usuario Acceso</th>
                        <th>Acciones</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>1</td>
                        <td>12345678</td>
                        <td>Juan Pérez</td>
                        <td>juan.perez@example.com</td>
                        <td>1122334455</td>
                        <td>jperez</td>
                        <td>
                            <a href="ClienteServlet?action=editar&id=1" class="btn">Editar</a>
                            <a href="ClienteServlet?action=eliminar&id=1" class="btn" onclick="return confirm('¿Está seguro que desea eliminar este cliente?');">Eliminar</a>
                        </td>
                    </tr>
                    <tr>
                        <td>2</td>
                        <td>87654321</td>
                        <td>María Gómez</td>
                        <td>maria.gomez@example.com</td>
                        <td>1199887766</td>
                        <td>mgomez</td>
                        <td>
                            <a href="ClienteServlet?action=editar&id=2" class="btn">Editar</a>
                            <a href="ClienteServlet?action=eliminar&id=2" class="btn" onclick="return confirm('¿Está seguro que desea eliminar este cliente?');">Eliminar</a>
                        </td>
                    </tr>
                    </tbody>
            </table>
        </div>

        <div class="pagination">
            <a href="#">&laquo;</a>
            <a href="#" class="active">1</a>
            <a href="#">2</a>
            <a href="#">3</a>
            <a href="#">&raquo;</a>
        </div>
    
    
    
        </main>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>



