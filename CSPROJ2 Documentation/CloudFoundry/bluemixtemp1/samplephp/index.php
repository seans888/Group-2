<?php
  require 'user.php';
?>
<html>
  <head>
    <title>DB Query PHP Page</title>
  </head>
  <body>
    <p>SAMPLE PHP SITE</p>
    <p>Contents of table User:</p>
    <table border='1'>
      <tr>
        <td>Username</td>
        <td>Password</td>
        <td>Last Name</td>
        <td>First Name</td>
      </tr>
    <?php 
      //refer to user.php for the implementation of the class User 
      $user_list = (new User())->selectAll();

      foreach($user_list as $user) {
        echo '<tr>';
        echo '<td>'.$user->username.'</td>';
        echo '<td>'.$user->password.'</td>';
        echo '<td>'.$user->lastname.'</td>';
        echo '<td>'.$user->firstname.'</td>';
        echo '</tr>';
      }
    ?>
    </table> 
    
    <br><br>
    Click <a href='login.php'>[here]</a> to test the login page.<br>
     
  </body>
</html>