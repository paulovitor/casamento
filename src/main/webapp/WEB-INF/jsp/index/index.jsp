<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Paulo e Layanne</title>

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
	<div id="header" style="margin-bottom: 20px;">
		<jsp:include page="../header.jsp" />
	</div>
	<div class="container">

		<div class="jumbotron">
			<h1>Seja bem-vindo!</h1>
			<p>Ave Maria cheia de graça, o Senhor é convosco,
			bendita és Tu entre as mulheres, 
			e bendito é o fruto do vosso ventre, Jesus.
			Santa Maria, Mãe de Deus, rogai por nós pecadores,
			agora e na hora de nossa morte. Amém</p>
			<p>
				<a class="btn btn-primary btn-lg" href="#" role="button">Paulo e Layanne</a>
			</p>
		</div>

	</div>
</body>
</html>
