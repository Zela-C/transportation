<%@ page contentType="text/html; charset=utf-8" language="java"
	import="java.sql.*" errorPage=""%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link href="css/style.css" rel='stylesheet' type='text/css' />
        <style>
            body{overflow:hidden; margin:0; padding:0;}
            #a{width:100%; height:100%; background-color:gray;}
        </style>
</head>

<body>
	<div class="banner">
	<div class="login-background">
		<div class="contact-bottom">
			<form method="post" action="login">
				<input type="text" name="name" placeholder="Name"
					onfocus=""
					onblur="" /> <br><br/>
				<input type="password" name="passWord" placeholder="PassWord"/>
				<div class="submit-btn">
					<input type="submit" value="SUBMIT">
				</div>
			</form>
		</div>
	</div>
	</div>
</body>
</html>
