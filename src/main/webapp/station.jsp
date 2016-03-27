<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1.0" />
<title>Starter Template - Materialize</title>

<!-- CSS  -->
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<link href="css/materialize.min.css" type="text/css" rel="stylesheet"
	media="screen,projection" />
<link href="css/zela.css" type="text/css" rel="stylesheet"
	media="screen,projection" />
</head>
<body>
	<!-- 页头，不用修改 -->
	<header> <nav class=" light-blue lighten-2">
	<div class="nav-wrapper container">
		<div href="#!" class="brand-logo">
			Station<a class="flow-text"> &nbsp;change.</a>
		</div>
		<a href="#" data-activates="nav-mobile" class="button-collapse"><i
			class="material-icons">menu</i></a>
		<ul id="nav-mobile" class="side-nav fixed"
			style="width: 200px; left: 0px;">
			<div class="card z-depth-0"
				style="margin: 0px 0px; padding: 0px 0px; list-style-type: none;">
				<div class="card-image waves-effect waves-block waves-light">
					<img class="activator" src="images/office.jpg">
				</div>
				<div class="card-content">
					<span class="card-title activator light-blue-text text-darken-4">User<i
						class="material-icons right">more_vert</i>
					</span>
				</div>
				<div class="card-reveal">
					<span class="card-title light-blue-text text-darken-4">User<i
						class="material-icons right">close</i></span>
					<div class="light-blue-text text-darken-2"
						style="font-size: 100%; line-height: 100%">Here is some more
						information about this user.</div>
				</div>
			</div>
			<div class="divider"></div>
			<li style="width: 100%"
				class="waves-effect waves-light light-blue-text text-lighten-2 active"><center>Station</center></li>
			<div class="divider"></div>
			<a href="routine.jsp"
				class="waves-effect waves-light light-blue-text text-lighten-2"><center>Routine</center></a>
			<div class="divider"></div>
			<a href="#"
				class="waves-effect waves-light light-blue-text text-lighten-2"><center>Path</center></a>
			<div class="divider"></div>
			<a href="#"
				class="waves-effect waves-light light-blue-text text-lighten-2"><center>Company</center></a>
			<div class="divider"></div>
		</ul>
	</div>
	</nav> </header>
	<main class="">
	<div class="container">
		<!-- 搜索框 -->
		<div class="row">
			<div class="col s3">&nbsp;</div>
			<div class="col s6 input-field center">
				<input class="left-align" type="search" placeholder="search？"
					length="20"> <i class="material-icons">search</i>
			</div>
		</div>
		<!-- 站点信息 -->
		<table class="centered striped collection responsive-table">
			<thead>
				<tr>
					<th>Id</th>
					<th>Item Name</th>
					<th>longitude</th>
					<th>latitude</th>
					<th>Operation</th>
				</tr>
			</thead>

			<tbody>
				<tr>
					<td>1</td>
					<td>魔仙堡</td>
					<td>000.00</td>
					<td>000.00</td>
					<td><i class="btn-flat material-icons  red0 tooltipped"
						data-position="top" data-delay="50" data-tooltip="delete?">×</i></td>
				</tr>
				<tr>
					<td>2</td>
					<td>雾之湖</td>
					<td>000.00</td>
					<td>000.00</td>
					<td><i class="btn-flat material-icons  red0 tooltipped"
						data-position="top" data-delay="50" data-tooltip="delete?">×</i></td>
				</tr>
				<tr>
					<td>3</td>
					<td>周家坝</td>
					<td>000.00</td>
					<td>000.00</td>
					<td><i class="btn-flat material-icons  red0 tooltipped"
						data-position="top" data-delay="50" data-tooltip="delete?">×</i></td>
				</tr>
			</tbody>
		</table>
		<!-- 页码 -->
		<ul class="pagination center ">
			<li class="disabled "><a href="#!"><i class="material-icons">chevron_left</i></a></li>
			<li class="active light-blue lighten-4"><a href="#!">1</a></li>
			<li class="waves-effect"><a href="#!">2</a></li>
			<li class="waves-effect"><a href="#!">3</a></li>
			<li class="waves-effect"><a href="#!">4</a></li>
			<li class="waves-effect"><a href="#!">5</a></li>
			<li class="waves-effect"><a href="#!"><i
					class="material-icons">chevron_right</i></a></li>
		</ul>
	</div>
	</main>
	<!-- 页脚  -->
	<footer class="page-footer light-blue lighten-2">
	<div class="container">
		<div class="row">
			<div class="col l6 s12">
				<h5 class="white-text">Footer Content</h5>
				<p class="grey-text text-lighten-4">Login for more functions.</p>
			</div>
			<div class="col l4 offset-l2 s12">
				<h5 class="white-text">Links</h5>
				<ul>
					<li><a class="grey-text text-lighten-3" href="#!">Link 1</a></li>
				</ul>
			</div>
		</div>
	</div>
	<div class="footer-copyright">
		<div class="container">
			© 2016 Copyright 5012 <a class="grey-text text-lighten-4 right"
				href="#!">More Links</a>
		</div>
	</div>
	</footer>
	<!--  Scripts-->
	<script src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
	<script src="js/materialize.js"></script>
	<script src="js/init.js"></script>

</body>
</html>
