<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>



<body class="bg-light">
	<jsp:include page="header.jsp" />
	<main class="container py-5">
	    <h4 class="text-center mb-4">Listado de Cuentas</h4>
	    <div class="table-responsive">
	        <table class="table table-bordered table-hover align-middle text-center">
	            <thead class="table-secondary">
	                <tr>
	                    <th>ID</th>
	                    <th>Cliente</th>
	                    <th>Cuenta Asociada</th>
	                    <th>Fecha Alta</th>
	                    <th>Saldo</th>
	                 
	                </tr>
	            </thead>
	            <tbody>
	                <tr>
	                    <td>1</td>
	                    <td>Juan Pérez</td>
	                    <td>CA001-123456</td>
	                    <td>2025-06-14</td>
	                    <td>$100,000</td>
	                </tr>
	                <tr>
	                    <td>2</td>
	                    <td>María López</td>
	                    <td>CA001-654321</td>
	                    <td>2025-05-01</td>
	                    <td>$80,000</td>
	                   
	                </tr>
	                <tr>
	                    <td>3</td>
	                    <td>Pedro Gómez</td>
	                    <td>CA002-789012</td>
	                    <td>2025-04-10</td>
	                    <td>$50,000</td>
	                  
	                </tr>
	            </tbody>
	        </table>
	    </div>
	</main>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>



</body>
</html>