<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1.0" />
<title>松江区公交管理系统</title>

<!-- CSS  -->
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<link href="css/materialize.min.css" type="text/css" rel="stylesheet"
	media="screen,projection" />
<link href="css/zela.css" type="text/css" rel="stylesheet"
	media="screen,projection" />
</head>
<body>
	<!-- 页头 -->
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
			<a  href="station.jsp"
				class="waves-effect waves-light light-blue-text text-lighten-2"><center>Station</center></a>
			<div class="divider"></div>
			<a href="routine.jsp"
				class="waves-effect waves-light light-blue-text text-lighten-2"><center>Routine</center></a>
			<div class="divider"></div>
			<a href="path.jsp"
				class="waves-effect waves-light light-blue-text text-lighten-2"><center>Path</center></a>
			<div class="divider"></div>
			<li style="width: 100%"
				class="waves-effect waves-light light-blue-text text-lighten-2 active"><center>Company</center></li>
			<div class="divider"></div>
		</ul>
	</div>
	</nav> </header>
	<main class="container">
		<br>
		<div class="row">
          <div class="card blue lighten-2">
          <div class="card-content  white-text">
          <span class="card-title">魔仙堡管理中心</span>
				<div>企业信息：</div>
　林尽水源，便得一山，山有小口，仿佛若有光。便舍船，从口入。初极狭，才通人。复行数十步，豁然开朗。土地平旷，屋舍俨然，有良田美池桑竹之属。阡陌交通，鸡犬相闻。其中往来种作，男女衣着，悉如外人。黄发垂髫，并怡然自乐。
          </div>
          <div class="card-action  blue">
         <span class=" white-text"> 运营情况：<span class=" teal-text text-accent-1">运营中</span></span>
          </div>
    </div>
    </div>
	
	</main>
	<!-- 页脚 -->
	<footer class="page-footer light-blue lighten-2">
	<div class="container">
		<div class="row" >
			<div class="col l6 s12 ">
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
