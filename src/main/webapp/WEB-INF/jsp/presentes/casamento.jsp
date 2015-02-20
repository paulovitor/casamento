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
					<kbd>
						<fmt:message key="familias.campo.nome" />
					</kbd>
					e
					<kbd>
						<fmt:message key="familias.campo.email" />
					</kbd>
					no formulário<br /> <span class="badge">3</span> Clique no botão
					<kbd>
						<fmt:message key="botao.confirmar" />
					</kbd>
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

			<div>
				<table class="table table-condensed">
					<thead>
						<tr>
							<th></th>
							<th><fmt:message key="coluna.presente" /></th>
							<th><fmt:message key="coluna.quantidade" /></th>
							<th></th>
							<th></th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${presenteList}" var="presente"
							varStatus="contador">
							<tr ${presente.ok ? 'class="success"' : ''}>
								<td>${contador.count}</td>
								<td>${presente.nome}</td>
								<td>${presente.quantidade}</td>
								<td><c:if test="${presente.familia != null}">
										<span class="glyphicon glyphicon-heart"></span>
										<fmt:message key="coluna.familia" />: ${presente.familia.nome}
											</c:if></td>
								<td id="action" align="right"><span
									id="span-${presente.id}"
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
