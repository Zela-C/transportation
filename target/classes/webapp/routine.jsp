<%@page import="helper.StationPool"%>
<%@page import="java.net.URLDecoder"%>
<%@page import="entity.Routine"%>
<%@page import="java.util.List"%>
<%@page import="dao.RoutineDao"%>
<%@page import="java.util.HashMap"%>
<%@page import="bean.RoutineBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<%!RoutineDao dao = new RoutineDao();
	RoutineBean bean = new RoutineBean();
	List<String> stationName = StationPool.getList();
	List<HashMap<String, Object>> list = null;
	int count = 0;
	int curPage = 1;%>
<body>
	<!-- 这个是添加线路站点对话框 -->
	<div id="add_routine_dialog"
		class="modal bottom-sheet routine_add_container cyan">
		<form autocomplete="off">
			<div class="modal-content container white routine_add_padding">
				<h4 class="cyan-text thin">Add a routine?</h4>
				<p style="font-size: 1.2rem; margin-bottom: 0px ! important;"
					class="cyan-text">Routine Info.</p>
				<div class="row">
					<div class="input-field col s12 m4 l4">
						<input id="routine_add_name" type="text"> <label
							for="routine_add_name">Name</label>
					</div>
					<div class="input-field col s6 m4 l4">
						<input id="routine_add_length" type="text"> <label
							for="routine_add_length">Length</label>
					</div>
					<div class="input-field col s6 m4 l4">
						<input id="routine_add_time" type="text"> <label
							for="routine_add_time">Time</label>
					</div>
				</div>
				<div class="row">
					<div class="input-field col s12 m4 l4">
						<input id="routine_add_company" type="text"> <label
							for="routine_add_company">Company</label>
					</div>
					<div class="input-field col s12 m4 l4">
						<input id="routine_add_num" type="text"> <label
							for="routine_add_num">Number of station</label>
					</div>
					<div class="input-field col s6 m2 l2">
						<input type="checkbox" id="routine_add_circle" /> <label
							for="routine_add_circle">circle?</label>
					</div>
					<div class="input-field col s6 m2 l2">
						<input type="checkbox" id="routine_add_cross" /> <label
							for="routine_add_cross">cross?</label>
					</div>
				</div>
				<p style="font-size: 1.2rem; margin-bottom: 0px ! important;"
					class="cyan-text">Stations Info.</p>
				<div class="row" style="margin-bottom: 0px ! important;"
					id="stations">
					<div class="input-field col s12 m4 l4">
						<input id="routine_add_station_name1" type="text"> <label
							for="routine_add_station_name1">Station Name</label>
					</div>
					<div class="input-field col s6 m4 l4">
						<input id="routine_add_station_start1" type="text"> <label
							for="routine_add_station_start1">Start Time</label>
					</div>
					<div class="input-field col s6 m4 l4">
						<input id="routine_add_station_end1" type="text"> <label
							for="routine_add_station_end1">End Time</label>
					</div>
					<div class="input-field col s12 m12 l12">
						<input id="routine_add_station_cost1" type="text"> <label
							for="routine_add_station_cost1">Cost</label>
					</div>
					<div class="input-field col s12 m4 l4">
						<input id="routine_add_station_name2" type="text"> <label
							for="routine_add_station_name2">Station Name</label>
					</div>
					<div class="input-field col s6 m4 l4">
						<input id="routine_add_station_start2" type="text"> <label
							for="routine_add_station_start2">Start Time</label>
					</div>
					<div class="input-field col s6 m4 l4">
						<input id="routine_add_station_end2" type="text"> <label
							for="routine_add_station_end2">End Time</label>
					</div>
				</div>
				<a
					class="btn-floating btn waves-effect waves-light white block_center"
					onclick="add_stop()"><i class="material-icons cyan-text">add</i></a>
				<div class="modal-footer white"
					style="height: 50px !important; padding: 0px 0px !important;">
					<button
						class="modal-close btn  waves-effect waves-light cyan no_uppercase routine_add_btn"
						type="button">Cancel</button>
					<button
						class="modal-close btn  waves-effect waves-light cyan no_uppercase routine_add_btn"
						type="submit">Submit</button>
				</div>
			</div>
		</form>
	</div>
	<!-- 这个是删除对话框 -->
	<div id="delete_routine_dialog"
		class="modal delete_routine_stop_dialog">
		<div class="modal-content  grey-text text-darken-1">
			<h5 class="">
				<span class="red-text text-accent-1">Delete</span> this routine?
			</h5>
			<div class="row row_no_margin_bottom">
				<a
					class="btn-flat col s6 center-align modal-close waves-effect waves-red grey-text text-darken-1"
					onclick="toDelteteRoutineServlet()">Yes</a> <a
					class="btn-flat col s6 center-align modal-close waves-effect waves-red grey-text text-darken-1"
					href="#!">No</a>
			</div>
		</div>
	</div>
	<ul id="dropdown1" class="dropdown-content user_drop_down">
		<li><a href="#!"><%=session.getAttribute("user")%></a></li>
		<li class="divider"></li>
		<li><a href="#!">My Info</a></li>
		<li><a href="logout">Logout</a></li>
	</ul>
	<!-- 页头 -->
	<header> <nav class=" white header-menu navbar-fixed">
	<div class="nav-wrapper container">
		<a href="login.jsp"><img src="images/logo_icon.png" alt=""
			class="brand-logo circle responsive-img header-menu circle responsive-img"
			style="padding: 3px"></a>
		<!--       <a href="#!" class="brand-logo cyan-text header-menu">Logo</a> -->
		<a href="#" data-activates="mobile"
			class="button-collapse header-menu"><i
			class="material-icons cyan-text  header-menu">menu</i></a>
		<ul class="right hide-on-med-and-down ">
			<li><a href="path.jsp" class="header-menu cyan-text">Path</a></li>
			<li><a href="station.jsp" class="header-menu cyan-text">Station</a></li>
			<li><a href="routine.jsp" class="header-menu cyan-text">Routine</a></li>
			<li><a href="company.jsp" class="header-menu cyan-text">Company</a></li>
			<li><a class="cyan-text dropdown-button btn-flat user_circle"
				href="#!" data-activates="dropdown1">Me</a></li>
		</ul>
		<ul class="side-nav" id="mobile">
			<li><a href="path.jsp">Path</a></li>
			<li><a href="station.jsp">Station</a></li>
			<li><a href="routine.jsp">Routine</a></li>
			<li><a href="company.jsp">Company</a></li>
			<li><a href="#!"><%=session.getAttribute("user")%></a></li>
			<li class="divider"></li>
			<li><a href="#!">My Info</a></li>
			<li><a href="logout">Logout</a></li>
		</ul>
	</div>
	</nav> </header>
	<main class="cyan">
	<div class="container">
		<div class="row">
			<div class="col s0 m2">&nbsp;</div>
			<!-- 搜索框 -->
			<form class="container card  col s12 m8 path-search-card " action=""
				method="get">
				<div class="row ">
					<div class="input-field col s12 l9 m8">
						<input placeholder="routine" name="routine" value="" type="text">
					</div>
					<div class="input-field col s12 l3 m4 center-align">
						<button class="btn btn-rnd cyan waves-effect waves-light"
							type="submit">Search</button>
					</div>
				</div>
			</form>
		</div>
		<div>
			<!-- 区域名字title -->
			<h4 class="white-text  center thin ">松江区</h4>
			<hr class="" width=240px color=#ffffff size="1" align=centernoshade">
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
					String name = request.getParameter("routine");
					if (null == name) {
						list = bean.getByPage(curPage);
						count = (int) dao.getRoutineCount();
					} else {
						//name=URLDecoder.decode(name,"utf-8");
						list = bean.searchByPage(name, curPage);
						count = (int) dao.findCount("select count(*) from Routine where name like '%" + name + "%'",
								Routine.class);
						System.out.println("快的一笔！" + count);
					}
					for (HashMap<String, Object> map : list) {
				%>
				<li id=<%="routine_pos"+(Integer) map.get("pos")%>>
					<!-- 线路名称信息 -->
					<div class="collapsible-header grey-text text-darken-1">
						<a><i class="material-icons bule0 tooltipped"
							data-position="top" data-delay="50" data-tooltip="company">my_location</i></a>
						<%=(String) map.get("name")%><%=(null == map.get("posFrom")) ? "(环)" : ""%>
						<a href="#!" class="secondary-content"><i
							class="material-icons red0 tooltipped" data-position="top"
							data-delay="50" data-tooltip="delete?"
							onclick="deleteRoutine(<%=(Integer) map.get("pos")%>)">close</i></a>
					</div> <!-- 线路的站点信息 -->
					<div class="collapsible-body white">
						<!-- p标签用来调行间距 -->
						<p class="center-align no-margin" style="line-height: 318%" />
						<span
							class="thin grey-text text-darken-1 routine-orientation-text">To</span>
						<%
							String[] posTo = (String[]) map.get("posTo");
								String[] startTimeTo = (String[]) map.get("startTimeTo");
								String[] endTimeTo = (String[]) map.get("endTimeTo");
								String[] posFrom = (String[]) map.get("posFrom");
								String[] startTimeFrom = (String[]) map.get("startTimeFrom");
								String[] endTimeFrom = (String[]) map.get("endTimeFrom");
								for (int i = 0; i < posTo.length; i++) {
									if (i == 0 || i == posTo.length - 1) {
						%>

						<!-- 站点 -->
						<a
							class='routine-station-change2 path-station-rnd   cyan  white-text  z-depth-1 tooltipped'
							data-position="top" data-delay="50"
							data-tooltip="<%=startTimeTo[i]%>---><%=endTimeTo[i]%>" href='#!'>
							<%=stationName.get(Integer.valueOf(posTo[i]) - 1)%>
						</a>
						<%
							} else {
						%>
						<a
							class='routine-station-change path-station-rnd  disabled  white grey-text text-darken-1 z-depth-1 tooltipped'
							data-position="top" data-delay="50"
							data-tooltip="<%=startTimeTo[i]%>---><%=endTimeTo[i]%>" href='#!'>
							<%=stationName.get(Integer.valueOf(posTo[i]) - 1)%>
						</a>

						<%
							}
									if (i < posTo.length - 1) {
						%>
						<span
							class="waves-effect waves-light  grey-text text-darken-1 btn-flat tooltipped "
							data-position="top" data-delay="50" data-tooltip="add?"
							style="font-size: 20px; margin: 0px; padding: 0px"> ---->
						</span>
						<%
							}
								}
						%>

						<%
							if (null != posFrom) {
						%>
						<span
							class="thin grey-text text-darken-1 routine-orientation-text"
							style="margin-top: 28px;">From</span>
						<%
							for (int i = 0; i < posFrom.length; i++) {
										if (i == 0 || i == posFrom.length - 1) {
						%>
						<a
							class='routine-station-change2 path-station-rnd  disabled  cyan  white-text  z-depth-1 tooltipped'
							data-position="top" data-delay="50"
							data-tooltip="<%=startTimeFrom[i]%>---><%=endTimeFrom[i]%>"
							href='#!'> <%=stationName.get(Integer.valueOf(posFrom[i]) - 1)%>
						</a>
						<%
							} else {
						%>
						<a
							class='routine-station-change path-station-rnd  white grey-text text-darken-1  z-depth-1 tooltipped'
							data-position="top" data-delay="50"
							data-tooltip="<%=startTimeFrom[i]%>---><%=endTimeFrom[i]%>"
							href='#!'> <%=stationName.get(Integer.valueOf(posFrom[i]) - 1)%>
						</a>
						<%
							}
										if (i < posFrom.length - 1) {
						%>
						<span
							class="waves-effect waves-light  grey-text text-darken-1 btn-flat tooltipped"
							data-position="top" data-delay="50" data-tooltip="add?"
							style="font-size: 20px; margin: 0px; padding: 0px"> ---->
						</span>
						<%
							}
									}
								}
						%>
						<div class="divider"></div>
						<br />
						<div class="row orange-text text-darken-2 container">
							<span class="col m0 s1 l0">&nbsp;</span><span
								class="col s5 m2 l2 center-align">Time :<%=(Integer) map.get("time")%>
								min
							</span><span class="col s5 m4 l3 center-align">Length :<%=(Double) map.get("length")%>
								km
							</span>
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
			<li class=<%=curPage == 1 ? "disabled" : "enabled"%>
				style="padding: 0px ! important; margin: 0px;"><a
				class=<%=curPage == 1 ? "teal-text" : "white-text"%>
				href=<%=curPage <= 1 ? "#!" : "?curPage=1" + (name == null ? "" : "&routine=" + name)%>><i
					class="material-icons" style="font-size: 1.2rem !important;">fast_rewind</i></a></li>
			<li class=<%=curPage == 1 ? "disabled" : "enabled"%>
				style="padding: 0px ! important; margin: 0px;"><a
				class=<%=curPage == 1 ? "teal-text" : "white-text"%>
				href=<%=curPage <= 1 ? "#!" : "?curPage=" + (curPage - 1) + (name == null ? "" : "&routine=" + name)%>><i
					class="material-icons" style="font-size: 1.2rem !important;">chevron_left</i></a></li>
			<!-- 1页 -->
			<li><a
				class=<%=curPage == ((curPage - 1) / 5 * 5 + 1) ? "white-text" : "teal-text"%>
				href="?curPage=<%=(curPage - 1) / 5 * 5 + 1%><%=name == null ? "" : "&routine=" + name%>"><%=(curPage - 1) / 5 * 5 + 1%></a></li>
			<%=((curPage - 1) / 5 * 5 + 2) > count / 10 + 1 ? "<!--" : ""%>

			<li><a
				class=<%=curPage == ((curPage - 1) / 5 * 5 + 2) ? "white-text" : "teal-text"%>
				href="?curPage=<%=(curPage - 1) / 5 * 5 + 2%><%=name == null ? "" : "&routine=" + name%>"><%=(curPage - 1) / 5 * 5 + 2%></a></li>
			<%=((curPage - 1) / 5 * 5 + 2) > count / 10 + 1 ? "--!>" : " "%>
			<%=((curPage - 1) / 5 * 5 + 3) > count / 10 + 1 ? "<!--" : " "%>

			<li><a
				class=<%=curPage == ((curPage - 1) / 5 * 5 + 3) ? "white-text" : "teal-text"%>
				href="?curPage=<%=(curPage - 1) / 5 * 5 + 3%><%=name == null ? "" : "&routine=" + name%>"><%=(curPage - 1) / 5 * 5 + 3%></a></li>
			<%=((curPage - 1) / 5 * 5 + 3) > count / 10 + 1 ? "--!>" : " "%>
			<%=((curPage - 1) / 5 * 5 + 4) > count / 10 + 1 ? "<!--" : " "%>

			<li><a
				class=<%=curPage == ((curPage - 1) / 5 * 5 + 4) ? "white-text" : "teal-text"%>
				href="?curPage=<%=(curPage - 1) / 5 * 5 + 4%><%=name == null ? "" : "&routine=" + name%>"><%=(curPage - 1) / 5 * 5 + 4%></a></li>
			<%=((curPage - 1) / 5 * 5 + 4) > count / 10 + 1 ? "--!>" : " "%>
			<%=((curPage - 1) / 5 * 5 + 5) > count / 10 + 1 ? "<!--" : " "%>

			<li><a
				class=<%=curPage == ((curPage - 1) / 5 * 5 + 5) ? "white-text" : "teal-text"%>
				href="?curPage=<%=(curPage - 1) / 5 * 5 + 5%><%=name == null ? "" : "&routine=" + name%>"><%=(curPage - 1) / 5 * 5 + 5%></a></li>
			<%=((curPage - 1) / 5 * 5 + 5) > count / 10 + 1 ? "--!>" : " "%>

			<li class=<%=curPage > count / 10 ? "disabled" : "enabled"%>
				style="padding: 0px ! important; margin: 0px;"><a
				class=<%=curPage > count / 10 ? "teal-text" : "white-text"%>
				href=<%=curPage >= count / 10 + 1 ? "#!"
					: "?curPage=" + (curPage + 1) + (name == null ? "" : "&routine=" + name)%>><i
					class="material-icons" style="font-size: 1.2rem !important;">chevron_right</i></a></li>
			<li class=<%=curPage > count / 10 ? "disabled" : "enabled"%>
				style="padding: 0px ! important; margin: 0px;"><a
				class=<%=curPage > count / 10 ? "teal-text" : "white-text"%>
				href=<%=curPage >= count / 10 + 1 ? "#!"
					: "?curPage=" + (count / 10 + 1) + (name == null ? "" : "&routine=" + name)%>><i
					class="material-icons" style="font-size: 1.2rem !important;">fast_forward</i></a></li>
		</ul>
	</main>
	<div class="fixed-action-btn float-add-button modal-trigger"
		data-target="add_routine_dialog">
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
	<script src="js/abitalo.js"></script>
</body>
</html>
