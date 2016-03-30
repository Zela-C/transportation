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
	<!-- header不用管，是已经写好了的 -->
	<header> <nav class=" light-blue lighten-2">
	<div class="nav-wrapper container">
		<div href="#!" class="brand-logo">
			Routine<a class="flow-text"> &nbsp;check.</a>
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
			<a href="station.jsp"
				class="waves-effect waves-light light-blue-text text-lighten-2"><center>Station</center></a>
			<div class="divider"></div>
			<li style="width: 100%"
				class="waves-effect waves-light light-blue-text text-lighten-2 active"><center>Routine</center></li>
			<div class="divider"></div>
			<a href="path.jsp"
				class="waves-effect waves-light light-blue-text text-lighten-2"><center>Path</center></a>
			<div class="divider"></div>
			<a href="#"
				class="waves-effect waves-light light-blue-text text-lighten-2"><center>Company</center></a>
			<div class="divider"></div>
		</ul>
	</div>
	</nav> </header>
	<!-- 主要需要动态修改main -->
	<main class="">
	<div class="container">
		<!--搜索框 -->
		<div class="row">
			<div class="col s3">&nbsp;</div>
			<div class="col s6 input-field center">
				<input class="left-align" type="search" placeholder="search？"
					length="20"> <i class="material-icons">search</i>
			</div>
		</div>
		<!-- 下面的信息是模板 -->
		<div>
			<!-- 区域名字title -->
			<h4 class=" blue-text text-lighten-1 center thin">松江区</h4>
			<div class="divider"></div>
			<!-- 各个线路 -->
			<ul class="collapsible" data-collapsible="expandable">
				<li>
					<!-- 线路名称信息 -->
					<div class="collapsible-header">
						<a><i class="material-icons bule0 tooltipped"
							data-position="top" data-delay="50" data-tooltip="company">my_location</i></a>
						松江3路 <a href="#!" class="secondary-content"><i
							class="material-icons red0 tooltipped" data-position="top"
							data-delay="50" data-tooltip="delete?">close</i></a>
					</div>
					<!-- 线路的站点信息 -->
					<div class="collapsible-body">
						<!-- p标签用来调行间距 -->
						<p style="line-height: 300%" />
						<!-- 起点 -->
						<span class="light-blue-text text-darken-2 btn-flat disabled"
							style="font-size: 13px; margin: 0px; padding: 0px">
							start(12:00) </span> 
						<!-- 箭头 -->
						<span
							class="waves-effect waves-light red-text text-accent-1 btn-flat tooltipped"
							data-position="top" data-delay="50" data-tooltip="add?"
							style="font-size: 20px; margin: 0px; padding: 0px"> ---> </span>
						<!-- 站点 -->
						<a
							class='waves-effect waves-light btn-flat  light-blue lighten-4 white-text tooltipped'
							data-position="top" data-delay="50" data-tooltip="delete?"
							href='#'> 合川路 </a> <span
							class="waves-effect waves-light red-text text-accent-1 btn-flat tooltipped"
							data-position="top" data-delay="50" data-tooltip="add?"
							style="font-size: 20px; margin: 0px; padding: 0px"> ---> </span>
						<a
							class='waves-effect waves-light btn-flat  light-blue lighten-4 white-text tooltipped'
							data-position="top" data-delay="50" data-tooltip="delete?"
							href='#'> 桂林路 </a> <span
							class="waves-effect waves-light red-text text-accent-1 btn-flat tooltipped"
							data-position="top" data-delay="50" data-tooltip="add?"
							style="font-size: 20px; margin: 0px; padding: 0px"> ---> </span>
						<span class="light-blue-text text-darken-2 btn-flat disabled"
							style="font-size: 13px; margin: 0px; padding: 0px">
							end(22:30) </span>
					</div>
				</li>
				<!-- 该区域的下一条线路 -->
				<li>
					<div class="collapsible-header">
						<a><i class="material-icons bule0 tooltipped"
							data-position="top" data-delay="50" data-tooltip="company">my_location</i></a>
						松江4路 <a href="#!" class="secondary-content"><i
							class="material-icons red0 tooltipped" data-position="top"
							data-delay="50" data-tooltip="delete?">close</i></a>
					</div>
					<div class="collapsible-body">
						<p style="line-height: 300%" />
						<span class="light-blue-text text-darken-2 btn-flat disabled"
							style="font-size: 13px; margin: 0px; padding: 0px"> start
						</span> <span
							class="waves-effect waves-light red-text text-accent-1 btn-flat tooltipped"
							data-position="top" data-delay="50" data-tooltip="add?"
							style="font-size: 20px; margin: 0px; padding: 0px"> ---> </span>
						<a
							class='waves-effect waves-light btn-flat  light-blue lighten-4 white-text tooltipped'
							data-position="top" data-delay="50" data-tooltip="delete?"
							href='#'> 合川路 </a> <span
							class="waves-effect waves-light red-text text-accent-1 btn-flat tooltipped"
							data-position="top" data-delay="50" data-tooltip="add?"
							style="font-size: 20px; margin: 0px; padding: 0px"> ---> </span>
						<a
							class='waves-effect waves-light btn-flat  light-blue lighten-4 white-text tooltipped'
							data-position="top" data-delay="50" data-tooltip="delete?"
							href='#'> 桂林路 </a> <span
							class="waves-effect waves-light red-text text-accent-1 btn-flat tooltipped"
							data-position="top" data-delay="50" data-tooltip="add?"
							style="font-size: 20px; margin: 0px; padding: 0px"> ---> </span>
						<span class="light-blue-text text-darken-2 btn-flat disabled"
							style="font-size: 13px; margin: 0px; padding: 0px"> end </span>
					</div>
				</li>
			</ul>
		</div>
		<!-- 页码，也需要动态修改 -->
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
	<!-- 页脚不用修改 -->
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
