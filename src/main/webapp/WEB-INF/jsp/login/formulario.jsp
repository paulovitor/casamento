<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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

</head>

<body>

	<div class="container">

		<div class="page-header">
			<h1>
				<fmt:message key="login.titulo" />
			</h1>
		</div>

		<%-- <c:if test="${error != null}">
			<div class="alert alert-danger" role="alert">${error}</div>
		</c:if> --%>
		
		<c:if test="${errors != null}">
			<div class="alert alert-danger" role="alert">
				<c:forEach items="${errors}" var="error">
					<li>${error.category}: ${error.message}</li>
				</c:forEach>
			</div>
		</c:if>

		<form action="${linkTo[LoginController].login}" method="post"
			id="form-popover" role="form">
			<div class="form-group">
				<label for="login"><fmt:message key="usuario.campo.login" /></label>
				<input type="text" id="login" name="usuario.login"
					class="form-control" value="${usuario.login}">
			</div>
			<div class="form-group">
				<label for="senha"><fmt:message key="usuario.campo.senha" /></label>
				<input type="password" id="senha" name="usuario.senha"
					class="form-control" value="${usuario.senha}">
			</div>
			<button type="submit" id="btn-submit" class="btn btn-primary">
				<fmt:message key="botao.confirmar" />
			</button>
			<a class="btn btn-default" href="${linkTo[IndexController].index}"
				role="button"><fmt:message key="botao.cancelar" /></a>
		</form>

	</div>

</body>
</html>