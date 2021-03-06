<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<nav class="navbar navbar-default" role="navigation">
	<div class="container">
		<!-- Brand and toggle get grouped for better mobile display -->
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target="#navbar">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<!-- navbar-brand is hidden on larger screens, but visible when the menu is collapsed -->
			<a class="navbar-brand" href="index.jsp"><fmt:message
					key="site.titulo" /></a>
		</div>
		<!-- Collect the nav links, forms, and other content for toggling -->
		<div class="collapse navbar-collapse" id="navbar">
			<ul id="menu" class="nav navbar-nav">
				<li><a href="${linkTo[IndexController].index}"><fmt:message
							key="menu.inicio" /></a></li>
				<li><a href="${linkTo[PresentesController].formulario}"><fmt:message
							key="menu.presentes" /></a></li>
				<li><a href="${linkTo[FamiliasController].formulario}"><fmt:message
							key="menu.familias" /></a></li>
				<li><a href="${linkTo[PessoasController].formulario}"><fmt:message
							key="menu.pessoas" /></a></li>
				<li><a href="${linkTo[LoginController].logout}"><fmt:message
							key="menu.sair" /></a></li>
			</ul>
		</div>
		<!-- /.navbar-collapse -->
	</div>
	<!-- /.container -->
</nav>
