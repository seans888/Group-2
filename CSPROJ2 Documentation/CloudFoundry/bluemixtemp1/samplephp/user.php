<?php
  require 'dbmanager.php';
?>
<?php
class User{

  var $username;
  var $password;
  var $lastname;
  var $firstname;

  function checkLogin(){
    $dbm = new DBManager();
    $conn = $dbm->getConnection();

    $username = mysql_real_escape_string($this->username);
    $password = mysql_real_escape_string($this->password);

    $sql_stmt = "SELECT * FROM User WHERE username = '".$username."' AND password = '".$password."'";


    //place in retval result of the SQL query
    $retval = mysql_query($sql_stmt, $conn);

    //check if SQL query is successful
    if(! $retval ){
      mysql_close($conn);
      die('Could not read User table: ' . mysql_error());
    }

    $found = false;
    //get first retrieved row from retval
    if ($dbfield = mysql_fetch_assoc($retval)) {
      $found = true;

      //initialize fields of this object with the columns retrieved from the query
      $this->username = $dbfield['username'];
      $this->password = $dbfield['password'];
      $this->lastname = $dbfield['lastname'];
      $this->firstname = $dbfield['firstname'];
    }

    return $found;
  }

  function selectAll(){
    $dbm = new DBManager();
    $conn = $dbm->getConnection();

    $sql_stmt = "SELECT * FROM User";

    //place in retval result of the SQL query
    $retval = mysql_query($sql_stmt, $conn);

    //check if SQL query is successful
    if(! $retval ){
      mysql_close($conn);
      die('Could not read User table: ' . mysql_error());
    }

    //create an empty array that will eventually contain the list of users
    $user_list=array();


    //iterate each row in retval
    while ($dbfield = mysql_fetch_assoc($retval)) {
      //instantiate a user object
      $user = new User();      

      //initialize fields of user object with the columns retrieved from the query
      $user->username = $dbfield['username'];
      $user->password = $dbfield['password'];
      $user->lastname = $dbfield['lastname'];
      $user->firstname = $dbfield['firstname'];

      //add the user object in the array
      $user_list[] = $user;
    }


    mysql_close($conn);

    //return the array
    return $user_list;
  }
}
?>