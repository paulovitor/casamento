<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<div class="row">
	<div class="box">
		<div class="col-lg-12">

			<div class="page-header">
				<h1>
					<fmt:message key="login.titulo" />
				</h1>
			</div>

			<c:if test="${errors != null}">
				<div class="alert alert-danger" role="alert">
					<c:forEach items="${errors}" var="error">
						<li>${error.category}:${error.message}</li>
					</c:forEach>
				</div>
			</c:if>

			<form action="${linkTo[LoginController].login}" method="post"
				id="form-login" role="form">
				<div class="form-group">
					<label for="login"><fmt:message key="usuario.campo.login" /></label>
					<input type="text" id="login" name="usuario.login"
						class="form-control" value="${usuario.login}">
				</div>
				<div class="form-group">
					<label for="senha"><fmt:message key="usuario.campo.senha" /></label>
					<input type="password" id="senha" name="usuario.senha"
						class="form-control" value="${usuario.senha}">
				</div>
				<button type="submit" id="btn-submit" class="btn btn-primary">
					<fmt:message key="botao.confirmar" />
				</button>
				<a class="btn btn-default" href="${linkTo[IndexController].index}"
					role="button"><fmt:message key="botao.cancelar" /></a>
			</form>

		</div>
	</div>
</div>