<?php
require_once("conn.php");
include("functions.php");

$query = "SELECT DISTINCT version FROM Matches ORDER BY INET_ATON(SUBSTRING_INDEX(CONCAT(version, '0.0'),'.',4)) ASC";

try {
    $prepared_stmt = $dbo->prepare($query);
    $prepared_stmt->execute();
    $result = $prepared_stmt->fetchAll();

} catch (PDOException $ex) { // Error in database processing.
    echo $sql . "<br>" . $error->getMessage(); // HTTP 500 - Internal Server Error
}
?>


<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>League Historian</title>
    <link rel="stylesheet"
          href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
          integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
          crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="style.css"/>
</head>
<body>
<div id="dashboard">
    <img src="media/logo.png" id="lologo" height="100" widht="400">
    <h1 id="header">League of Legends Historian</h1>
    <div id="container">
        <form method="post" id="dropdown">
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
        <div id="container2">
            <div id="result11">
                <div id="result1">
                <?php if (isset($_POST['myPatch'])) {
                    $selected_val = $_POST['myPatch'];
                    getMPChamps($selected_val);
                }
                ?>
                </div>
                <div id="result4">
                <?php if (isset($_POST['myPatch'])) {
                    $selected_val = $_POST['myPatch'];
                    getLBChamps($selected_val);
                }
                ?>
                </div>
                <div id="result7">
                <?php if (isset($_POST['myPatch'])) {
                    $selected_val = $_POST['myPatch'];
                    getMPItems($selected_val);
                }
                ?>
                </div>
            </div>
            <div id="result12">
                <div id="result2">
                <?php if (isset($_POST['myPatch'])) {
                    $selected_val = $_POST['myPatch'];
                    getLPChamps($selected_val);
                }
                ?>
                 </div>
                <div id="result5">
                <?php if (isset($_POST['myPatch'])) {
                    $selected_val = $_POST['myPatch'];
                    getBWChamps($selected_val);
                }
                ?>
                </div>
            </div>
            <div id="result13">
                <div id="result3">
                <?php if (isset($_POST['myPatch'])) {
                    $selected_val = $_POST['myPatch'];
                    
                    getMBChamps($selected_val);
                }
                ?>
                </div>
                <div id="result6">
                <?php if (isset($_POST['myPatch'])) {
                    $selected_val = $_POST['myPatch'];
                    getWWChamps($selected_val);
                }
                ?>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
</html>