<?php
  require 'user.php';
?>

<html>
  <head>
    <title>Home Page</title>
  </head>
  <body>
    <p>SAMPLE PHP SITE</p>
    <p>
      You have successfully logged in 

      <?php
        session_start();

        $user = $_SESSION['current_user'];
       
        echo $user->firstname.' '.$user->lastname.'.';
      ?>
    </p>

    <p>This is your home page.</p>
  </body>
</html>