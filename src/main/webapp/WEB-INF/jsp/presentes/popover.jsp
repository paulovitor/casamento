<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<script type="text/javascript">
	$(document).ready(function() {
		$('#btn-cancel').on('click', function() {
			$('#span-' + $('#id-presente').val()).popover('hide');
		});
	});
</script>

<form action="${linkTo[PresentesController].adicionaFamilia}" method="get" id="form-popover" role="form">
	<div class="form-group">
		<label for="nome">Nome da família</label> <input type="text" id="nome"
			name="nome" class="form-control"
			placeholder="preencha com o nome">
	</div>
	<div class="form-group">
		<label for="email">Endereço de email</label> <input type="email"
			id="email" name="email" class="form-control"
			placeholder="preencha com o email">
	</div>
	<button type="submit" id="btn-submit" class="btn btn-primary">Escolher</button>
	<button type="button" id="btn-cancel" class="btn btn-default">Cancelar</button>
	<input type="hidden" id="id-presente" name="idPresente" value="${id}"/>
</form>