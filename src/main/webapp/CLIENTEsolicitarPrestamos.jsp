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
    	
     <h4 class="text-center mb-4">Pago de Préstamos</h4>

    <!-- Selección de cuenta -->
    <form method="post" action="ClientePagarPrestamoServlet" class="row g-3 mb-4 align-items-end">

        <!-- Combo de cuentas -->
        <div class="col-md-5">
            <label for="cuenta" class="form-label">Cuenta Asociada</label>
            <select name="cuenta" id="cuenta" class="form-select" required>
                <option value="">Seleccione una cuenta</option>
                <%-- Iterar cuentas del cliente --%>
                
                
                
                
            <%--     <option value="<%= c.getIdCuenta() %>"><%= c.getNumeroCuenta() %></option> --%>
               
            </select>
        </div>

        <!-- Combo de préstamos -->
        <div class="col-md-5">
            <label for="prestamo" class="form-label">Préstamo</label>
            <select name="prestamo" id="prestamo" class="form-select" required>
                <option value="">Seleccione un préstamo</option>
                <%-- Iterar préstamos filtrados por cuenta  --%>
               
               
                        
                    
                
            </select>
        </div>

        <!-- Botón consultar -->
        <div class="col-md-2">
            <button type="submit" class="btn btn-primary w-100">Consultar Cuota</button>
        </div>
    </form>

    <%-- Datos de la cuota a pagar --%>
    
    <%--
    <% 
    
       
    %>
    
    
    <div class="table-responsive">
        <table class="table table-bordered text-center align-middle">
            <thead class="table-secondary">
                <tr>
                    <th>Préstamo</th>
                    <th>N° Cuota</th>
                    <th>Total Cuotas</th>
                    <th>Monto</th>
                    <th>Pagar Cuota</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>#<%=  %></td>
                    <td><%=  %></td>
                    <td><%=  %></td>
                    <td>$<%=  %></td>
                    <td>
                        <form method="post" action="ClienteRealizarPagoServlet">
                            
                            
                            
                        </form>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
    <% } %>
    
    --%>
    
    
        </main>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>



