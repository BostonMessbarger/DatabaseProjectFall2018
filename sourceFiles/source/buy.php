<?php
    $db=new SQLite3('DBProject.db');
    
    $gid = $_GET['gid'];
    
    //find price
    $r1 = $db->query("SELECT price FROM Games WHERE gid = ".$gid);
    $r2 = $r1->fetchArray();
    $price = $r2['price'];
    echo $price;
    
    //find wallet balance
    $r3 = $db->query("SELECT wallet FROM Users WHERE usid = ".$_COOKIE['usid']);
    $r4 = $r3->fetchArray();
    $wallet = $r4['wallet'];
    echo $wallet;
    
    //determine if they can afford
    if($wallet >= $price){
        $q = "SELECT gid FROM Owns WHERE usid = ".$_COOKIE['usid']." AND gid = ".$gid;
        $r5 = $db->query($q);
        $r6 = $r5->fetchArray();
        $owned = $r6['gid'];
            
        //Determine if they already own the game
        if($gid != $owned){
            $db->query("UPDATE Users SET wallet=".($wallet-$price)." WHERE usid=".$_COOKIE['usid']);
            $db->query("INSERT INTO Owns (usid, gid) VALUES(".$_COOKIE['usid'].",".$gid.")");
            header('Location: profile.php', true, 303);
            die();
        }else{
            header('Location: home.php', true, 303);
            die();
        }
    }else{
        header('Location: home.php', true, 303);
        die();
    }
    
?>
