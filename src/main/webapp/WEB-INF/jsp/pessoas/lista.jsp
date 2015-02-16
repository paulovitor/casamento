<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<script type="text/javascript">
	$(document).ready(function() {
		$("#action>span").on('click', function() {
			var spanId = '#' + $(this).attr('id');
			if ($(spanId).attr('class').indexOf('glyphicon-plus') > 0) {
				var id = spanId.replace("#span-", "");
				var url = "${linkTo[PessoasController].confirma}" + id;
				$.get(url, function(data) {
					if (data.pessoa != null && data.pessoa != 'undefined') {
						$('#tr-' + id).attr('class', 'success');
						$(spanId).attr('class', 'cursor glyphicon glyphicon-ok text-success');
					}
				});
			}
		});
	});
</script>

<div>
	<table class="table table-condensed">
		<thead>
			<tr>
				<th></th>
				<th><fmt:message key="coluna.pessoa" /></th>
				<th></th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${pessoasList}" var="pessoa" varStatus="contador">
				<tr id="tr-${pessoa.id}" ${pessoa.confirmado ? 'class="success"' : ''}>
					<td>${contador.count}</td>
					<td>${pessoa.nome}</td>
					<td id="action" align="right"><span id="span-${pessoa.id}"
						class="cursor glyphicon glyphicon-${pessoa.confirmado ? 'ok text-success' : 'plus'}"></span>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>