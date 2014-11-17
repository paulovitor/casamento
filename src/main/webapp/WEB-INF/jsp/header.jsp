<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<script type="text/javascript">
	$(document).ready(function() {
		var path = window.location.pathname;
		path = decodeURIComponent(path);
		if (path != "") {
			if (path !== $('ul#menu>li:first>a').attr('href'))
				$('audio').removeAttr('autoplay');
			$('ul#menu>li').removeClass('active');
			$('ul#menu>li').each(function() {
				var url = $(this).children('a').attr('href');
				if (path === url) {
					$(this).addClass("active");
				}
			});
		}
		$('.carousel').carousel({
			interval : 5000
		});
	});
</script>

<div class="navbar-wrapper">
	<div class="container">
		<nav class="navbar navbar-inverse navbar-static-top" role="navigation">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#navbar" aria-expanded="false"
					aria-controls="navbar">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span><span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#"><fmt:message key="site.titulo" /></a>
			</div>
			<div id="navbar" class="collapse navbar-collapse">
				<ul id="menu" class="nav navbar-nav">
					<li id="index" class="active"><a
						href="${linkTo[IndexController].index}"><fmt:message
								key="menu.inicio" /></a></li>
					<li id="presentes"><a
						href="${linkTo[PresentesController].lista}"><fmt:message
								key="menu.presentes" /></a></li>
					<li id="presentes"><a
						href="${linkTo[IndexController].informacoes}"><fmt:message
								key="menu.informacoes" /></a></li>
				</ul>
				<div class="navbar-form navbar-right">
					<audio controls autoplay="autoplay"
						title="<fmt:message
										key="musica.titulo" />">
						<source
							src="${pageContext.request.contextPath}/assets/songs/<fmt:message
										key="musica.nome" />"
							type="audio/mpeg" />
						<a
							href="${pageContext.request.contextPath}/assets/songs/<fmt:message
										key="musica.nome" />"><fmt:message
								key="musica.titulo" /></a>
					</audio>
				</div>
			</div>
		</nav>
	</div>
	<!-- /container -->
</div>
<!-- /navbar wrapper -->

<!-- Carousel -->
<div id="carousel" class="carousel slide" data-ride="carousel">
	<!-- Indicators -->
	<ol class="carousel-indicators">
		<li data-target="#carousel" data-slide-to="0" class=""></li>
		<li data-target="#carousel" data-slide-to="1" class="active"></li>
		<li data-target="#carousel" data-slide-to="2" class=""></li>
	</ol>
	<div class="carousel-inner" role="listbox">
		<div class="item active">
			<img alt="<fmt:message key="site.titulo" />"
				src="${pageContext.request.contextPath}/assets/images/<fmt:message key="pauloelay.imagem1" />">
			<div class="container">
				<div class="carousel-caption">
					<h1>Seja bem-vindo!</h1>
					<p>Ave Maria cheia de graça, o Senhor é convosco, bendita és Tu
						entre as mulheres, e bendito é o fruto do vosso ventre, Jesus.
						Santa Maria, Mãe de Deus, rogai por nós pecadores, agora e na hora
						de nossa morte. Amém</p>
				</div>
			</div>
		</div>
		<div class="item">
			<img alt="<fmt:message key="site.titulo" />"
				src="${pageContext.request.contextPath}/assets/images/<fmt:message key="pauloelay.imagem2" />">
			<div class="container">
				<div class="carousel-caption">
					<h1>Lista de Presentes</h1>
					<p>Deixamos disponível a lista de presentes em nosso site,
						fique a vontade de escolher e comprar na loja de sua preferência.</p>
					<p>
						<a class="btn btn-large btn-primary"
							href="${linkTo[PresentesController].lista}">Escolher</a>
					</p>
				</div>
			</div>
		</div>
		<div class="item">
			<img alt="<fmt:message key="site.titulo" />"
				src="${pageContext.request.contextPath}/assets/images/<fmt:message key="pauloelay.imagem3" />">
			<div class="container">
				<div class="carousel-caption">
					<h1>Obrigado, Deus abençoe</h1>
					<p>Esperamos por você, sua presença é muito especial para nós.</p>
				</div>
			</div>
		</div>
	</div>
	<a class="left carousel-control" href="#carousel" role="button"
		data-slide="prev"> <span class="glyphicon glyphicon-chevron-left"></span>
		<span class="sr-only">Anterior</span>
	</a> <a class="right carousel-control" href="#carousel" role="button"
		data-slide="next"> <span class="glyphicon glyphicon-chevron-right"></span>
		<span class="sr-only">Próximo</span>
	</a>
</div>
<!-- /.carousel -->
