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
						<option value><fmt:message key="presentes.sugestao.tipo" /></option>
						<option value="0"
							${presente.tipo == 'CHA_DE_PANELA' ? 'selected' : ''}><fmt:message
								key="tipo.presente.cha" /></option>
						<option value="1"
							${presente.tipo == 'CASAMENTO' ? 'selected' : ''}><fmt:message
								key="tipo.presente.casamento" /></option>
					</select>
				</div>
				<div class="checkbox">
					<label for="ok"> <input type="checkbox" id="ok"
						name="presente.ok" ${presente.ok ? 'checked' : ''}> <fmt:message
							key="presentes.campo.ok" />
					</label>
				</div>
				<div class="form-group">
					<label for="familia"><fmt:message
							key="presentes.campo.familia" /></label> <select id="familia"
						name="presente.familia.id" class="form-control">
						<option value><fmt:message
								key="presentes.sugestao.familia" /></option>
						<c:forEach items="${familiasList}" var="familia">
							<option value="${familia.id}"
								${presente.familia != null && familia.id == presente.familia.id  ? 'selected' : ''}>${familia.nome}</option>
						</c:forEach>
					</select>
				</div>
				<div class="form-group">
					<label for="pessoa"><fmt:message
							key="presentes.campo.pessoa" /></label> <select id="pessoa"
						name="presente.pessoa.id" class="form-control">
						<option value><fmt:message
								key="presentes.sugestao.pessoa" /></option>
						<c:forEach items="${pessoasList}" var="pessoa">
							<option value="${pessoa.id}"
								${presente.pessoa != null && pessoa.id == presente.pessoa.id  ? 'selected' : ''}>${pessoa.nome}</option>
						</c:forEach>
					</select>
				</div>
				<button type="submit" id="btn-submit" class="btn btn-primary">
					<fmt:message key="botao.confirmar" />
				</button>
				<a class="btn btn-default"
					href="${linkTo[PresentesController].formulario}" role="button"><fmt:message
						key="botao.cancelar" /></a>
			</form>

		</div>
	</div>
</div>

<div class="row text-center">
	<div class="box">
		<div class="col-lg-12 text-left">

			<jsp:include page="lista.jsp">
				<jsp:param name="action" value="formulario" />
			</jsp:include>

		</div>
	</div>
</div>
