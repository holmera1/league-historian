<?php
    require_once("conn.php");

    $query = "SELECT DISTINCT version FROM Matches ORDER BY version DESC";

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
        <!-- for onchange, we can make a function separate from the html so when the onchange is hit (patch version is selected), then it will do some function (ie. show stats for a specific patch) -->
        <select onchange="queryFunction()">
            <option value="-1" selected disabled>-Select Patch Version-</option>
      <?php if ($result && $prepared_stmt->rowCount() > 0) {
                foreach ($result as $row) { ?>
                  <option><?php echo $row['version']; ?>  </option>
          <?php }
              
            } ?>
        </select>
  </div>
</div>

</body>
</html>