<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<div>
	<table class="table table-condensed">
		<thead>
			<tr>
				<th></th>
				<th><fmt:message key="coluna.presente" /></th>
				<th><fmt:message key="coluna.quantidade" /></th>
				<th></th>
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
					<td>
						<c:if test="${presente.familia != null}">
							<span class="glyphicon glyphicon-heart"></span>
							<fmt:message key="coluna.familia" />: ${presente.familia.nome}
											</c:if> <c:if test="${presente.pessoa != null}">
							<span class="glyphicon glyphicon-heart"></span>
												${presente.pessoa.nome}
						</c:if>
					</td>
					<td id="action" align="right">
						<c:if test="${param.action == 'cha'}">
							<span id="span-${presente.id}"
								class="cursor glyphicon ${presente.ok ? 'glyphicon-ok text-success' : ''}"></span>
						</c:if>
						<c:if test="${param.action == 'casamento'}">
							<span id="span-${presente.id}"
								class="cursor glyphicon glyphicon-${presente.ok ? 'ok text-success' : 'plus'}"></span>
						</c:if>
						<c:if test="${param.action == 'formulario'}">
							<a href="${linkTo[PresentesController].edita}${presente.id}#main">
								<span id="span-${presente.id}"
									class="cursor glyphicon glyphicon-pencil"></span>
							</a>
							<a href="${linkTo[PresentesController].exclui}${presente.id}#main">
								<span id="span-${presente.id}"
									class="cursor glyphicon glyphicon-trash"></span>
							</a>
						</c:if>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>