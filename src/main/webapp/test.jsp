<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" import="java.util.*,helper.Path"%>
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
<link href="css/materialize.css" type="text/css" rel="stylesheet"
	media="screen,projection" />
<link href="css/zela.css" type="text/css" rel="stylesheet"
	media="screen,projection" />
</head>
<body>
  <div id="confirm_dialog" class="modal delete_routine_stop_dialog">
<div class="modal-content  grey-text text-darken-1">
      <h5 class=""><span class="red-text text-accent-1">Delete</span> this station?</h5>
          <div class="row row_no_margin_bottom">
		<a class="btn-flat col s6 center-align modal-close waves-effect waves-red grey-text text-darken-1" href="#!">Yes</a>
		<a class="btn-flat col s6 center-align modal-close waves-effect waves-red grey-text text-darken-1" href="#!">No</a>
    </div>
  
  </div>
  </div>
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
<main class="cyan">
<br>
<br>
<br>
<center>
 <a class="btn white cyan-text center" onclick="Materialize.toast('Delete successfully!', 4000,'toast_right')">Right!</a>
 	
 	<a class="btn white cyan-text center" onclick="Materialize.toast('Sorry，you can not delete this station before removing it from corresponding routines!', 4000,'toast_wrong')">Wrong!</a>
 		</center>
 		<br>
 		<center>
 		 <a class="btn white cyan-text centertooltipped modal-trigger"
							data-position="top" data-delay="50" data-tooltip="add?" data-target="confirm_dialog" >Dialog</a>
 		</center>
 	<script src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
	<script src="js/materialize.js"></script>
	<script src="js/init.js"></script>
	</main>
</body>
</html>