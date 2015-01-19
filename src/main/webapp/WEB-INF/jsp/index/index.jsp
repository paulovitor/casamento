<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
	
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="Site de casamento">
    <meta name="author" content="<fmt:message key="site.titulo" />">

    <title><fmt:message key="site.titulo" /></title>

    <!-- Bootstrap Core CSS -->
    <link href="${pageContext.request.contextPath}/assets/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="${pageContext.request.contextPath}/assets/css/casamento.css" rel="stylesheet">

    <!-- Fonts -->
    <link href="http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800" rel="stylesheet" type="text/css">
    <link href="http://fonts.googleapis.com/css?family=Josefin+Slab:100,300,400,600,700,100italic,300italic,400italic,600italic,700italic" rel="stylesheet" type="text/css">
	
	<!-- Icons -->
	<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    
    <!-- jQuery -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
	
	<!-- Bootstrap Core JavaScript -->
	<script	src="${pageContext.request.contextPath}/assets/bootstrap/js/bootstrap.min.js"></script>
	
    <script type="text/javascript">
		$(document).ready(function() {
			var path = window.location.pathname;
			path = decodeURIComponent(path);
			if (path != "") {
				$('ul#menu>li').removeClass('active');
				$('ul#menu>li').each(function() {
					var url = $(this).children('a').attr('href');
					if (path === url) {
						$(this).addClass("active");
					}
				});
			}
		});
	</script>
    
</head>

<body>

    <div class="brand"><fmt:message key="site.titulo" /></div>
    <div class="address-bar">25 de abril de 2015 | Paróquia São Judas Tadeu, Taguatinga Norte | 20:00 horas</div>

    <jsp:include page="../navigation.jsp" />

    <div class="container">

		<jsp:include page="carousel.jsp" />

		<jsp:include page="cha.jsp" />
		
		<jsp:include page="cerimonia.jsp" />
		
		<jsp:include page="recepcao.jsp" />

    </div>
    <!-- /.container -->

    <jsp:include page="../footer.jsp" />
    
</body>

</html>