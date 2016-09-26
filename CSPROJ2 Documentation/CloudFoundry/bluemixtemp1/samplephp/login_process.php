<?php
  require 'user.php';
?>
<?php
  $user = new User();
  $user->username = $_REQUEST['username'];
  $user->password = $_REQUEST['password'];

  $found = $user->checkLogin();

  if ($found){//redirect to home page
    session_start();
    $_SESSION['current_user']=$user;

    header("Location: home.php");
    exit;
  }else{//invalid username and password
    echo "Invalid username/password.  Click <a href='login.php'>[here]</a> to login again.<br>";
    echo "<br>";
    echo "You may also click <a href='index.php'>[here]</a> to see the list of usernames and passwords.<br>";
  }
?>
