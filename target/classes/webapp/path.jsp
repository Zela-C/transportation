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
	<div class="container">
	<div class="row">
		<div class="col s0 m2">&nbsp;</div>
		<!-- 搜索框 -->
		<form class="container card  col s12 m8 path-search-card "
			action="findPath" method="post">
			<div class="row ">
				<div class="input-field col s12 l3 m4">
					<input placeholder="start" name="start" value="<%=null==request.getParameter("start")?"":request.getParameter("start")%>" type="text">
				</div>
				<div class="input-field col s12 l3 m4">
					<input placeholder="end" name="end" value="<%=null==request.getParameter("end")?"":request.getParameter("end")%>" type="text">
				</div>
				<div class="input-field col s12 l3 m4">
					<select id="sort" name="sort">
						<option value="" disabled selected>sort by ?</option>
						<option value="1" class="cyan-text"
							<%=null !=request.getAttribute("sort") || (null!=request.getParameter("sort")&&1==Integer.valueOf(request.getParameter("sort")))?"selected":""%>>time</option>
						<option value="2"
							<%=null!=request.getParameter("sort")&&2==Integer.valueOf(request.getParameter("sort"))?"selected":""%>>transfer</option>
					</select>
				</div>
				<div class="input-field col s12 l3 m12 center-align">
					<button class="btn btn-rnd cyan waves-effect waves-light"
						type="submit" required="" name="login">Search</button>
				</div>
			</div>
		</form>
	</div>
	<%
	ArrayList<Path> ret = (ArrayList<Path>)request.getAttribute("PathRET");
		if(null== ret || 0 == ret.size()){
		if(null!=request.getAttribute("flag")){
	%>
	<br>
	<h3 class="center thin white-text">No Result!</h3>
	<%}else{ %>
	<br>
		<h3 class="center thin white-text ">Making your Tour.</h3>
	<%
		}
		}
	else{
		int cnt=0;
		for(Path path:ret){
				List<String> line=path.path;
				List<Integer> busTime=path.busTime;
		

	              					if(0!=cnt) {%>
              					<br>
              					<%} %>
	<div>
		<h4 class="thin center-align white-text">No.<span class=<%=cnt==0?"red-text text-accent-2":cnt==1?"orange-text text-accent-2": cnt==2?"teal-text text-accent-2":"white-text"%>><%=++cnt%></span></h4>
		<hr class="" width=180px   color=#ffffff  size="1" align=center noshade>
		           <div class=" center-align white-text"> <span >Time:<%=path.time%>min</span>
			<span >Transfer:<%=path.transfer-1%></span></div>
	<div class="border-side-white no-margin cyan">
		<div class=" path-card-margin">
              	<!-- card的正文，放在下面这个p标签里 -->
              	<p class="center-align no-margin" style="line-height: 318%">
                            			<%
              				for(int i=0,j=0;i<line.size()-1;i+=2,j++){
              					%>
              		
              			<!-- 站点 -->
						<a class='path-station-change path-station-rnd  disabled  cyan-text  z-depth-1 ' > <%=line.get(i)%></a> 
						<!-- 箭头和信息 -->
						<a class=" btn-flat disabled btn-rnd white-text" style="font-size: 15px; margin: 0px; padding: 0px"> --<%=line.get(i+1)%>(<%=busTime.get(j)%>min) --> </a>
											<%
							} 
              			%>
              			<a class='path-station-change path-station-rnd  disabled  cyan-text  z-depth-1 ' > <%=line.get(line.size()-1) %></a> 
			</p>
			<!-- 正文结束 -->
            </div>
		</div>
		</div>
	 <%} }%>
	</div>
	<!-- 包裹所有card的div结束 -->
	</main>
	<!--  Scripts-->
	<script src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
	<script src="js/materialize.js"></script>
	<script src="js/init.js"></script>

</body>
</html>
