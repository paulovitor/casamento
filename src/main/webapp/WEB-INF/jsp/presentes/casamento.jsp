<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
		var url = "${linkTo[FamiliasController].formulario}";
		$(document).ready(function() {
			var path = window.location.pathname;
			path = decodeURIComponent(path);
			if (path != "") {
				//if (path !== $('ul#menu>li:first>a').attr('href'))
				$('audio').removeAttr('autoplay');
				$('ul#menu>li').removeClass('active');
				$('ul#menu>li').each(function() {
					var url = $(this).children('a').attr('href');
					if (path === url) {
						$(this).addClass("active");
					}
				});
			}
			
			window.setTimeout(function() {
				$(".alert").alert('close');
			}, 5000);

			var popoverSettings = {
				placement : 'left',
				container : 'body',
				html : true,
				content : function(settings) {
					var id = parseInt($(this).attr('id').replace("span-", ""));
					return $.ajax({
						url : url,
						data : {
							id : id
						},
						dataType : "html",
						async : false
					}).responseText;
				}
			}

			$("#action>span").popover(popoverSettings);

			$("#action>span").on('click', function() {
				var id = '#' + $(this).attr('id');
				if ($(id).attr('class').indexOf('glyphicon-plus') === -1)
					$(id).popover('hide');
			});
		});
	</script>
    
</head>

<body>

	<div class="brand"><fmt:message key="site.titulo" /></div>
    <div class="address-bar">25 de abril de 2015 | Paróquia São Judas Tadeu, Taguatinga Norte | 20:00 horas</div>

    <jsp:include page="../navigation.jsp" />

	<div id="main" class="container">
		<div class="row">
	    	<div class="box">
	        	<div class="col-lg-12">
	
					<div class="page-header">
						<h1><fmt:message key="presentes.titulo"/></h1>
					</div>
			
					<div class="panel panel-info">
						<div class="panel-heading">
							<h3 class="panel-title"><fmt:message key="presentes.subtitulo"/></h3>
						</div>
						<div class="panel-body">
							<span class="badge">1</span> Clique no icone <span class="glyphicon glyphicon-plus"></span><br />
							<span class="badge">2</span> Preencha os campos <kbd><fmt:message key="familias.campo.nome"/></kbd> e <kbd><fmt:message key="familias.campo.email"/></kbd> no formulário<br />
							<span class="badge">3</span> Clique no botão <kbd><fmt:message key="botao.confirmar"/></kbd><br />
							<span class="badge">4</span> Pronto, seu presente foi escolhido! Muito obrigado e que Deus abençoe!
						</div>
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
			
					<div>
						<table class="table table-condensed">
							<thead>
								<tr>
									<th></th>
									<th><fmt:message key="coluna.presente"/></th>
									<th><fmt:message key="coluna.quantidade"/></th>
									<th></th>
									<th></th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${presenteList}" var="presente" varStatus="contador">
									<tr ${presente.ok ? 'class="success"' : ''}>
										<td>${contador.count}</td>
										<td>${presente.nome}</td>
										<td>${presente.quantidade}</td>
										<td><c:if test="${presente.familia != null}">
												<span class="glyphicon glyphicon-heart"></span>
												<fmt:message key="coluna.familia" />: ${presente.familia.nome}
											</c:if></td>
										<td id="action" align="right"><span id="span-${presente.id}"
											class="cursor glyphicon glyphicon-${presente.ok ? 'ok text-success' : 'plus'}"></span>
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				
				</div>
			</div>
		</div>
	</div>
	<!-- /.container -->

    <jsp:include page="../footer.jsp" />
    
</body>
</html>
