<?php
    setcookie("usid", "", time() - 3600);
    header('Location: index.php', true, 303);
    die();
?>
