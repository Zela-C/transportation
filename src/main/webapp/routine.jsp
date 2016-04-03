<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"
	import="java.util.List,dao.RoutineDao,entity.Bus,dao.StationDao"%>
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
<%!private RoutineDao routineDao = new RoutineDao();
	private StationDao stationDao = new StationDao();
	int count = (int) routineDao.getStationsCount();
	int curPage = 1;
	private static final int pageSize = 10;%>
<body>
  <div id="add_stop_dialoge" class="modal" style="width:270px; height:230x">
    <form action=""  method="post">
    <div class="modal-content" >
      <h5 class=""><span class="red-text text-accent-1">Add</span> a station?</h5>
          <div class="row" style="height:30px">
				<div class="input-field">
				          <input id="station_add" type="text" placeholder="Station">
				</div>
			    </div>
	<center>
				<div class="btn-flat waves-effect waves-red">
					<span>&nbsp;</span> <input type="submit" value="Sure&nbsp;">
				</div>
          </center>
    </div>
     </form>
  </div>
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
			<ul class="collapsible popout" data-collapsible="expandable">
				<%
					//边界判定
					String param = request.getParameter("curPage");
					if (null == param)
						curPage = 1;
					else
						curPage = Integer.valueOf(param);
					if (curPage < 1 || curPage > count / 10 + 1) {
						response.sendRedirect("/transportation/routine.jsp");
					}
					//按页查询
					List<Bus> routines = routineDao.findByPage("select en from " + Bus.class.getSimpleName() + " en", curPage,
							pageSize);
					//遍历该页所有对象
					for (Bus routine : routines) {
						//初始化
						String[] idTo = routine.getIdTo().trim().split("\\$");
						String[] endTimeTo = routine.getEndTimeTo().trim().split("\\$");
						String[] startTimeTo = routine.getStartTimeTo().trim().split("\\$");

						String from = routine.getIdFrom().trim();

						String[] idFrom = null;
						String[] endTimeFrom = null;
						String[] startTimeFrom = null;
						if (null != from && !from.equals("")) {
							idFrom = from.split("\\$");
							endTimeFrom = routine.getEndTimeFrom().trim().split("\\$");
							startTimeFrom = routine.getStartTimeFrom().trim().split("\\$");
						}
				%>
				<li>
					<!-- 线路名称信息 -->
					<div class="collapsible-header">
						<a><i class="material-icons bule0 tooltipped"
							data-position="top" data-delay="50" data-tooltip="company">my_location</i></a>
						<%=routine.getName()%><%=(null == idFrom) ? "(环)" : ""%>
						<a href="#!" class="secondary-content"><i
							class="material-icons red0 tooltipped" data-position="top"
							data-delay="50" data-tooltip="delete?">close</i></a>
					</div> <!-- 线路的站点信息 -->
					<div class="collapsible-body">
						<!-- p标签用来调行间距 -->
						<p style="line-height: 300%" />
						<!-- 起点 -->
						<span class="light-blue-text text-darken-2 btn-flat disabled"
							style="font-size: 13px; margin: 0px; padding: 0px"> start
						</span>
						<!-- 箭头 -->
						<span
							class="waves-effect waves-light red-text text-accent-1 btn-flat tooltipped modal-trigger"
							data-position="top" data-delay="50" data-tooltip="add?" data-target="add_stop_dialoge"
							style="font-size: 20px; margin: 0px; padding: 0px"> ---> </span>
						<%
							for (int i = 0; i < idTo.length; i++) {
						%>

						<!-- 站点 -->
						<a
							class='waves-effect waves-light btn-flat  light-blue lighten-4 white-text tooltipped'
							data-position="top" data-delay="50"
							data-tooltip="<%=startTimeTo[i]%>---><%=endTimeTo[i]%>" href='#'>
							<%=stationDao.getStationName(Integer.valueOf(idTo[i]))%>
						</a> <span
							class="waves-effect waves-light red-text text-accent-1 btn-flat tooltipped modal-trigger"
							data-position="top" data-delay="50" data-tooltip="add?" data-target="add_stop_dialoge"
							style="font-size: 20px; margin: 0px; padding: 0px"> ---> </span>
						<%
							}
						%>
						<span class="light-blue-text text-darken-2 btn-flat disabled"
							style="font-size: 13px; margin: 0px; padding: 0px"> end </span>
						<%
							if (null != idFrom) {
						%>
						<br>
						<!-- 起点 -->
						<span class="light-blue-text text-darken-2 btn-flat disabled"
							style="font-size: 13px; margin: 0px; padding: 0px"> start
						</span>
						<!-- 箭头 -->
						<span
							class="waves-effect waves-light red-text text-accent-1 btn-flat tooltipped modal-trigger"
							data-position="top" data-delay="50" data-tooltip="add?" data-target="add_stop_dialoge"
							style="font-size: 20px; margin: 0px; padding: 0px"> ---> </span>
						<%
							for (int i = 0; i < idFrom.length; i++) {
						%>
						<a
							class='waves-effect waves-light btn-flat  light-blue lighten-4 white-text tooltipped'
							data-position="top" data-delay="50"
							data-tooltip="<%=startTimeFrom[i]%>---><%=endTimeFrom[i]%>"
							href='#'> <%=stationDao.getStationName(Integer.valueOf(idFrom[i]))%>
						</a> <span
							class="waves-effect waves-light red-text text-accent-1 btn-flat tooltipped modal-trigger"
							data-position="top" data-delay="50" data-tooltip="add?" data-target="add_stop_dialoge"
							style="font-size: 20px; margin: 0px; padding: 0px"> ---> </span>
						<%
							}
						%>
						<span class="light-blue-text text-darken-2 btn-flat disabled"
							style="font-size: 13px; margin: 0px; padding: 0px"> end </span>
						<%
							}
<<<<<<< HEAD
						%></br>
						<div class="card-action row orange-text text-darken-2">
							<span class="col s2">Time:<%=routine.getTime()%>min
							</span>&nbsp<span class="col s2">Length:<%=routine.getLength()%>km
							</span>
=======
						%>
						<div class="divider"></div>
						<br/>
						<div class="row orange-text text-darken-2 container">
							<span class="col s1 container">&nbsp;</span><span class="col s2 container">Time:24min</span><span class="col s1 container">&nbsp;</span><span class="col s2">Length:6.8km</span>
>>>>>>> 1970056ed487e962e79dd20301c7d006af2f1adc
							<!-- 附加信息结束 -->
						</div>
					</div>
				</li>
						<%
							}
						%>
			</ul>
		</div>
		<!-- 页码，也需要动态修改 -->
		<!-- TODO 最后可能不足5页的边界判定 -->
		<ul class="pagination center ">
			<li class=<%=curPage == 1 ? "disabled" : "enabled"%>><a
				href=<%=curPage <= 1 ? "#!":"?curPage="+(curPage -1) %>><i class="material-icons">chevron_left</i></a></li>
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
				href=<%=curPage >= count / 10 + 1 ? "#!":"?curPage="+(curPage +1) %>><i class="material-icons">chevron_right</i></a></li>
		</ul>
	</div>
	
	
	
	
	
	<div class="fixed-action-btn" style="bottom: 25px; right: 24px;">
          <a class="btn-floating btn-large light-blue lighten-2 waves-effect waves-light tooltipped"
							data-position="top" data-delay="50" data-tooltip="new routine?">
            <i class="material-icons">add</i>
          </a>
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
