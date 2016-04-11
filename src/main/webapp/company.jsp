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
	<header> 
	  <nav class=" white header-menu navbar-fixed" >
    <div class="nav-wrapper container">
     <img src="images/logo_icon.png" alt=""  class="brand-logo circle responsive-img header-menu circle responsive-img" style="padding:3px">
<!--       <a href="#!" class="brand-logo cyan-text header-menu">Logo</a> -->
      <a href="#" data-activates="mobile" class="button-collapse header-menu"><i class="material-icons cyan-text  header-menu">menu</i></a>
      <ul class="right hide-on-med-and-down " >
        <li><a href="path.jsp"  class="header-menu cyan-text">Path</a></li>
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
  </nav>
	 </header>
	<main class="cyan" style="position:relative">
		<div class="container">
			<br>
			<h4 class=" cyan-text center-align white-text thin">上海松江公共交通有限公司</h4>
				<hr class="" width=65%   color=#ffffff  size="1" align=center noshade>
			<div class="center-align">
							<a href="#!" class="z-depth-1 hoverable  company-button">
							<i style="" class="material-icons cyan-text">reorder</i>
							</a>
							<a  href="#!" class="z-depth-1 hoverable  company-button">
							<i style="" class="material-icons red0">close</i>
							</a>
							
			    </div>
	          <div class="card white container company-card-center grey-text text-darken-1">
	          <div class="card-content">
					<div>企业信息：</div>
	　林尽水源，便得一山，山有小口，仿佛若有光。便舍船，从口入。初极狭，才通人。复行数十步，豁然开朗。土地平旷，屋舍俨然，有良田美池桑竹之属。阡陌交通，鸡犬相闻。其中往来种作，男女衣着，悉如外人。黄发垂髫，并怡然自乐。
	          </div>
	          <div style="" class="card-action row">
	         <span class="col s12 m6 l6">地址：<span  class="grey-text text-darken-1 ">松江区茸惠路558号</span></span>
	         <span class="col s12 m6 l6"> 邮编：<span class="grey-text text-darken-1">201613</span></span>
	         <span class="col s12 m6 l6"> 电话：<span class="grey-text text-darken-1">021-57821111</span></span>
	         <span class="col s12 m6 l6"> 邮箱：<span class="grey-text text-darken-1">sjgjts@163.com</span></span>
	          </div>
	          </div>
    </div>
    </div>
	</main>
			<div class="fixed-action-btn float-add-button" >
		
		<a
			class="btn-floating btn-large float-add-button white waves-effect waves-light tooltipped"
			data-position="top" data-delay="50" data-tooltip="new company?">
			<i class="material-icons cyan-text">add</i>
		</a>
	</div>
	<!--  Scripts-->
	<script src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
	<script src="js/materialize.js"></script>
	<script src="js/init.js"></script>

</body>
</html>
