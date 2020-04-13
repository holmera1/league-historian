<?php
    require_once("conn.php");

    $query = "SELECT DISTINCT version FROM Matches ORDER BY INET_ATON(SUBSTRING_INDEX(CONCAT(version, '0.0'),'.',4)) DESC";

    try
    {
      $prepared_stmt = $dbo->prepare($query);  
      $prepared_stmt->execute();
      $result = $prepared_stmt->fetchAll();

    }
    catch (PDOException $ex)
    { // Error in database processing.
      echo $sql . "<br>" . $error->getMessage(); // HTTP 500 - Internal Server Error
    }

  function getMPChamps($patchVersion) {
    $dbhost = '127.0.0.1';
    $dbuname = 'root';
    $dbpass = '';
    $dbname = 'league';

    $beemo = new PDO('mysql:host=' . $dbhost . ';port=3306;dbname=' . $dbname, $dbuname, $dbpass);

    $query2 = "CALL getChampsMostPlayed(" . $patchVersion. ")";

    //$query2 = "CALL getChampsMostPlayed("."7.10".")";
    try
    {
      ini_set('max_execution_time', 300);
      $mostPlayed_stmt = $beemo->prepare($query2);
      $mostPlayed_stmt->execute();
      $champsMP = $mostPlayed_stmt->fetchAll();

    }
    catch (PDOException $ex)
    { // Error in database processing.
      echo $sql . "<br>" . $error->getMessage(); // HTTP 500 - Internal Server Error
    }

    if ($champsMP && $mostPlayed_stmt->rowCount() > 0) {
      foreach ($champsMP as $row) {
        echo $row['name'] . "<br>";
      }   
    } 
  }
?>


<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>League Historian</title>
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">


  <style type="text/css" media="screen">
    
  </style>
</head>
<body>
<div class="dashboard">

  <h1>League Historian</h1>
  <div class="container">
    <h1 style="margin-top:0px;">Select Patch Version</h1>
    <form method="post">
    
    
        <select name="myPatch">

            <option value="-1" selected disabled>-Select Patch Version-</option>

      <?php if ($result && $prepared_stmt->rowCount() > 0) {
              foreach ($result as $row) {
                $myVersion = $row['version']; ?>
                <option> <?php echo $row['version']; ?>  </option>
      <?php }     
          } ?>

        </select>
        <input type="submit" name="submit" value="Submit">

    </form>

  <?php if (isset($_POST['myPatch'])) {
      $selected_val = $_POST['myPatch'];
      echo "You have selected patch" . $selected_val . "<br>";
      getMPChamps($selected_val);
    }
  ?>
  </div>
</div>

</body>
</html>