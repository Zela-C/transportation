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
	<header> <nav class=" white header-menu navbar-fixed">
	<div class="nav-wrapper container">
		<img src="images/logo_icon.png" alt=""
			class="brand-logo circle responsive-img header-menu circle responsive-img"
			style="padding: 3px">
		<!--       <a href="#!" class="brand-logo cyan-text header-menu">Logo</a> -->
		<a href="#" data-activates="mobile"
			class="button-collapse header-menu"><i
			class="material-icons cyan-text  header-menu">menu</i></a>
		<ul class="right hide-on-med-and-down ">
			<li><a href="path.jsp" class="header-menu cyan-text">Path</a></li>
			<li><a href="station.jsp" class="header-menu cyan-text">Station</a></li>
			<li><a href="routine.jsp" class="header-menu cyan-text">Routine</a></li>
			<li><a href="company.jsp" class="header-menu cyan-text">Company</a></li>
		</ul>
		<ul class="side-nav" id="mobile">
			<li><a href="path.jsp">Path</a></li>
			<li><a href="station.jsp">Station</a></li>
			<li><a href="routine.jsp">Routine</a></li>
			<li><a href="company.jsp">Company</a></li>
		</ul>
	</div>
	</nav> </header>
	<main class="cyan" style="position:relative">
	<h1 class="center-align  thin white-text login-title">Regist</h1>
	<hr class="" width=180px color=#ffffff size="1" align=center noshade>
	<span class="thin  login-text-center">For easy transport.</span> <br>
	<div class="row">
		<div class="col s1 m3">&nbsp;</div>
		<div class="card col s10 m6">
			<!-- 登录界面 -->
			<form class="card-content" onsubmit="return validate_regist(this);"
				 autocomplete="off">
				<div class="row">
					<div class="input-field col s12 m12 l6">
						<input name="username" type="text" id="username" class=""
							onfocus="lose_label(this)" onBlur="validate_required(this)"
							onchange="validate_required(this)"> <label
							id="username_label" for="username" data-error="wrong"
							data-success="ok">Username</label>
					</div>
					<div class="input-field col s12 m12 l6">
						<input name="email" id="email" type=text class=""
							onfocus="lose_label(this)" onBlur="validate_required(this)"
							onchange="validate_required(this)"> <label
							id="email_label" for="email" data-error="wrong" data-success="ok">Email</label>
					</div>
					<div class="input-field col s12 m12 l6">
						<input name="password" id="password" type="password" class=""
							onfocus="lose_label(this)" onBlur="validate_required(this)"
							onchange="validate_required(this)"> <label
							id="password_label" for="password" data-error="wrong"
							data-success="ok">Password</label>
					</div>
					<div class="input-field col s12 m12 l6">
						<input name="confirm" id="confirm" type="password" class=""
							onfocus="lose_label(this)" onBlur="validate_confirm(this)"
							onchange="validate_confirm(this)"> <label
							id="confirm_label" for="confirm" data-error="wrong"
							data-success="ok">Confirm</label>
					</div>
				</div>
				<center>
					<button class="btn cyan waves-effect waves-light no_uppercase" type="submit"  name="regist">Submit</button>
					<a class="btn cyan waves-effect waves-light no_uppercase" href="login.jsp"  name="regist">Back?</a>
				</center>
			</form>
		</div>
	</div>
	</main>
	<!--  Scripts-->
	<script src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
	<script src="js/materialize.js"></script>
	<script type="text/javascript" src="js/init.js"></script>
	<script type="text/javascript" src="js/validate.js"></script>
</body>
</html>
