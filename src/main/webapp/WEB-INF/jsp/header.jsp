<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<script type="text/javascript">
	$(document).ready(function() {
		var path = window.location.pathname;
		path = path.replace('/casamento/', '');
		path = decodeURIComponent(path);
		if (path != "") {
			$('ul#menu>li').removeClass('active');
			$('ul#menu>li').each(function() {
				var id = $(this).attr('id');
				if (path.substring(0, id.length) === id) {
					$(this).addClass("active");
				}
			});
		}
	});
</script>
<nav class="navbar navbar-custom navbar-fixed-top" role="navigation">
	<div class="navbar-header">
		<button type="button" class="navbar-toggle collapsed"
			data-toggle="collapse" data-target="#navbar" aria-expanded="false"
			aria-controls="navbar">
			<span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span>
			<span class="icon-bar"></span><span class="icon-bar"></span>
		</button>
		<a class="navbar-brand" href="#"><fmt:message key="site.titulo" /></a>
	</div>
	<div id="navbar" class="collapse navbar-collapse">
		<ul id="menu" class="nav navbar-nav">
			<li id="index" class="active"><a href="${linkTo[IndexController].index}"><fmt:message
						key="menu.inicial" /></a></li>
			<li id="presentes"><a href="${linkTo[PresentesController].index}"><fmt:message
						key="menu.presentes" /></a></li>
		</ul>
	</div>
	<!--/.nav-collapse -->
</nav>