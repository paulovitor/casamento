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
		window.setTimeout(function() { $(".alert").alert('close'); }, 5000);
		
		var popoverSettings = {
			placement : 'left',
			container : 'body',
			html : true,
			content : function(settings) {
				var id = parseInt($(this).attr('id').replace("span-", ""));
				return $.ajax({
			        url: "popover",
			        data: { id: id },
			        dataType: "html",
			        async: false
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

	<div id="header">
		<jsp:include page="../header.jsp" />
	</div>
	
	<div class="container">

		<div class="page-header">
			<h1>Lista de Presentes (Chá de Panela)</h1>
		</div>

		<div class="panel panel-info">
			<div class="panel-heading">
				<h3 class="panel-title">Como escolher um presente?</h3>
			</div>
			<div class="panel-body">
				<span class="badge">1</span> Clique no icone <span
					class="glyphicon glyphicon-plus"></span><br /> <span class="badge">2</span>
				Preencha os campos
				<kbd>nome da família</kbd>
				e
				<kbd>endereço de email</kbd>
				no formulário<br /> <span class="badge">3</span> Seu presente foi
				escolhido! Muito obrigado e que Deus abençoe!
			</div>
		</div>
		
		<c:if test="${mensagem != null}">
			<div class="alert alert-${tipo}" role="alert">${mensagem}</div>
		</c:if>
		
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
							<td id="action" align="right"><span id="span-${presente.id}"
								class="cursor glyphicon glyphicon-${presente.ok ? 'ok text-success' : 'plus'}"></span>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		
	</div>
	
</body>
</html>
