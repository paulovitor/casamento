<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<div class="row text-center">
	<div class="box">
		<div class="col-lg-12 text-left">

			<div class="page-header">
				<h1>
					<fmt:message key="pessoas.titulo" />
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

			<form action="${linkTo[PessoasController].salva}#main" method="post"
				id="form-pessoa" role="form">
				<input type="hidden" name="pessoa.id" value="${pessoa.id}" />
				<div class="form-group">
					<label for="nome"><fmt:message key="pessoas.campo.nome" /></label>
					<input type="text" id="nome" name="pessoa.nome"
						class="form-control" value="${pessoa.nome}">
				</div>
				<div class="form-group">
					<label for="familia"><fmt:message
							key="pessoas.campo.familia" /></label> <select id="familia"
						name="pessoa.familia.id" class="form-control">
						<c:forEach items="${familiasList}" var="familia">
							<option value="${familia.id}"
								${pessoa.familia != null && familia.id == pessoa.familia.id  ? 'selected' : ''}>${familia.nome}</option>
						</c:forEach>
					</select>
				</div>
				<button type="submit" id="btn-submit" class="btn btn-primary">
					<fmt:message key="botao.confirmar" />
				</button>
				<a class="btn btn-default"
					href="${linkTo[PessoasController].formulario}" role="button"><fmt:message
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
							<th><fmt:message key="coluna.familia" /></th>
							<th></th>
					</thead>
					<tbody>
						<c:forEach items="${pessoasList}" var="pessoa"
							varStatus="contador">
							<tr ${pessoa.confirmado ? 'class="success"' : ''}>
								<td>${contador.count}</td>
								<td>${pessoa.nome}</td>
								<td>${pessoa.familia.nome}</td>
								<td id="action" align="right"><a
									href="${linkTo[PessoasController].edita}${pessoa.id}#main">
										<span id="span-${pessoa.id}"
										class="cursor glyphicon glyphicon-pencil"></span>
								</a> <span id="span-${pessoa.id}"
									class="cursor glyphicon glyphicon-trash"></span></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>

		</div>
	</div>
</div>
