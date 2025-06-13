<!-- abmlClientes.jsp -->
<%@ include file="menuNavegacion.jsp" %>

        <h2>Gestión de Clientes (ABML)</h2>

        <!-- Mensajes de éxito/error -->
        <div class="messages success-message" style="display: none;">
            Se agregó/modificó/eliminó correctamente.
        </div>
        
        
        <div class="messages error-message" style="display: none;">
            Hubo un error al realizar la operación.
        </div>

        <h3>Formulario de Cliente</h3>
        

        <form action="ClienteServlet" method="post"> <!--  esto es para que cuando hagamos los servlet, ya tiene el nombre aunque  todavia no lo hagamos -->
            <input type="hidden" name="action" value="guardar"> <!-- Para diferenciar si es alta/modificación -->
            <input type="hidden" name="clienteId" value=""> <!-- Para edición, se llena con el ID del cliente -->

            <div class="form-group">
                <label for="dni">DNI:</label>
                <input type="text" id="dni" name="dni" required>
            </div>
            
            
            <div class="form-group">
                <label for="cuil">CUIL:</label>
                <input type="text" id="cuil" name="cuil">
            </div>
            
            
            <div class="form-group">
                <label for="nombre">Nombre:</label>
                <input type="text" id="nombre" name="nombre" required>
            </div>
            
            
            <div class="form-group">
                <label for="apellido">Apellido:</label>
                <input type="text" id="apellido" name="apellido" required>
            </div>
            
            
            <div class="form-group">
                <label for="sexo">Sexo:</label>
                <select id="sexo" name="sexo">
                    <option value="">Seleccione</option>
                    <option value="M">Masculino</option>
                    <option value="F">Femenino</option>
                    <option value="O">Otro</option>
                </select>
            </div>
            
            
            <div class="form-group">
                <label for="fechaNacimiento">Fecha de Nacimiento:</label>
                <input type="date" id="fechaNacimiento" name="fechaNacimiento">
            </div>
            
            
            <div class="form-group">
                <label for="direccion">Dirección:</label>
                <input type="text" id="direccion" name="direccion">
            </div>
            
            <div class="form-group">
                <label for="localidad">Localidad:</label>
                <input type="text" id="localidad" name="localidad">
            </div>
            
            <div class="form-group">
                <label for="provincia">Provincia:</label>
                <input type="text" id="provincia" name="provincia">
            </div>
            
            
            <div class="form-group">
                <label for="correo">Correo Electrónico:</label>
                <input type="text" id="correo" name="correo">
            </div>
            
            
            <div class="form-group">
                <label for="telefono">Teléfono:</label>
                <input type="text" id="telefono" name="telefono">
            </div>
            
            
            <hr>
            <h4>Datos de Acceso (Usuario y Contraseña)</h4>
            
            <div class="form-group">
                <label for="usuarioAcceso">Usuario para Acceso:</label>
                <input type="text" id="usuarioAcceso" name="usuarioAcceso" required>
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
        </form>
        
        
        

        <hr>

        <h3>Listado de Clientes</h3>
        
        
        <div class="search-filter-section">
            <label for="searchCliente">Buscar Cliente (Nombre/DNI/CUIL):</label>
            <input type="text" id="searchCliente" placeholder="Ej: Juan Pérez o 12345678">
            <button class="btn">Buscar</button>
            <label for="filterProvincia" style="margin-left: 20px;">Filtrar por Provincia:</label>
            <select id="filterProvincia">
                <option value="">Todas</option>
                <option value="Buenos Aires">Buenos Aires</option>
                <option value="Cordoba">Córdoba</option>
                </select>
            <button class="btn">Filtrar</button>
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
                    <!-- Aca se cargarían  los clientes, por ahora  hay algunos harcodeados -->
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
                    <!-- Más filas... -->
                    
                    
                    
                </tbody>
            </table>
        </div>


		<!-- desde aca faltaria agregarle  la paginacion  -->

       

   
</body>
</html>