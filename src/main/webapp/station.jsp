<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"
	import="java.util.List,entity.Station,dao.StationDao"%>
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
<%!private StationDao stationDao = new StationDao();
	int count = (int) stationDao.getStationsCount();
	int curPage = 1;
	private static final int pageSize = 10;%>
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
			<a href="path.jsp"
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
				<%
					String param = request.getParameter("curPage");
					if (null == param)
						curPage = 1;
					else
						curPage = Integer.valueOf(param);
					if (curPage < 1 || curPage > count / 10 + 1) {
						response.sendRedirect("/transportation/station.jsp");
					}
					List<Station> stations = stationDao.findByPage("select en from " + Station.class.getSimpleName() + " en",
							curPage, pageSize);
					for (Station station : stations) {
				%>
				<tr>
					<td><%=station.getId()%></td>
					<td><%=station.getName()%></td>
					<td><%=station.getLongitude()%></td>
					<td><%=station.getLatitude()%></td>
					<td><i class="btn-flat material-icons  red0 tooltipped"
						data-position="top" data-delay="50" data-tooltip="delete?">×</i></td>
				</tr>
				<%
					}
				%>

			</tbody>
		</table>
		<!-- 页码 -->
		<!-- TODO 最后可能不足5页的边界判定 -->
		<ul class="pagination center ">
			<li class=<%=curPage == 1 ? "disabled" : "enabled"%>><a
				href="?curPage=<%=curPage - 1%>"><i class="material-icons">chevron_left</i></a></li>
			<li
				class=<%=curPage == ((curPage - 1) / 5 * 5 + 1) ? "active light-blue lighten-4" : "waves-effect"%>><a
				href="?curPage=<%=(curPage - 1) / 5 * 5 + 1%>"><%=(curPage - 1) / 5 * 5 + 1%></a></li>
			<%=((curPage - 1) / 5 * 5 + 2) > count / 10 + 1 ? "<!--" : ""%>
			<li
				class=<%=curPage == ((curPage - 1) / 5 * 5 + 2) ? "active light-blue lighten-4" : "waves-effect"%>><a
				href="?curPage=<%=(curPage - 1) / 5 * 5 + 2%>"><%=(curPage - 1) / 5 * 5 + 2%></a></li>
			<%=((curPage - 1) / 5 * 5 + 2) > count / 10 + 1 ? "--!>" : ""%>
			<%=((curPage - 1) / 5 * 5 + 3) > count / 10 + 1 ? "<!--" : ""%>
			<li
				class=<%=curPage == ((curPage - 1) / 5 * 5 + 3) ? "active light-blue lighten-4" : "waves-effect"%>><a
				href="?curPage=<%=(curPage - 1) / 5 * 5 + 3%>"><%=(curPage - 1) / 5 * 5 + 3%></a></li>
			<%=((curPage - 1) / 5 * 5 + 3) > count / 10 + 1 ? "--!>" : ""%>
			<%=((curPage - 1) / 5 * 5 + 4) > count / 10 + 1 ? "<!--" : ""%>
			<li
				class=<%=curPage == ((curPage - 1) / 5 * 5 + 4) ? "active light-blue lighten-4" : "waves-effect"%>><a
				href="?curPage=<%=(curPage - 1) / 5 * 5 + 4%>"><%=(curPage - 1) / 5 * 5 + 4%></a></li>
			<%=((curPage - 1) / 5 * 5 + 4) > count / 10 + 1 ? "--!>" : ""%>
			<%=((curPage - 1) / 5 * 5 + 5) > count / 10 + 1 ? "<!--" : ""%>
			<li
				class=<%=curPage == ((curPage - 1) / 5 * 5 + 5) ? "active light-blue lighten-4" : "waves-effect"%>><a
				href="?curPage=<%=(curPage - 1) / 5 * 5 + 5%>"><%=(curPage - 1) / 5 * 5 + 5%></a></li>
			<%=((curPage - 1) / 5 * 5 + 5) > count / 10 + 1 ? "--!>" : ""%>
			<li class=<%=curPage > count / 10 ? "disabled" : "enabled"%>><a
				href="?curPage=<%=curPage + 1%>"><i class="material-icons">chevron_right</i></a></li>
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
