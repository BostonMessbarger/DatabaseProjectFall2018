<?php
    $db=new SQLite3('DBProject.db');
    
    $query = "SELECT usid FROM Users WHERE email = \"".$_POST['email']."\" AND password = \"".$_POST['password']."\"";
    echo $query;
    $r = $db->query($query);
    $result = $r->fetchArray();
    echo $result;
    
    if(count($result['usid']) == 1){
        setcookie('usid', $result['usid']);
        echo 'success';
        header('Location: home.php', true, 303);
        die();
    }else{
        echo 'failure';
        header('Location: login.php', true, 303);
        die();
    }
?>
