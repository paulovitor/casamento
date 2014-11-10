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
<script type="text/javascript">
	$(document).ready(function() {
		$('.carousel').carousel({
			interval : 5000
		});
	});
</script>

</head>
<body>
	<div id="header" style="margin-bottom: 20px;">
		<jsp:include page="../header.jsp" />
	</div>
	<div class="container">

		<!-- <div class="jumbotron">
			<h1>Seja bem-vindo!</h1>

			<p>Ave Maria cheia de graça, o Senhor é convosco, bendita és Tu
				entre as mulheres, e bendito é o fruto do vosso ventre, Jesus. Santa
				Maria, Mãe de Deus, rogai por nós pecadores, agora e na hora de
				nossa morte. Amém</p>
		</div> -->

		<div class="panel panel-default">
			<div class="panel-heading">
				<h3 class="panel-title">Seja bem-vindo!</h3>
			</div>
			<div class="panel-body">Ave Maria cheia de graça, o Senhor é
				convosco, bendita és Tu entre as mulheres, e bendito é o fruto do
				vosso ventre, Jesus. Santa Maria, Mãe de Deus, rogai por nós
				pecadores, agora e na hora de nossa morte. Amém</div>
			<div id="carousel" class="carousel slide"
				data-ride="carousel">
				<ol class="carousel-indicators">
					<li data-target="#carousel" data-slide-to="0"
						class=""></li>
					<li data-target="#carousel" data-slide-to="1"
						class="active"></li>
					<li data-target="#carousel" data-slide-to="2"
						class=""></li>
				</ol>
				<div class="carousel-inner" role="listbox">
					<div class="item">
						<img alt="<fmt:message key="site.titulo" />"
							src="${pageContext.request.contextPath}/assets/images/pauloelay/GEDC0427.JPG">
					</div>
					<div class="item active">
						<img alt="<fmt:message key="site.titulo" />"
							src="${pageContext.request.contextPath}/assets/images/pauloelay/GEDC3470.JPG">
					</div>
					<div class="item">
						<img alt="<fmt:message key="site.titulo" />"
							src="${pageContext.request.contextPath}/assets/images/pauloelay/GEDC3781.JPG">
					</div>
				</div>
				<a class="left carousel-control" href="#carousel"
					role="button" data-slide="prev"> <span
					class="glyphicon glyphicon-chevron-left"></span> <span
					class="sr-only">Anterior</span>
				</a> <a class="right carousel-control" href="#carousel"
					role="button" data-slide="next"> <span
					class="glyphicon glyphicon-chevron-right"></span> <span
					class="sr-only">Próximo</span>
				</a>
			</div>
		</div>

	</div>
</body>
</html>
