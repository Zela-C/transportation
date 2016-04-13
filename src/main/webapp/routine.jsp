<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" import="java.util.List,dao.RoutineDao,entity.Routine,dao.StationDao"%>
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
	<style type="text/css">
	.pagination li {
	padding: 0 0px !important;
	font-size: medium;
}

.collapsible-body p {
	padding-top: 1rem !important;
}
	</style>
</head>
<%!private RoutineDao routineDao = new RoutineDao();
	private StationDao stationDao = new StationDao();
	int count = (int) routineDao.getRoutineCount();
	int curPage = 1;
	private static final int pageSize = 10;%>
<body>
  <div id="add_stop_dialoge" class="modal" style="width:270px; height:230x">
    <form action=""  method="post">
    <div class="modal-content" >
      <h5 class=""><span class="red-text text-accent-1">Add</span> a station?</h5>
          <div class="row" style="height:30px">
				<div class="input-field">
				          <input name="stop" id="stop" type="text" placeholder="Station">
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
			action="" method="post">
			<div class="row ">
				<div class="input-field col s12 l9 m8">
					<input placeholder="routine" name="routine" value="" type="text">
				</div>
				<div class="input-field col s12 l3 m4 center-align">
					<button class="btn btn-rnd cyan waves-effect waves-light"
						type="submit" required="" name="search">Search</button>
				</div>
			</div>
		</form>
	</div>
	
	<div>
			<!-- 区域名字title -->
			<h4 class="white-text  center thin ">松江区</h4>
			<hr class="" width=240px   color=#ffffff  size="1" align=center noshade">
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
					List<Routine> routines = routineDao.findByPage("select en from " + Routine.class.getSimpleName() + " en", curPage,
							pageSize);
					//遍历该页所有对象
					for (Routine routine : routines) {
						//初始化
						String[] idTo = routine.getPosTo().trim().split("\\$");
						String[] endTimeTo = routine.getEndTimeTo().trim().split("\\$");
						String[] startTimeTo = routine.getStartTimeTo().trim().split("\\$");

						String from = routine.getPosFrom().trim();

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
					<div class="collapsible-header grey-text text-darken-1">
						<a><i class="material-icons bule0 tooltipped"
							data-position="top" data-delay="50" data-tooltip="company">my_location</i></a>
						<%=routine.getName()%><%=(null==idFrom)?"(环)":"" %>
						<a href="#!" class="secondary-content"><i
							class="material-icons red0 tooltipped" data-position="top"
							data-delay="50" data-tooltip="delete?">close</i></a>
					</div> <!-- 线路的站点信息 -->
					<div class="collapsible-body white">
						<!-- p标签用来调行间距 -->
						<p class="center-align no-margin" style="line-height: 318%" />
						<span class="thin grey-text text-darken-1 routine-orientation-text" >To</span>
						<%
							for (int i = 0; i < idTo.length; i++) {
								if(i==0|| i==idTo.length-1){
						%>
					
						<!-- 站点 -->
						<a
							class='routine-station-change2 path-station-rnd   cyan  white-text  z-depth-1 tooltipped'
							data-position="top" data-delay="50" data-tooltip="<%=startTimeTo[i]%>---><%=endTimeTo[i] %>"
							href='#'> <%=stationDao.getStationName(Integer.valueOf(idTo[i]))%>
						</a> 
						<%} 
						else {%>
						<a
							class='routine-station-change path-station-rnd  disabled  white grey-text text-darken-1 z-depth-1 tooltipped'
							data-position="top" data-delay="50" data-tooltip="<%=startTimeTo[i]%>---><%=endTimeTo[i] %>"
							href='#'> <%=stationDao.getStationName(Integer.valueOf(idTo[i]))%>
						</a> 
						
						<%
						}
								if(i  < idTo.length-1){
						%>
						<span
							class="waves-effect waves-light  grey-text text-darken-1 btn-flat tooltipped modal-trigger"
							data-position="top" data-delay="50" data-tooltip="add?" data-target="add_stop_dialoge"
							style="font-size: 20px; margin: 0px; padding: 0px"> ----> </span>
						<%
							}}
						%>
						
						<%
							if (null != idFrom) {
								%>
														<span class="thin grey-text text-darken-1 routine-orientation-text" style="margin-top: 28px;">From</span>
							<%
							for (int i = 0; i < idFrom.length; i++) {
								if(i==0 || i == idFrom.length-1){
						%>
						<a
							class='routine-station-change2 path-station-rnd  disabled  cyan  white-text  z-depth-1 tooltipped'
							data-position="top" data-delay="50" data-tooltip="<%=startTimeFrom[i]%>---><%=endTimeFrom[i] %>"
							href='#'> <%=stationDao.getStationName(Integer.valueOf(idFrom[i]))%>
						</a> 
						<%}else{ %>
						
												<a
							class='routine-station-change path-station-rnd  white grey-text text-darken-1  z-depth-1 tooltipped'
							data-position="top" data-delay="50" data-tooltip="<%=startTimeFrom[i]%>---><%=endTimeFrom[i] %>"
							href='#'> <%=stationDao.getStationName(Integer.valueOf(idFrom[i]))%>
						</a> 
						<%}
								if(i<idFrom.length-1){%>
						<span
							class="waves-effect waves-light  grey-text text-darken-1 btn-flat tooltipped modal-trigger"
							data-position="top" data-delay="50" data-tooltip="add?" data-target="add_stop_dialoge"
							style="font-size: 20px; margin: 0px; padding: 0px"> ----> </span>
						<%
								}
							}
							}
						%>
						<div class="divider"></div>
						<br/>
					<div class="row orange-text text-darken-2 container">
							<span class="col m0 s1 l0">&nbsp;</span><span class="col s5 m2 l2 center-align">Time:<%=routine.getTime()%>min</span><span class="col s5 m4 l3 center-align">Length:<%=routine.getLength()%>km</span>
							<!-- 附加信息结束 -->
					</div>
				</li>
						<%
							}
						%>
			</ul>
		</div>
		<!-- 页码 -->
		<ul class="pagination center">
					<li class=<%=curPage == 1 ? "disabled" : "enabled"%> style="padding: 0px ! important; margin: 0px;"><a class=<%=curPage == 1 ? "teal-text" : "white-text"%>
				href=<%=curPage <= 1 ? "#!":"?curPage=1" %>><i
					class="material-icons" style="font-size: 1.2rem !important;">fast_rewind</i></a></li>
			<li class=<%=curPage == 1 ? "disabled" : "enabled"%> style="padding: 0px ! important; margin: 0px;"><a class=<%=curPage == 1 ? "teal-text" : "white-text"%>
				href=<%=curPage <= 1 ? "#!":"?curPage="+(curPage -1) %>><i
					class="material-icons" style="font-size: 1.2rem !important;">chevron_left</i></a></li>
			<li><a class=<%=curPage == ((curPage - 1) / 5 * 5 + 1) ? "white-text" : "teal-text"%>
				href="?curPage=<%=(curPage - 1) / 5 * 5 + 1%>"><%=(curPage - 1) / 5 * 5 + 1%></a></li>
			<%=((curPage - 1) / 5 * 5 + 2) > count / 10 + 1 ? "<!--" : ""%>
			<li><a class=<%=curPage == ((curPage - 1) / 5 * 5 + 2) ? "white-text" : "teal-text"%>
				href="?curPage=<%=(curPage - 1) / 5 * 5 + 2%>"><%=(curPage - 1) / 5 * 5 + 2%></a></li>
			<%=((curPage - 1) / 5 * 5 + 2) > count / 10 + 1 ? "--!>" : " "%>
			<%=((curPage - 1) / 5 * 5 + 3) > count / 10 + 1 ? "<!--" : " "%>
			<li><a class=<%=curPage == ((curPage - 1) / 5 * 5 + 3) ? "white-text" : "teal-text"%>
				href="?curPage=<%=(curPage - 1) / 5 * 5 + 3%>"><%=(curPage - 1) / 5 * 5 + 3%></a></li>
			<%=((curPage - 1) / 5 * 5 + 3) > count / 10 + 1 ? "--!>" : " "%>
			<%=((curPage - 1) / 5 * 5 + 4) > count / 10 + 1 ? "<!--" : " "%>
			<li><a class=<%=curPage == ((curPage - 1) / 5 * 5 + 4) ? "white-text" : "teal-text" %>
				href="?curPage=<%=(curPage - 1) / 5 * 5 + 4%>"><%=(curPage - 1) / 5 * 5 + 4%></a></li>
			<%=((curPage - 1) / 5 * 5 + 4) > count / 10 + 1 ? "--!>" : " "%>
			<%=((curPage - 1) / 5 * 5 + 5) > count / 10 + 1 ? "<!--" : " "%>
			<li><a class=<%=curPage == ((curPage - 1) / 5 * 5 + 5) ? "white-text" : "teal-text"%>
				href="?curPage=<%=(curPage - 1) / 5 * 5 + 5%>"><%=(curPage - 1) / 5 * 5 + 5%></a></li>
			<%=((curPage - 1) / 5 * 5 + 5) > count / 10 + 1 ? "--!>" : " "%>
			<li class=<%=curPage > count / 10 ? "disabled" : "enabled"%> style=" padding: 0px ! important; margin: 0px;"><a class=<%=curPage > count / 10 ? "teal-text" : "white-text"%>
				href=<%=curPage >= count / 10 + 1 ? "#!":"?curPage="+(curPage +1) %>><i
					class="material-icons" style="font-size: 1.2rem !important;">chevron_right</i></a></li>
			<li class=<%=curPage > count / 10 ? "disabled" : "enabled"%> style="padding: 0px ! important; margin: 0px;"><a class=<%=curPage > count / 10 ? "teal-text" : "white-text"%>
				href=<%=curPage >= count / 10 + 1 ? "#!":"?curPage="+( count / 10 +1) %>><i
					class="material-icons" style="font-size: 1.2rem !important;">fast_forward</i></a></li>
		</ul>
	</main>
		<div class="fixed-action-btn float-add-button" >
		
		<a
			class="btn-floating btn-large float-add-button white waves-effect waves-light tooltipped"
			data-position="top" data-delay="50" data-tooltip="new routine?">
			<i class="material-icons cyan-text">add</i>
		</a>
	</div>
	<!--  Scripts-->
	<script src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
	<script src="js/materialize.js"></script>
	<script src="js/init.js"></script>

</body>
</html>
