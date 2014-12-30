<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<script type="text/javascript">
	$(document).ready(function() {
		$('#btn-cancel').on('click', function() {
			$('#span-' + $('#id-presente').val()).popover('hide');
		});
	});
</script>
<form action="${linkTo[FamiliasController].adiciona}"
	method="post" id="form-popover" role="form">
	<input type="hidden" id="id-presente" name="idPresente" value="${id}" />
	<div class="form-group">
		<label for="nome"><fmt:message key="familia.campo.nome" /></label> <input
			type="text" id="nome" name="familia.nome" class="form-control"
			placeholder="<fmt:message key="familia.sugestao.nome" />">
	</div>
	<div class="form-group">
		<label for="email"><fmt:message key="familia.campo.email" /></label> <input
			type="email" id="email" name="familia.email" class="form-control"
			placeholder="<fmt:message key="familia.sugestao.email" />">
	</div>
	<button type="submit" id="btn-submit" class="btn btn-primary">
		<fmt:message key="botao.confirmar" />
	</button>
	<button type="button" id="btn-cancel" class="btn btn-default">
		<fmt:message key="botao.cancelar" />
	</button>
</form>