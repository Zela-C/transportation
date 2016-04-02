<%@ page contentType="text/html; charset=utf-8" language="java"
	import="java.sql.*" errorPage=""%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1.0" />
<title>无标题文档</title>
 <!-- CSS  -->
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<link href="css/materialize.min.css" type="text/css" rel="stylesheet"
	media="screen,projection" />
<link href="css/zela.css" type="text/css" rel="stylesheet"
	media="screen,projection" />

</head>

<body style="height:1000px">

  <!-- Modal Trigger -->

  <!-- 这个是对话框 -->
  <div id="modal1" class="modal" style="width:270px; height:230x">
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
  
   <!-- 对话框的Trigger 注意data-target为对话框id -->
  <button data-target="modal1" class="btn modal-trigger">线路增加站点</button>
  
  
    <!-- 这个是对话框 -->
  <div id="modal2" class="modal" style="width:270px;">
    <form action=""  method="post">
    <div class="modal-content" >
      <h5 class=""><span class="red-text text-accent-1">New</span> station?</h5>
         <div class="row" style="height:30px">
				<div class="input-field col s12">
				          <input id="" type="text" placeholder="Station">
				</div>
		</div>
		 <div class="row" style="height:30px">
				<div class="input-field col s6" >
				          <input id="" type="text" placeholder="Longitude">
				</div>
				<div class="input-field col s6">
				          <input id="" type="text" placeholder="Latitude">
				</div>
	</div>
	         <div class="row" style= "height:30px">
				<div class="input-field col s12">
				          <input id="" type="text" placeholder="Region">
				</div>
		</div>
	<center >
				<div class="btn-flat waves-effect waves-red">
					<span>&nbsp;</span> <input type="submit" value="Sure&nbsp;">
				</div>
          </center>
    </div>
     </form>
  </div>


   <!-- 对话框的Trigger 注意data-target为对话框id-->
  <button data-target="modal2" class="btn modal-trigger">增加新的站点资料</button>
  	<!--  Scripts-->
	<script src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
	<script src="js/materialize.js"></script>
	<script src="js/init.js"></script>
</body>
</html>
