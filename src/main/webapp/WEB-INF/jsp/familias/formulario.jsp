<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<div class="row text-center">
	<div class="box">
		<div class="col-lg-12 text-left">

			<div class="page-header">
				<h1>
					<fmt:message key="familias.titulo" />
				</h1>
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

			<form action="${linkTo[FamiliasController].salva}#main" method="post"
				id="form-familia" role="form">
				<input type="hidden" name="familia.id" value="${familia.id}" />
				<div class="form-group">
					<label for="nome"><fmt:message key="familias.campo.nome" /></label>
					<input type="text" id="nome" name="familia.nome"
						class="form-control" value="${familia.nome}">
				</div>
				<div class="form-group">
					<label for="email"><fmt:message key="familias.campo.email" /></label>
					<input type="text" id="email" name="familia.email"
						class="form-control" value="${familia.email}">
				</div>
				<button type="submit" id="btn-submit" class="btn btn-primary">
					<fmt:message key="botao.confirmar" />
				</button>
				<a class="btn btn-default"
					href="${linkTo[FamiliasController].formulario}" role="button"><fmt:message
						key="botao.cancelar" /></a>
			</form>

		</div>
	</div>
</div>

<div class="row text-center">
	<div class="box">
		<div class="col-lg-12 text-left">

			<div>
				<table class="table table-condensed">
					<thead>
						<tr>
							<th></th>
							<th><fmt:message key="coluna.nome" /></th>
							<th><fmt:message key="coluna.email" /></th>
							<th></th>
					</thead>
					<tbody>
						<c:forEach items="${familiasList}" var="familia"
							varStatus="contador">
							<tr>
								<td>${contador.count}</td>
								<td>${familia.nome}</td>
								<td>${familia.email}</td>
								<td id="action" align="right"><a
									href="${linkTo[FamiliasController].edita}${familia.id}#main">
										<span id="span-${familia.id}"
										class="cursor glyphicon glyphicon-pencil"></span>
								</a> <a
									href="${linkTo[FamiliasController].exclui}${familia.id}#main">
										<span id="span-${familia.id}"
										class="cursor glyphicon glyphicon-trash"></span>
								</a></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>

		</div>
	</div>
</div>
