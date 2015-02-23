<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
					
					<jsp:include page="lista.jsp">
						<jsp:param name="action" value="cha" />
					</jsp:include>
					
					<br />
					<button type="button" class="btn btn-primary" data-dismiss="modal">
						<i class="fa fa-times"></i>Voltar
					</button>
				</div>
			</div>
		</div>
	</div>
</div>
