<!DOCTYPE html>
<html>
	<head>
		<title>Login</title>
		
		<style>
		    body{
		        font-family: Arial, Helvetica, sans-serif;
		    }
		    
		    .login_container{
		       position: relative;
		       width: auto;
		       background-color: #585858;
		       color: #c6d4df;
		       padding: 20px 20px 20px 20px;
		       margin: auto;
		       margin-top: 50px;
		    }
		</style>
	</head>

	<body style="background-image:url('assets/background.png')">
	    <div id = "header_bar" style = "background:#171a21; padding: 30px 100px 30px 100px;">
		    <a href = "index.php">
		        <img src = "assets/notsteam_logo.png">
		    </a>
		</div>
		
		<div class = "login_container">
		    <div style = "font-size: 30px;">Login<br><br></div>
		    
		    Enter your Email and Password<br><br>
		    
		    <form action = "check.php" method = "post">
		        Email:<br>
		        <input type = "text" name = "email"><br>
		        Password:<br>
		        <input type = "password" name = "password"><br>
		        <input type = "submit" value = "Login">
		    </form>
		</div>
	</body>
</html>
