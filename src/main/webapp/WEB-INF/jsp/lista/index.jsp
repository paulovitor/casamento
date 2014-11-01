<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Paulo e Layanne</title>

<!-- Bootstrap -->
<link href="../css/bootstrap.min.css" rel="stylesheet">

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="../js/bootstrap.min.js"></script>
<style type="text/css">
body {
	min-height: 2000px;
	padding-top: 70px;
}
</style>
</head>
<body>
	<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#navbar" aria-expanded="false"
					aria-controls="navbar">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#">Paulo e Layanne</a>
			</div>
			<div id="navbar" class="collapse navbar-collapse">
				<ul class="nav navbar-nav">
					<li class="active"><a href="${linkTo[SiteController].index}">Home</a></li>
					<li><a href="${linkTo[ListaController].index}">Lista de
							Presentes</a></li>
					<li><a href="#contact">Contact</a></li>
				</ul>
			</div>
			<!--/.nav-collapse -->
		</div>
	</nav>

	<div class="container">

		<h1>Lista de Presentes</h1>

		<div>
			<table class="table table-condensed">
				<thead>
					<tr>
						<th>#</th>
						<th>Presente</th>
						<th></th>
						<th></th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>1</td>
						<td>Açucareiro</td>
						<td></td>
						<td align="right"><span class="glyphicon glyphicon-play"></span></td>
					</tr>
					<tr>
						<td>2</td>
						<td>Jogo de Panela</td>
						<td></td>
						<td align="right"><span class="glyphicon glyphicon-remove"></span></td>
					</tr>
					<tr class="success">
						<td>3</td>
						<td>Vasilhas</td>
						<td align="center"><span class="glyphicon glyphicon-heart"></span> Família Freitas</td>
						<td align="right"><span class="glyphicon glyphicon-ok"></span></td>
					</tr>
				</tbody>
			</table>
		</div>

	</div>
</body>
</html>
