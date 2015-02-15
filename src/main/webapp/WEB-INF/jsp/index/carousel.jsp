<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<script type="text/javascript">
	$('.carousel').carousel({
		interval : 5000
	});
</script>

<div class="row">
	<div class="box">
		<div class="col-lg-12 text-center">

			<div id="carousel" class="carousel slide" data-ride="carousel">
				<ol class="carousel-indicators">
					<li data-target="#carousel" data-slide-to="0" class="active"></li>
					<li data-target="#carousel" data-slide-to="1" class=""></li>
					<li data-target="#carousel" data-slide-to="2" class=""></li>
					<li data-target="#carousel" data-slide-to="3" class=""></li>
					<li data-target="#carousel" data-slide-to="4" class=""></li>
					<li data-target="#carousel" data-slide-to="5" class=""></li>
				</ol>
				<div class="carousel-inner" role="listbox">
					<div class="item active">
						<img alt="<fmt:message key="site.titulo" />"
							src="${pageContext.request.contextPath}/assets/images/<fmt:message key="pauloelay.imagem1" />">
						<div class="container">
							<div class="carousel-caption">
								<h1>Seja bem-vindo!</h1>
								<p>Ave Maria cheia de graça, o Senhor é convosco, bendita és
									Tu entre as mulheres, e bendito é o fruto do vosso ventre,
									Jesus. Santa Maria, Mãe de Deus, rogai por nós pecadores, agora
									e na hora de nossa morte. Amém</p>
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
									fique a vontade de escolher e comprar na loja de sua
									preferência.</p>
								<p>
									<a class="btn btn-large btn-primary"
										href="${linkTo[PresentesController].casamento}">Escolher</a>
								</p>
							</div>
						</div>
					</div>
					<div class="item">
						<img alt="<fmt:message key="site.titulo" />"
							src="${pageContext.request.contextPath}/assets/images/<fmt:message key="pauloelay.imagem3" />">
						<div class="container">
							<div class="carousel-caption">
								<h1>Confirmar Presença</h1>
								<p>
									Não deixe de <a href="${linkTo[FamiliasController].presenca}">confirmar
										sua presença.</a>
								</p>
							</div>
						</div>
					</div>
					<div class="item">
						<img alt="<fmt:message key="site.titulo" />"
							src="${pageContext.request.contextPath}/assets/images/<fmt:message key="pauloelay.imagem4" />">
						<div class="container">
							<div class="carousel-caption">
								<h1>Cerimônia de casamento</h1>
								<p>
									A missa será na <a href="#cerimonia">Paróquia São Judas
										Tadeu, Taguatinga Norte.</a>
								</p>
							</div>
						</div>
					</div>
					<div class="item">
						<img alt="<fmt:message key="site.titulo" />"
							src="${pageContext.request.contextPath}/assets/images/<fmt:message key="pauloelay.imagem5" />">
						<div class="container">
							<div class="carousel-caption">
								<h1>Recepção dos convidados</h1>
								<p>
									A festa de casamento será no <a href="#recepcao">Salão
										Nobre (Lar dos Velhinhos), Taguatinga Sul.</a>
								</p>
							</div>
						</div>
					</div>
					<div class="item">
						<img alt="<fmt:message key="site.titulo" />"
							src="${pageContext.request.contextPath}/assets/images/<fmt:message key="pauloelay.imagem6" />">
						<div class="container">
							<div class="carousel-caption">
								<h1>Obrigado, Deus abençoe</h1>
								<p>Esperamos por você, sua presença é muito especial para
									nós.</p>
							</div>
						</div>
					</div>
				</div>
				<a class="left carousel-control" href="#carousel" role="button"
					data-slide="prev"> <span
					class="glyphicon glyphicon-chevron-left"></span> <span
					class="sr-only">Anterior</span>
				</a> <a class="right carousel-control" href="#carousel" role="button"
					data-slide="next"> <span
					class="glyphicon glyphicon-chevron-right"></span> <span
					class="sr-only">Próximo</span>
				</a>
			</div>
			<!-- /.carousel -->

			<h2 class="brand-before">
				<small>Seja bem-vindo ao site dos noivos</small>
			</h2>
			<h1 class="brand-name">
				<fmt:message key="site.titulo" />
			</h1>
			<hr class="tagline-divider">
			<h2>
				<small>com <strong>O pé no altar!</strong>
				</small>
			</h2>

		</div>
	</div>
</div>

