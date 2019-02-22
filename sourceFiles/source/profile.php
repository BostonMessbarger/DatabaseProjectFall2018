<!DOCTYPE html>
<html>
	<head>
		<title>NOT Steam Profile</title>
		
		<?php $db=new SQLite3('DBProject.db');?>
		
		<style>
		    body{
		        background-image:url('assets/background.png');
	            font-family: Arial, Helvetica, sans-serif;
	        }
		
		    #header_bar{
		        background:#171a21;
		        padding: 30px 100px 30px 100px;
	    	}
	    	
	    	#logout{
		        color: #c6d4df;
		        background-color: #5c7e10;
	            text-decoration: underline;
                padding: 15px 25px 15px 25px;
                vertical-align: top;
                position: absolute;
                right: 100px;
		    }
		    
		    #profile_kiosk{
		        position: relative;
	            padding: 20px 20px 20px 20px;
	            margin:  20px 20px 20px 20px;
	            background-color: #585858;
	            color: #c6d4df;
	            font-size: 30px;
		    }
		    
		    .sub_kiosk{
		        position: relative;
	            padding: 20px 20px 20px 20px;
	            margin:  10px 10px 10px 10px;
	            color: #c6d4df;
	            font-size: 20px;
		    }
		    
		    .game{
	            position: relative;
	            width: 100%;
	            margin-bottom: 20px;
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
	        
	        .game_cards{
	            position: relative;
	            margin: 5px 5px 5px 20px;
	            color: #c6d4df;
	        }
	        
	        .game_achieve{
	            position: relative;
	            margin: 5px 5px 5px 20px;
	            color: #c6d4df;
	        }
		</style>
	</head>

	<body>
	    <!-- Header Bar, with login link and logo png -->
		<div id = "header_bar">
		    <a href = "home.php">
		        <img src = "assets/notsteam_logo.png">
		    </a>
		    
		    <a id = "logout" href = "logout.php">
		        Logout
		    </a>
		</div>
		
		<!-- Profile container -->
		<div id = "profile_kiosk">
		    <b>Profile</b>

            <?php
		        echo "<div class = \"sub_kiosk\">
		            <form action = \"\" method = \"post\">
		            	Email:<br>
		                <input type = \"text\" name = \"user_email\" value = \"example@example.com\">
		                <input style = \"background-color: #5c7e10;\" type = \"submit\" value = \"Update\"><br>
		            
		                Password:<br>
		                <input type = \"password\" name = \"user_pass\" value = \"password\"><br>
		            
		                Display Name:<br>
		                <input type = \"text\" name = \"display_name\" value = \"Ex@mpl3\">
		            </form>
		        </div>";
		    ?>
		    
		    Stats
		    <?php
		        $res = $db->query("SELECT wallet FROM Users WHERE usid =".$_COOKIE['usid']);
		        $wallet = $res->fetchArray();
		    ?>
		    <div class = "sub_kiosk">
	            <span>Wallet: $<?php echo $wallet['wallet']?></span>
	            <span style = "position: absolute; right: 45%;">Games Owned: <?php ?></span>
	            <span style = "position: absolute; right: 0%">Total Points: <?php ?> Pts.</span>
		    </div>
		    
		    Inventory
		    <div class = "sub_kiosk">
		        <?php
		            $owned_games = $db->query("SELECT title, developer, genre, ryear, gid FROM Owns NATURAL JOIN Games WHERE usid =".$_COOKIE['usid']);
		            while($game = $owned_games->fetchArray()){
		                echo "<div class = \"game\">
		                    <div class = \"game_info\">
		                        <img src = \"assets/", $game["title"], ".jpg\">

		                        <div class = \"game_title\">", $game["title"], "</div>
		        
		                        <div class = \"game_dev\">", $game["developer"], "</div>
		        
		                        <div class = \"game_genre\">", $game["genre"], "</div>
		        
		                        <div class = \"game_date\">", $game["ryear"], "</div>
		                    </div>";

		                echo "Trading Cards:<br>";  
		                $tc = $db->query("SELECT title, gid FROM TradingCard NATURAL JOIN Collected WHERE gid = ".$game['gid']." AND usid = 3");
		                while($card = $tc->fetchArray()){
		                    echo "<div class = \"game_cards\">",
		                         $card['title'],
		                        "<span style = \"position: absolute; right: 50%;\"></span>
		                        <span style = \"position: absolute; right: 0;\"></span>
		                    </div>";
		                }

		                echo "Achievements:<br>";
		                $chieves = $db->query("SELECT title,name,ptValue FROM Earn NATURAL JOIN Achievements NATURAL JOIN (SELECT gid,title FROM Games) WHERE gid = ".$game['gid']." AND usid =".$_COOKIE['usid']);
		                while($pts = $chieves->fetchArray()){
		                    echo "<div class = \"game_achieve\">
		                        ",$pts["name"],"
		                        <span style = \"position: absolute; right: 0;\">", $pts['ptValue'], " Pts.</span>
		                    </div>";
		                }
		                
		                echo "</div>";
		            }
		        ?>
		    </div>
		</div>
	</body>
</html>
