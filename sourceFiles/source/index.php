<!DOCTYPE html>
<html>
	<head>
		<title>NOT Steam</title>
		
		<?php $db=new SQLite3('DBProject.db');?>
		
	    <style>
	        body{
	            font-family: Arial, Helvetica, sans-serif;
	        }
	        
		    #search{
		        position: absolute;
		        font-size: 10px;
		        height: 35px;
		        width: 345px;
		        left: 60%;
		        top: 15px;
		    }
	        
	        #login{
		        color: #c6d4df;
		        background-color: #5c7e10;
	            text-decoration: underline;
                padding: 15px 25px 15px 25px;
                vertical-align: top;
                position: absolute;
                right: 100px;
		    }
		    
		    #profile{
                position: absolute;
		        color: #c6d4df;
		        text-decoration: underline;
		        padding: 15px 25px 15px 25px;
		        vertical-align: top;
		        right: 200px;
		    }
		    
		    #game_kiosk{
	            position: relative;
	            padding: 20px 20px 20px 20px;
	            margin:  20px 20px 20px 20px;
	            background-color: #585858;
	            color: #c6d4df;
	            font-size: 30px;
	        }
	        
	        .game{
	            position: relative;
	            width: 100%;
	            height: 69px;
	            font-size: 20px;
	            background: #224D7E;
	            text-decoration: none;
	            display: inline-block;
	        }
	        
	        .game_title{
	            position: relative;
	            top: -75px;
	            left: 200px;
	            color: #c6d4df;
	            height: 0px;
	            width: 500px;
	        }
	        
	        .game_dev{
	            position: absolute;
	            top: 20px;
	            left: 200px;
	            color: #c6d4df;
	            font-size: 15px;
	            height: 0;
	            width: 500px;
	        }
	        
	        .game_genre{
	            position: absolute;
	            top: 35px;
	            left: 200px;
	            color: #c6d4df;
	            font-size: 15px;
	            height: 0;
	            width: 500px;
	        }
	        
	        .game_date{
	            position: absolute;
	            top: 50px;
	            left: 200px;
	            color: #c6d4df;
	            font-size: 15px;
	            height: 0;
	            width: 500px;
	        }
	        
	        .game_price{
	            position: absolute;
	            top: 0;
	            right: 0;
	            color: #c6d4df;
	            height: 20;
	            width: 100;
	        }

		</style>
	</head>
	

	<body style="background-image:url('assets/background.png')">
	    <!-- Header Bar, with login link and logo png -->
		<div id = "header_bar" style = "background:#171a21; padding: 30px 100px 30px 100px;">
		    <img src = "assets/notsteam_logo.png">
		    
		    <a id = "login" href = "login.php">
		        Login
		    </a>
		</div>
		
		<!-- Games display area -->
		<div id = "game_kiosk">
		    <b>Games for Sale</b>
		    
		    <form id = "search" action = "" method = "get">
		        <input type = "text" name = "search">
		        <input type = "submit" value = "search">
		    </form>
		    
		    <?php
		        $res = $db->query("SELECT * FROM Games WHERE title LIKE '%".$_GET['search']."%' OR genre LIKE '%".$_GET['search']."%' OR developer LIKE '%".$_GET['search']."%' OR ryear LIKE '%".$_GET['search']."%'");
		        while($game = $res->fetchArray()){
		            echo "<a class = \"game\" href = \"login.php\">
		                <img src = \"assets/", $game["title"], ".jpg\">

		                <div class = \"game_title\">", $game["title"], "</div>
		        
		                <div class = \"game_price\">$", $game["price"], "</div>
		        
		                <div class = \"game_dev\">", $game["developer"], "</div>
		        
		                <div class = \"game_genre\">", $game["genre"], "</div>
		        
		                <div class = \"game_date\">", $game["ryear"], "</div>
		            </a>";
		        }
		    ?>
		</div>
	</body>
</html>
