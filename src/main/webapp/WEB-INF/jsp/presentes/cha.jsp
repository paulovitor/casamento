<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<div class="modal-content text-left">
	<div class="close-modal" data-dismiss="modal">
		<div class="lr">
			<div class="rl"></div>
		</div>
	</div>
	<div class="container">
		<div class="row">
			<div class="col-lg-8 col-lg-offset-2">
				<div class="modal-body">
					<h2>
						<fmt:message key="presentes.titulo.cha" />
					</h2>
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
									<td><c:if test="${presente.familia != null}">
											<span class="glyphicon glyphicon-heart"></span>
											<fmt:message key="coluna.familia" />: ${presente.familia.nome}
							</c:if></td>
									<td id="action" align="right"><span
										id="span-${presente.id}"
										class="cursor glyphicon ${presente.ok ? 'glyphicon-ok text-success' : ''}"></span>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<br />
					<button type="button" class="btn btn-primary" data-dismiss="modal">
						<i class="fa fa-times"></i>Voltar
					</button>
				</div>
			</div>
		</div>
	</div>
</div>
