<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title><fmt:message key="site.titulo" /></title>

<!-- Bootstrap -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/bootstrap/css/bootstrap-override.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/main.css">

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script
	src="${pageContext.request.contextPath}/assets/bootstrap/js/bootstrap.min.js"></script>

</head>
<body>

	<div id="header">
		<jsp:include page="../header.jsp" />
	</div>
	
	<div class="container">
	
		<div class="page-header">
			<h1><fmt:message key="informacoes.titulo"/></h1>
		</div>
	
		<div class="row">
			<div class="col-md-12">
				<div class="col-md-4">
					<strong>Data e hora:</strong><br/>
					07/12/2014 - 17:00hs <br/><br/>
					
					<address>
						<strong>Localização:</strong><br/>
						Salão de Festas - Residencial Shangrilá <br/>
						Rua 5 Norte Lote 01 - Avenida Castanheiras <br/>
						Águas Claras - DF <br/>
					</address>
					
					<address>
						<strong>Contatos:</strong><br/>
						9991-6496 (Paulo) <br/>
						9937-2290 (Lay)
					</address>
				</div>
				<div class="col-md-8">
					<iframe src="https://www.google.com/maps/embed?pb=!1m21!1m8!1m3!1d7676.732196929948!2d-48.01789246193238!3d-15.837344480610948!3m2!1i1024!2i768!4f13.1!4m10!1i0!3e0!4m3!3m2!1d-15.841509199999999!2d-48.0245872!4m3!3m2!1d-15.834244499999999!2d-48.0120279!5e0!3m2!1spt-BR!2sbr!4v1416265832321" width="600" height="450" frameborder="0" style="border:0"></iframe>
				</div>
			</div>
		</div>
		
		<div class="row"></div>

	</div>
</body>
</html>