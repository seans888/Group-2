<?php
class DBManager{

  function getConnection(){

    $services = getenv("VCAP_SERVICES");
    $services_json = json_decode($services,true);
    $mysql_config = $services_json["mysql-5.5"][0]["credentials"];

    $db = $mysql_config["name"];
    $host = $mysql_config["host"];
    $port = $mysql_config["port"];
    $username = $mysql_config["user"];
    $password = $mysql_config["password"];

    $conn = mysql_connect($host . ':' . $port, $username, $password);
  
    if(! $conn ){
      die('Could not connect: ' . mysql_error());
    }

    mysql_select_db($db);
    return $conn;
  }
}
?>