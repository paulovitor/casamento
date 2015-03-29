<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<script type="text/javascript">
	var url = "${linkTo[FamiliasController].popUp}";
	$(document).ready(function() {
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

<div class="row">
	<div class="box">
		<div class="col-lg-12">

			<div class="page-header">
				<h1>
					<fmt:message key="presentes.titulo" />
				</h1>
			</div>

			<div class="panel panel-info">
				<div class="panel-heading">
					<h3 class="panel-title">
						<fmt:message key="presentes.subtitulo" />
					</h3>
				</div>
				<div class="panel-body">
					<span class="badge">1</span> Clique no icone <span
						class="glyphicon glyphicon-plus"></span><br /> <span
						class="badge">2</span> Preencha os campos
					<kbd><fmt:message key="campo.nome" /></kbd>
					e
					<kbd><fmt:message key="campo.email" /></kbd>
					no formulário<br /> <span class="badge">3</span> Clique no botão
					<kbd><fmt:message key="botao.confirmar" /></kbd>
					<br /> <span class="badge">4</span> Pronto, seu presente foi
					escolhido! Muito obrigado e que Deus abençoe!
				</div>
			</div>

			<c:if test="${mensagem != null}">
				<div class="alert alert-${tipo}" role="alert">${mensagem}</div>
			</c:if>

			<c:if test="${errors != null}">
				<div class="alert alert-danger" role="alert">
					<c:forEach items="${errors}" var="error">
						<li>${error.category}:${error.message}</li>
					</c:forEach>
				</div>
			</c:if>

			<jsp:include page="lista.jsp">
				<jsp:param name="action" value="casamento" />
			</jsp:include>

		</div>
	</div>
</div>
