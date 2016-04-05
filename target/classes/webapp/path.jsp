<%@page import="javax.persistence.criteria.CriteriaBuilder.In"%>
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
			Path<a class="flow-text"> &nbsp;go?</a>
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
			<a href="routine.jsp"
				class="waves-effect waves-light light-blue-text text-lighten-2"><center>Routine</center>
			</a>
			<div class="divider"></div>
			<li style="width: 100%"
				class="waves-effect waves-light light-blue-text text-lighten-2 active"><center>Path</center></li>
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
		<!-- 搜索框 -->
		<form class="container" action="findPath" method="post">
			<ul>
				<li style="height: 50px;">
					<div class="row ">
						<div class="input-field col l4">
							<input  id="start" name="start" type="text" value=<%=null==request.getParameter("start")?"":request.getParameter("start")%>> <label  class="<%=null==request.getParameter("start")?"":"active"%>"  for="start">start</label>
						</div>
						<div class="input-field col l4">
							<input  id="end" name="end" type="text" value=<%=null==request.getParameter("end")?"":request.getParameter("end")%>> <label class="<%=null==request.getParameter("end")?"":"active"%>" for="end">end</label>
						</div>
						<div class="input-field col l4">
							<select id="sort" name="sort">
								<option value="" disabled selected >sort by ?</option>
								<option value="1"  <%=null !=request.getAttribute("sort") || (null!=request.getParameter("sort")&&1==Integer.valueOf(request.getParameter("sort")))?"selected":""%>>time</option>
								<option value="2"  <%=null!=request.getParameter("sort")&&2==Integer.valueOf(request.getParameter("sort"))?"selected":""%>>transfer</option>
							</select> <label>condition</label>
						</div>
					</div>
				</li>

				<li class="row">
					<div class="col l8">&nbsp;</div>
					<div class="input-field col l4 right-align">
						<input class="btn-flat hoverable right-align light-blue lighten-2 white-text" type="submit"
							value="search" style="padding: 0px 10px">
					</div>
					<div class="col l3">&nbsp;</div>
				</li>
			</ul>
		</form>
	</div>
	
	<!-- 这个div用来存放所有的card -->
	<div class="container">
	<%
	ArrayList<Path> ret = (ArrayList<Path>)request.getAttribute("PathRET");
		if(null== ret || 0 == ret.size()){
		if(null!=request.getAttribute("flag")){
	%>
	<h4 class="center light-blue-text text-lighten-2">No Result!</h4>
	<%}else{ %>
		<h4 class="center light-blue-text text-lighten-2">Making your Tour.</h4>
	<%
		}
		}
	else{
		int cnt=0;
		for(Path path:ret){
				List<String> line=path.path;
				List<Integer> busTime=path.busTime;
		
	%>
		<!-- 第一个card例子 -->
          <div class="card">
          	<!-- card的内容-->
            <div class="card-content">
              <!-- card的标题 -->
              <span class="card-title light-blue-text text-lighten-2">No.<%=++cnt %></span>
              	<!-- card的正文，放在下面这个p标签里 -->
              	<p class="center" style="line-height: 300%">
              			<%
              				for(int i=0,j=0;i<line.size()-1;i+=2,j++){
              			%>
              			<!-- 站点 -->
						<a
							class='waves-effect waves-light btn-flat light-blue lighten-4 white-text tooltipped'
							data-position="top" data-delay="50" data-tooltip="jump?" style="padding: 0px 10px"
							href='#'> <%=line.get(i)%> </a> 
						<!-- 箭头和信息 -->
						<span
							class=" red-text text-accent-1"
							style="font-size: 15px; margin: 0px; padding: 0px"> --<%=line.get(i+1) %>(<%=busTime.get(j) %>min)--> </span>
						<%
							} 
              			%>
	              			<!-- 站点 -->
							<a
								class='waves-effect waves-light btn-flat light-blue lighten-4 white-text tooltipped'
								data-position="top" data-delay="50" data-tooltip="jump?" style="padding: 0px 10px"
								href='#'> <%=line.get(line.size()-1)%> </a>
			</p>
			<!-- 正文结束 -->
            </div>
            <!-- 内容结束 -->
            <!-- 下面是card的附加信息，用来存放线路耗时和长度，以及换乘次数 -->
            <div class="card-action orange-text text-darken-2">
            <span>Time:<%=path.time%>min</span>
			<span >Transfer:<%=path.transfer%></span>
			<!-- 附加信息结束 -->
            </div>
            <!-- 第一card实例结束 -->
          </div>
          <%} }%>
          
    <!-- 包裹所有card的div结束 -->
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
