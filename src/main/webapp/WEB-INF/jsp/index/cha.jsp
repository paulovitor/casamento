<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<div class="row text-center">
	<div class="box">
		<div class="col-lg-12">
			<hr>
			<h2 class="intro-text text-center">
				07 de dezembro de 2014 | 17:00 horas <strong>Chá de Panela</strong>
			</h2>
			<hr>
		</div>
		<div class="col-md-6 modal-cha">
			<a href="#localizacao" data-toggle="modal"> <span
				class="fa-stack fa-4x"> <i
					class="fa fa-circle fa-stack-2x text-primary"></i> <i
					class="fa fa-location-arrow fa-stack-1x fa-inverse"></i>
			</span>
			</a>
			<h4 class="service-heading">Localização</h4>
			<p class="text-muted">Informações sobre local onde aconteceu o
				chá de panela.</p>
		</div>
		<div class="col-md-6 modal-cha">
			<a href="#presentes" data-toggle="modal"> <span
				class="fa-stack fa-4x"> <i
					class="fa fa-circle fa-stack-2x text-primary"></i> <i
					class="fa fa-check fa-stack-1x fa-inverse"></i>
			</span>
			</a>
			<h4 class="service-heading">Presentes</h4>
			<p class="text-muted">Confira a lista de presentes ganhados.</p>
		</div>
		<div class="cha-modal modal fade" id="localizacao" tabindex="-1"
			role="dialog" aria-hidden="true"></div>
		<div class="cha-modal modal fade" id="presentes" tabindex="-1"
			role="dialog" aria-hidden="true"></div>
	</div>
</div>

<script type="text/javascript">
	$(document).ready(function() {
		$(".modal-cha>a").on('click', function() {

			var id = $(this).attr('href');
			var url = id.replace("#", "") + "/cha";
			var $modal = $(id);

			setTimeout(function() {
				$modal.load(url, '', function() {
					$modal.modal();
				});
			}, 1000);
		});
	});
</script>
