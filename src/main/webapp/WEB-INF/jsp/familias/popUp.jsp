<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!-- typeahead -->
<script
	src="${pageContext.request.contextPath}/assets/bower_components/typeahead.js/dist/typeahead.bundle.min.js"></script>

<script type="text/javascript">
	function getId(object) {
		return object.attr('id').replace('tipo-', '');
	}

	function setValues(tipo, selected) {
		if (selected != null && selected != 'undefined') {
			setValuesInFields(tipo, selected.id, selected.nome, selected.email);
		}
	}

	function setValuesInFields(tipo, id, nome, email) {
		$('#id-' + tipo).val(id);
		$('#nome-' + tipo).val(nome);
		$('#email-'  + tipo).val(email);
	}
	
	$(document).ready(function() {
		$('#btn-cancel').on('click', function() {
			$('#span-' + $('#id-presente').val()).popover('hide');
		});
		
		$('input[name=tipo]:radio').on('click', function() {
			var idChecked = getId($(this));
			var idNotChecked = getId($('input[name=tipo]:radio:not(:checked)'));
			
			$('#' + idChecked + 's').attr('class', 'show');
			$('#' + idNotChecked + 's').attr('class', 'hidden');

			setValuesInFields(idNotChecked, null, null, null);
		});

		$('#nome-pessoa').typeahead(null, {
			name : 'list',
			displayKey : 'nome',
			source : function(query, process) {
				var url = "${linkTo[PessoasController].buscaPorNome}" + query;
				return $.get(url, function(data) {
					return process(data.list);
				});
			}
		});
		
		$('#nome-familia').typeahead(null, {
			name : 'list',
			displayKey : 'nome',
			source : function(query, process) {
				var url = "${linkTo[FamiliasController].buscaPorNome}" + query;
				return $.get(url, function(data) {
					return process(data.list);
				});
			}
		});
		
		$('#nome-pessoa').on('typeahead:selected', function(e, selected) {
			setValues('pessoa', selected);
		});
		
		$('#nome-familia').on('typeahead:selected', function(e, selected) {
			setValues('familia', selected);
		});

		var urls = { 'pessoa': '${linkTo[PresentesController].adicionaPessoa}', 'familia': '${linkTo[PresentesController].adicionaFamilia}' };
		$('#btn-submit').on('click', function() {
			var id = getId($('input[name=tipo]:radio:checked'));

			$('#form-popover').attr('action', urls[id]);
			$('#form-popover').submit();
		});
	});
</script>

<form method="post"
	id="form-popover" role="form">
	<input type="hidden" id="id-presente" name="idPresente" value="${id}" />
	<div class="radio">
		<label for="tipo-pessoa">
			<input type="radio" name="tipo" id="tipo-pessoa"><fmt:message key="pessoas.pessoa" />
		</label>
		<label for="tipo-familia">
			<input type="radio" name="tipo" id="tipo-familia"><fmt:message key="familias.familia" />
		</label>
	</div>
	<div id="familias" class="hidden">
		<input type="hidden" id="id-familia" name="familia.id" />
		<div class="form-group">
			<label for="nome-familia"><fmt:message key="familias.campo.nome" /></label> <input
				type="text" id="nome-familia" name="familia.nome" class="form-control"
				placeholder="<fmt:message key="sugestao.nome" />">
		</div>
		<div class="form-group">
			<label for="email-familia"><fmt:message key="campo.email" /></label>
			<input type="email" id="email-familia" name="familia.email"
				class="form-control"
				placeholder="<fmt:message key="sugestao.email" />">
		</div>
	</div>
	<div id="pessoas" class="hidden">
		<input type="hidden" id="id-pessoa" name="pessoa.id" />
		<div class="form-group">
			<label for="nome-pessoa"><fmt:message key="pessoas.campo.nome" /></label> <input
				type="text" id="nome-pessoa" name="pessoa.nome" class="form-control"
				placeholder="<fmt:message key="sugestao.nome" />">
		</div>
		<div class="form-group">
			<label for="email-pessoa"><fmt:message key="campo.email" /></label>
			<input type="email" id="email-pessoa" name="pessoa.email"
				class="form-control"
				placeholder="<fmt:message key="sugestao.email" />">
		</div>
	</div>
	<button type="submit" id="btn-submit" class="btn btn-primary">
		<fmt:message key="botao.confirmar" />
	</button>
	<button type="button" id="btn-cancel" class="btn btn-default">
		<fmt:message key="botao.cancelar" />
	</button>
</form>