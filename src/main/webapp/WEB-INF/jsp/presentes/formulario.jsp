<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<div class="row text-center">
	<div class="box">
		<div class="col-lg-12 text-left">

			<div class="page-header">
				<h1>
					<fmt:message key="presentes.titulo" />
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

			<form action="${linkTo[PresentesController].salva}#main"
				method="post" id="form-presente" role="form">
				<input type="hidden" name="presente.id" value="${presente.id}" />
				<div class="form-group">
					<label for="nome"><fmt:message key="presentes.campo.nome" /></label>
					<input type="text" id="nome" name="presente.nome"
						class="form-control" value="${presente.nome}">
				</div>
				<div class="form-group">
					<label for="quantidade"><fmt:message
							key="presentes.campo.quantidade" /></label> <input type="text"
						id="quantidade" name="presente.quantidade" class="form-control"
						placeholder="0" value="${presente.quantidade}">
				</div>
				<div class="form-group">
					<label for="tipo"><fmt:message key="presentes.campo.tipo" /></label>
					<select id="tipo" name="presente.tipo" class="form-control">
						<option value="0"
							${presente.tipo == 'CHA_DE_PANELA' ? 'selected' : ''}><fmt:message
								key="tipo.presente.cha" /></option>
						<option value="1"
							${presente.tipo == 'CASAMENTO' ? 'selected' : ''}><fmt:message
								key="tipo.presente.casamento" /></option>
					</select>
				</div>
				<button type="submit" id="btn-submit" class="btn btn-primary">
					<fmt:message key="botao.confirmar" />
				</button>
				<a class="btn btn-default"
					href="${linkTo[PresentesController].casamento}" role="button"><fmt:message
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
							<th><fmt:message key="coluna.presente" /></th>
							<th><fmt:message key="coluna.quantidade" /></th>
							<th></th>
							<th><fmt:message key="coluna.tipo" /></th>
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
								<td>${presente.tipo}</td>
								<td id="action" align="right"><a
									href="${linkTo[PresentesController].edita}${presente.id}#main">
										<span id="span-${presente.id}"
										class="cursor glyphicon glyphicon-pencil"></span>
								</a> <span id="span-${presente.id}"
									class="cursor glyphicon glyphicon-trash"></span></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>

		</div>
	</div>
</div>
