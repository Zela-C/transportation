<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" import="java.util.*,helper.Path"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<script type="text/javascript">
var id=3;
function add_stop(){
var element = document.getElementById("stations");

var div4 = document.createElement("div");
div4.className +="input-field col s12 m12 l12";
var input4 = document.createElement("input");
input4.id="routine_add_station_cost"+(id-1);
input4.type="text";
var label4 = document.createElement("label");
label4.id=input4.id+"_label";
var label4_text = document.createTextNode("Cost");
label4.appendChild(label4_text);

div4.appendChild(input4);
div4.appendChild(label4);
element.appendChild(div4);
	

var div1 = document.createElement("div");
div1.className +="input-field col s12 m4 l4";
var input1 = document.createElement("input");
input1.id="routine_add_station_name"+id;
input1.type="text";
var label1 = document.createElement("label");
label1.id=input1.id+"_label";
var label_text1 = document.createTextNode("Station Name");
label1.appendChild(label_text1);
div1.appendChild(input1);
div1.appendChild(label1);
element.appendChild(div1);

var div2 = document.createElement("div");
div2.className +="input-field col s12 m4 l4";
var input2 = document.createElement("input");
input2.id="routine_add_station_start"+id;
input2.type="text";
var label2 = document.createElement("label");
label2.id=input2.id+"_label";
var label_text2 = document.createTextNode("Start Time");
label2.appendChild(label_text2);
div2.appendChild(input2);
div2.appendChild(label2);
element.appendChild(div2);

var div3 = document.createElement("div");
div3.className +="input-field col s12 m4 l4";
var input3 = document.createElement("input");
input3.id="routine_add_station_end"+id;
input3.type="text";
var label3 = document.createElement("label");
label3.id=input3.id+"_label";
var label_text3 = document.createTextNode("End Time");
label3.appendChild(label_text3);
div3.appendChild(input3);
div3.appendChild(label3);
element.appendChild(div3);

++id;
}
</script>
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
  <div id="confirm_dialog" class="modal delete_routine_stop_dialog cyan-text">
<div class="modal-content  grey-text text-darken-1">
      <h5 class=""><span class="red-text text-accent-1">Delete</span> this station?</h5>
          <div class="row row_no_margin_bottom">
		<a class="btn-flat col s6 center-align modal-close waves-effect waves-red grey-text text-darken-1" href="#!">Yes</a>
		<a class="btn-flat col s6 center-align modal-close waves-effect waves-red grey-text text-darken-1" href="#!">No</a>
    </div>
  
  </div>
  </div>
  
  <!-- Modal Structure -->
  <div id="modal1" class="modal bottom-sheet routine_add_container cyan">
        <form autocomplete="off">
    <div class="modal-content container white routine_add_padding">
      <h4 class="cyan-text thin">Add a routine?</h4>
<p style="font-size: 1.2rem;margin-bottom: 0px ! important;" class="cyan-text">Routine Info.</p>
      <div class="row">
        <div class="input-field col s12 m4 l4">
          <input  id="routine_add_name" type="text">
          <label for="routine_add_name">Name</label>
        </div>
        <div class="input-field col s6 m4 l4">
          <input id="routine_add_length" type="text">
          <label for="routine_add_length">Length</label>
        </div>
        <div class="input-field col s6 m4 l4">
          <input id="routine_add_time" type="text">
          <label for="routine_add_time">Time</label>
        </div>
        </div>
        <div class="row">
        <div class="input-field col s12 m4 l4">
          <input  id="routine_add_company" type="text">
          <label for="routine_add_company">Company</label>
        </div>
        <div class="input-field col s12 m4 l4">
          <input  id="routine_add_num" type="text">
          <label for="routine_add_num">Number of station</label>
        </div>
                <div class="input-field col s6 m2 l2">
              <input type="checkbox"  id="routine_add_circle" />
     			 <label for="routine_add_circle">circle?</label>
     			 </div>
     			               <div class="input-field col s6 m2 l2">
              <input type="checkbox"  id="routine_add_cross" />
     			 <label for="routine_add_cross">cross?</label>
      </div>
      </div>
<p style="font-size: 1.2rem;margin-bottom: 0px ! important;" class="cyan-text">Stations Info.</p>
         <div class="row" style="margin-bottom: 0px ! important;" id="stations">
        <div class="input-field col s12 m4 l4">
          <input  id="routine_add_station_name1" type="text">
          <label for="routine_add_station_name1">Station Name</label>
        </div>
        <div class="input-field col s6 m4 l4">
          <input id="routine_add_station_start1" type="text">
          <label for="routine_add_station_start1">Start Time</label>
        </div>
        <div class="input-field col s6 m4 l4">
          <input id="routine_add_station_end1" type="text">
          <label for="routine_add_station_end1">End Time</label>
        </div>
          <div class="input-field col s12 m12 l12">
          <input id="routine_add_station_cost1" type="text">
          <label for="routine_add_station_cost1">Cost</label>
        </div>
        <div class="input-field col s12 m4 l4">
          <input  id="routine_add_station_name2" type="text">
          <label for="routine_add_station_name2">Station Name</label>
        </div>
        <div class="input-field col s6 m4 l4">
          <input id="routine_add_station_start2" type="text">
          <label for="routine_add_station_start2">Start Time</label>
        </div>
        <div class="input-field col s6 m4 l4">
          <input id="routine_add_station_end2" type="text">
          <label for="routine_add_station_end2">End Time</label>
        </div>
        </div>
        <a class="btn-floating btn waves-effect waves-light white block_center" onclick="add_stop()"><i class="material-icons cyan-text">add</i></a>
            <div class="modal-footer white" style="height:50px !important;padding:0px 0px !important;">
      <button class="modal-close btn  waves-effect waves-light cyan no_uppercase routine_add_btn" type="button">Cancel </button>
      <button class="modal-close btn  waves-effect waves-light cyan no_uppercase routine_add_btn" type="submit">Submit </button>
      
    </div>
      </div>
      </form>
    </div>
	
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
 <a class="btn white cyan-text center" onclick="Materialize.toast('Delete successfully!', 400000,'toast_right')">Right!</a>
 	
 	<a class="btn white cyan-text center" onclick="Materialize.toast('Sorry，you can not delete this station before removing it from corresponding routines!', 4000,'toast_wrong')">Wrong!</a>
 		</center>
 		<br>
 		<center>
 		 <a class="btn white cyan-text centertooltipped modal-trigger"
							data-position="top" data-delay="50" data-tooltip="add?" data-target="modal1" >Dialog</a>
 		</center>
 	<script src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
	<script src="js/materialize.js"></script>
	<script src="js/init.js"></script>
	</main>
</body>
</html>