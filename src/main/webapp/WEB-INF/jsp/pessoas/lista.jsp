<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<div>
	<table class="table table-condensed">
		<thead>
			<tr>
				<th></th>
				<th>Nome</th>
				<th></th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${pessoasList}" var="pessoa" varStatus="contador">
				<tr ${pessoa.confirmado ? 'class="success"' : ''}>
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