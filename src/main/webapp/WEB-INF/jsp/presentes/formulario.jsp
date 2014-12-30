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
				<fmt:message key="presentes.titulo" />
			</h1>
		</div>

		<c:if test="${mensagem != null}">
			<div class="alert alert-${tipo}" role="alert">${mensagem}</div>
		</c:if>

		<c:if test="${errors != null}">
			<div class="alert alert-danger" role="alert">
				<c:forEach items="${errors}" var="error">
					<li>${error.category}: ${error.message}</li>
				</c:forEach>
			</div>
		</c:if>

		<form action="${linkTo[PresentesController].adiciona}" method="post"
			id="form-popover" role="form">
			<div class="form-group">
				<label for="nome"><fmt:message key="presentes.campo.nome" /></label>
				<input type="text" id="nome" name="presente.nome"
					class="form-control" value="${presente.nome}">
			</div>
			<div class="form-group">
				<label for="quantidade"><fmt:message
						key="presentes.campo.quantidade" /></label> <input type="text"
					id="quantidade" name="presente.quantidade" class="form-control"
					placeholder="0" value="${presente.quantidade}">
			</div>
			<div class="form-group">
				<label for="tipo"><fmt:message key="presentes.campo.tipo" /></label>
				<select id="tipo" name="presente.tipo" class="form-control">
					<option value="0"><fmt:message key="tipo.presente.cha" /></option>
					<option value="1"><fmt:message
							key="tipo.presente.casamento" /></option>
				</select>
			</div>
			<button type="submit" id="btn-submit" class="btn btn-primary">
				<fmt:message key="botao.confirmar" />
			</button>
			<a class="btn btn-default"
				href="${linkTo[PresentesController].lista}" role="button"><fmt:message
					key="botao.cancelar" /></a>
		</form>

	</div>

</body>
</html>