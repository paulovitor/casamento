<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>

<script type="text/javascript">
	$(document).ready(function() {
		$("#panel-localizacao-cha>a").on('click', function() {
			$.ajax({
				url : "localizacao/cha",
				type : "GET",
				dataType : "html",
				cache : false,
				success : function(result) {
					$('#localizacao-cha').html(result);
				},
				error : function() {
					alert("erro");
				},
			});
		});
		$("#panel-presentes-cha>a").on('click', function() {
			$.ajax({
				url : "presentes/cha",
				type : "GET",
				dataType : "html",
				cache : false,
				success : function(result) {
					$('#presentes-cha').html(result);
				},
				error : function() {
					alert("erro");
				},
			});
		});
	});
</script>

<div class="col-lg-12">

	<hr>
	<h2 class="intro-text text-center">
		07 de dezembro de 2014 | 17:00 horas <strong>Chá de Panela</strong>
	</h2>
	<hr>

</div>
<div class="col-md-6">

	<div class="panel panel-default text-center">
		<div class="panel-heading">
			<span class="fa-stack fa-5x"> <i
				class="fa fa-circle fa-stack-2x text-primary"></i> <i
				class="fa fa-tree fa-stack-1x fa-inverse"></i>
			</span>
		</div>
		<div id="panel-localizacao-cha" class="panel-body">
			<h4>Localização</h4>
			<p>Informações sobre local onde aconteceu o chá de panela.</p>
			<a href="#localizacao-cha" class="btn btn-primary"
				data-toggle="modal">Mostrar</a>
		</div>
	</div>

</div>
<div class="col-md-6">

	<div class="panel panel-default text-center">
		<div class="panel-heading">
			<span class="fa-stack fa-5x"> <i
				class="fa fa-circle fa-stack-2x text-primary"></i> <i
				class="fa fa-tree fa-stack-1x fa-inverse"></i>
			</span>
		</div>
		<div id="panel-presentes-cha" class="panel-body">
			<h4>Presentes</h4>
			<p>Confira a lista de presentes ganhados.</p>
			<a href="#presentes-cha" class="btn btn-primary" data-toggle="modal">Mostrar</a>
		</div>
	</div>

</div>

<div class="cha-modal modal fade" id="localizacao-cha" tabindex="-1"
	role="dialog" aria-hidden="true"></div>
<div class="cha-modal modal fade" id="presentes-cha" tabindex="-1"
	role="dialog" aria-hidden="true"></div>
