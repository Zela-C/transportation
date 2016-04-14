<%@page import="java.util.HashMap"%>
<%@page import="bean.StationBean"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"
	import="java.util.List,entity.Station,dao.StationDao"%>
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
</style>
<script type="text/javascript">
	var pos=-1;
	  function deleteStation(tpos){
		  pos=tpos;
		  $('#delete_dialog').openModal();
	  }
	  function tosServlet(){
			window.location.href="http://localhost:8080/transportation/deletestation?pos="+pos;
	  }
	</script>
</head>
<%!StationDao dao = new StationDao();
	StationBean bean = new StationBean();
	List<HashMap<String, Object>> list = null;
	int count = 0;
	int curPage = 1;
	private static final int pageSize = 10;%>
<body>
	<!-- 这个是对话框 -->
	<div id="add_station_dialoge" class="modal grey-text text-darken-1"
		style="width: 270px;">
		<form action="addstation" method="post"
			onsubmit="return check_station_add(this);" autocomplete="off">
			<div class="modal-content">
				<h5 class="">
					<span class="red-text text-accent-1">New</span> station?
				</h5>
				<div class="row" style="height: 30px">
					<div class="input-field col s12">
						<input name="station" id="station_add" type="text"
							placeholder="Station" onfocus="lose_label(this)"
							onblur="validate_required(this)"
							onchange="validate_required(this)"><label
							for="station_add" id="station_add_label" data-error="wrong"
							data-success="ok">&nbsp;</label>
					</div>
				</div>
				<div class="row" style="height: 30px">
					<div class="input-field col s6">
						<input name="longtitude" id="longtitude_add" type="text"
							placeholder="Longitude" onfocus="lose_label(this)"
							onblur="check_position(this)" onchange="check_position(this)">
						<label for="longtitude_add" id="longtitude_add_label"
							data-error="wrong" data-success="ok">&nbsp;</label>
					</div>
					<div class="input-field col s6">
						<input name="latitude" id="latitude_add" type="text"
							placeholder="Latitude" onfocus="lose_label(this)"
							onblur="check_position(this)" onchange="check_position(this)">
						<label for="latitude_add" id="latitude_add_label"
							data-error="wrong" data-success="ok">&nbsp;</label>
					</div>
				</div>
				<div class="row" style="height: 30px">
					<div class="input-field col s12">
						<input name="region" id="region_add" type="text"
							placeholder="Region" onfocus="lose_label(this)"
							onblur="validate_required(this)"
							onchange="validate_required(this)"><label
							for="region_add" id="region_add_label" data-error="wrong"
							data-success="ok">&nbsp;</label>
					</div>
				</div>
					<button class="grey-text text-darken-1 btn-flat white waves-effect waves-red no_uppercase block_center" type="submit">  Sure
					</button>
			</div>
		</form>
	</div>
	<!-- 这个是删除对话框 -->
	  <div id="delete_dialog" class="modal delete_routine_stop_dialog">
<div class="modal-content  grey-text text-darken-1">
      <h5 class=""><span class="red-text text-accent-1">Delete</span> this station?</h5>
          <div class="row row_no_margin_bottom">
		<a class="btn-flat col s6 center-align modal-close waves-effect waves-red grey-text text-darken-1"  onclick="tosServlet()">Yes</a>
		<a class="btn-flat col s6 center-align modal-close waves-effect waves-red grey-text text-darken-1" href="#!">No</a>
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
						<input placeholder="station" name="station" value="" type="text">
					</div>
					<div class="input-field col s12 l3 m4 center-align">
						<button class="btn btn-rnd cyan waves-effect waves-light"
							type="submit">Search</button>
					</div>
				</div>
			</form>
		</div>

		<div class="container station-rnd z-depth-1 grey-text text-darken-1">
			<!-- 站点信息 -->
			<table class="responsive-table station-border  centered  striped ">
				<thead class="">
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

						String name = request.getParameter("station");
						if (null == name) {
							list = bean.getByPage(curPage);
							count = (int) dao.getStationsCount();
						} else {
							list = bean.searchByPage(name, curPage);
							count = (int) dao.findCount("select count(*) from Station where name like '%" + name + "%'",
									Station.class);
							System.out.println("快的一笔！" + count);
						}

						for (HashMap<String, Object> map : list) {
					%>
					<tr>
						<td><%=(Integer) map.get("pos")%></td>
						<td><%=(String) map.get("name")%></td>
						<td><%=(Double) map.get("longitude")%></td>
						<td><%=(Double) map.get("latitude")%></td>
						<td><i class="btn-flat material-icons  red0 tooltipped thin"
							data-position="top" data-delay="50" data-tooltip="delete?"
							onclick="deleteStation(<%=(Integer) map.get("pos")%>)">×</i></td>
					</tr>
					<%
						}
					%>
				</tbody>
			</table>
		</div>
		<!-- 页码 -->
		<ul class="pagination center">
			<li class=<%=curPage == 1 ? "disabled" : "enabled"%>
				style="padding: 0px ! important; margin: 0px;"><a
				class=<%=curPage == 1 ? "teal-text" : "white-text"%>
				href=<%=curPage <= 1 ? "#!" : "?curPage=1" + (name == null ? "" : "&station=" + name)%>><i
					class="material-icons" style="font-size: 1.2rem !important;">fast_rewind</i></a></li>
			<li class=<%=curPage == 1 ? "disabled" : "enabled"%>
				style="padding: 0px ! important; margin: 0px;"><a
				class=<%=curPage == 1 ? "teal-text" : "white-text"%>
				href=<%=curPage <= 1 ? "#!" : "?curPage=" + (curPage - 1) + (name == null ? "" : "&station=" + name)%>><i
					class="material-icons" style="font-size: 1.2rem !important;">chevron_left</i></a></li>
			<li><a
				class=<%=curPage == ((curPage - 1) / 5 * 5 + 1) ? "white-text" : "teal-text"%>
				href="?curPage=<%=(curPage - 1) / 5 * 5 + 1%><%=name == null ? "" : "&station=" + name%>"><%=(curPage - 1) / 5 * 5 + 1%></a></li>
			<%=((curPage - 1) / 5 * 5 + 2) > count / 10 + 1 ? "<!--" : ""%>
			<li><a
				class=<%=curPage == ((curPage - 1) / 5 * 5 + 2) ? "white-text" : "teal-text"%>
				href="?curPage=<%=(curPage - 1) / 5 * 5 + 2%><%=name == null ? "" : "&station=" + name%>"><%=(curPage - 1) / 5 * 5 + 2%></a></li>
			<%=((curPage - 1) / 5 * 5 + 2) > count / 10 + 1 ? "--!>" : " "%>
			<%=((curPage - 1) / 5 * 5 + 3) > count / 10 + 1 ? "<!--" : " "%>
			<li><a
				class=<%=curPage == ((curPage - 1) / 5 * 5 + 3) ? "white-text" : "teal-text"%>
				href="?curPage=<%=(curPage - 1) / 5 * 5 + 3%><%=name == null ? "" : "&station=" + name%>"><%=(curPage - 1) / 5 * 5 + 3%></a></li>
			<%=((curPage - 1) / 5 * 5 + 3) > count / 10 + 1 ? "--!>" : " "%>
			<%=((curPage - 1) / 5 * 5 + 4) > count / 10 + 1 ? "<!--" : " "%>
			<li><a
				class=<%=curPage == ((curPage - 1) / 5 * 5 + 4) ? "white-text" : "teal-text"%>
				href="?curPage=<%=(curPage - 1) / 5 * 5 + 4%><%=name == null ? "" : "&station=" + name%>"><%=(curPage - 1) / 5 * 5 + 4%></a></li>
			<%=((curPage - 1) / 5 * 5 + 4) > count / 10 + 1 ? "--!>" : " "%>
			<%=((curPage - 1) / 5 * 5 + 5) > count / 10 + 1 ? "<!--" : " "%>
			<li><a
				class=<%=curPage == ((curPage - 1) / 5 * 5 + 5) ? "white-text" : "teal-text"%>
				href="?curPage=<%=(curPage - 1) / 5 * 5 + 5%><%=name == null ? "" : "&station=" + name%>"><%=(curPage - 1) / 5 * 5 + 5%></a></li>
			<%=((curPage - 1) / 5 * 5 + 5) > count / 10 + 1 ? "--!>" : " "%>
			<li class=<%=curPage > count / 10 ? "disabled" : "enabled"%>
				style="padding: 0px ! important; margin: 0px;"><a
				class=<%=curPage > count / 10 ? "teal-text" : "white-text"%>
				href=<%=curPage >= count / 10 + 1
					? "#!"
					: "?curPage=" + (curPage + 1) + (name == null ? "" : "&station=" + name)%>><i
					class="material-icons" style="font-size: 1.2rem !important;">chevron_right</i></a></li>
			<li class=<%=curPage > count / 10 ? "disabled" : "enabled"%>
				style="padding: 0px ! important; margin: 0px;"><a
				class=<%=curPage > count / 10 ? "teal-text" : "white-text"%>
				href=<%=curPage >= count / 10 + 1
					? "#!"
					: "?curPage=" + (count / 10 + 1) + (name == null ? "" : "&station=" + name)%>><i
					class="material-icons" style="font-size: 1.2rem !important;">fast_forward</i></a></li>
		</ul>
	</main>
	<div class="fixed-action-btn float-add-button  modal-trigger"
		data-target="add_station_dialoge">

		<a
			class="btn-floating btn-large float-add-button white waves-effect waves-light tooltipped"
			data-position="top" data-delay="50" data-tooltip="new station?">
			<i class="material-icons cyan-text">add</i>
		</a>
	</div>
	<!--  Scripts-->
	<script src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
	<script src="js/materialize.js"></script>
	<script src="js/init.js"></script>
	<script type="text/javascript" src="js/validate.js"></script>
</body>
</html>
