<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!-- typeahead -->
<script
	src="${pageContext.request.contextPath}/assets/bower_components/typeahead.js/dist/typeahead.bundle.min.js"></script>

<script type="text/javascript">
	$(document).ready(function() {
		$('#nome').typeahead(null, {
			name : 'list',
			displayKey : 'nome',
			source : function(query, process) {
				var url = "${linkTo[FamiliasController].buscaPorNome}" + query;
				return $.get(url, function(data) {
					return process(data.list);
				});
			}
		});

		$('#nome').on('typeahead:selected', function(e, selected) {
			if (selected != null && selected != 'undefined') {
				var url = "${linkTo[PessoasController].lista}" + selected.id;
				$.get(url, function(data) {
					$("#pessoas").html(data);
				});
			}
		});
	});
</script>

<div class="row">
	<div class="box">
		<div class="col-lg-12">

			<div class="page-header">
				<h1>
					<fmt:message key="familias.presenca.titulo" />
				</h1>
			</div>

			<div id="familia" class="col-lg-6">

				<form id="form-presenca" role="form">
					<div class="form-group input-group">
						<input type="text" id="nome" name="familias.nome"
							class="form-control"
							placeholder="<fmt:message key="familias.campo.nome" />">
						<span class="input-group-btn">
							<button class="btn btn-default" type="button">
								<i class="fa fa-search"></i>
							</button>
						</span>
					</div>
				</form>

			</div>

			<div id="pessoas" class="col-lg-6"></div>

		</div>
	</div>
</div>