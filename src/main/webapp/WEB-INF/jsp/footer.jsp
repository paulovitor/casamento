<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<jsp:useBean id="date" class="java.util.Date" />
<!DOCTYPE html>

<footer>
	<div class="container">
		<div class="row">
			<div class="col-lg-12 text-center">
				<p>
					Copyright &copy;
					<fmt:message key="site.titulo" />
					<fmt:formatDate value="${date}" pattern="yyyy" />
				</p>
			</div>
		</div>
	</div>
</footer>