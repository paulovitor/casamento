<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Paulo e Layanne</title>

<!-- Bootstrap -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/bootstrap/css/bootstrap-override.css">

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script
	src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.min.js"></script>


<style type="text/css">
body {
	min-height: 2000px;
	padding-top: 50px;
}
</style>

</head>
<body>
	<div id="header">
		<jsp:include page="../header.jsp" />
	</div>
	<div class="container">

		<div class="page-header">
			<h1>Lista de Presentes (Chá de Panela)</h1>
		</div>

		<div>
			<table class="table table-condensed">
				<thead>
					<tr>
						<th></th>
						<th>Presente</th>
						<th>Quantidade</th>
						<th></th>
						<th></th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${presenteList}" var="presente">
						<tr ${presente.ok ? 'class="success"' : ''}>
							<td>${presente.id}</td>
							<td>${presente.nome}</td>
							<td>${presente.quantidade}</td>
							<td align="center"><c:if test="${presente.familia != null}">
									<span class="glyphicon glyphicon-heart"></span> Família: ${presente.familia.nome}
							</c:if></td>
							<td align="right"><span
								class="glyphicon glyphicon-${presente.ok ? 'ok' : 'play'}"></span></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>

	</div>
</body>
</html>
