<?php
function getMPChamps($patchVersion) {
    $dbhost = '127.0.0.1';
    $dbuname = 'root';
    $dbpass = '';
    $dbname = 'league';

    $beemo = new PDO('mysql:host=' . $dbhost . ';port=3306;dbname=' . $dbname, $dbuname, $dbpass);

    $query = "CALL getChampsMostPlayed(" . $patchVersion. ")";

    try
    {
      ini_set('max_execution_time', 300);
      $mostPlayed_stmt = $beemo->prepare($query);
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


function getLPChamps($patchVersion)
{
    $dbhost = '127.0.0.1';
    $dbuname = 'root';
    $dbpass = '';
    $dbname = 'league';

    $beemo = new PDO('mysql:host=' . $dbhost . ';port=3306;dbname=' . $dbname, $dbuname, $dbpass);

    $query = "CALL getChampsLeastPlayed(" . $patchVersion . ")";

    try {
        ini_set('max_execution_time', 300);
        $leastPlayed_stmt = $beemo->prepare($query);
        $leastPlayed_stmt->execute();
        $champsLP = $leastPlayed_stmt->fetchAll();

    } catch (PDOException $ex) { // Error in database processing.
        echo $sql . "<br>" . $error->getMessage(); // HTTP 500 - Internal Server Error
    }

    if ($champsLP && $leastPlayed_stmt->rowCount() > 0) {
        foreach ($champsLP as $row) {
            echo $row['name'] . "<br>";
        }
    }
}


function getMBChamps($patchVersion)
{
    $dbhost = '127.0.0.1';
    $dbuname = 'root';
    $dbpass = '';
    $dbname = 'league';

    $beemo = new PDO('mysql:host=' . $dbhost . ';port=3306;dbname=' . $dbname, $dbuname, $dbpass);

    $query = "CALL getChampsMostBanned(" . $patchVersion . ")";

    try {
        ini_set('max_execution_time', 300);
        $mostBanned_stmt = $beemo->prepare($query);
        $mostBanned_stmt->execute();
        $champsMB = $mostBanned_stmt->fetchAll();

    } catch (PDOException $ex) { // Error in database processing.
        echo $sql . "<br>" . $error->getMessage(); // HTTP 500 - Internal Server Error
    }

    if ($champsMB && $mostBanned_stmt->rowCount() > 0) {
        foreach ($champsMB as $row) {
            echo $row['name'] . "<br>";
        }
    }
}

function getLBChamps($patchVersion)
{
    $dbhost = '127.0.0.1';
    $dbuname = 'root';
    $dbpass = '';
    $dbname = 'league';

    $beemo = new PDO('mysql:host=' . $dbhost . ';port=3306;dbname=' . $dbname, $dbuname, $dbpass);

    $query = "CALL getChampsLeastBanned(" . $patchVersion . ")";

    try {
        ini_set('max_execution_time', 300);
        $leastBanned_stmt = $beemo->prepare($query);
        $leastBanned_stmt->execute();
        $champsLB = $leastBanned_stmt->fetchAll();

    } catch (PDOException $ex) { // Error in database processing.
        echo $sql . "<br>" . $error->getMessage(); // HTTP 500 - Internal Server Error
    }

    if ($champsLB && $leastBanned_stmt->rowCount() > 0) {
        foreach ($champsLB as $row) {
            echo $row['name'] . "<br>";
        }
    }
}


function getBWChamps($patchVersion)
{
    $dbhost = '127.0.0.1';
    $dbuname = 'root';
    $dbpass = '';
    $dbname = 'league';

    $beemo = new PDO('mysql:host=' . $dbhost . ';port=3306;dbname=' . $dbname, $dbuname, $dbpass);

    $query = "CALL getChampsBestWinrate(" . $patchVersion . ")";

    try {
        ini_set('max_execution_time', 300);
        $bestWin_stmt = $beemo->prepare($query);
        $bestWin_stmt->execute();
        $champsBW = $bestWin_stmt->fetchAll();

    } catch (PDOException $ex) { // Error in database processing.
        echo $sql . "<br>" . $error->getMessage(); // HTTP 500 - Internal Server Error
    }

    if ($champsBW && $bestWin_stmt->rowCount() > 0) {
        foreach ($champsBW as $row) {
            echo $row['name'] . "<br>";
        }
    }
}


function getWWChamps($patchVersion)
{
    $dbhost = '127.0.0.1';
    $dbuname = 'root';
    $dbpass = '';
    $dbname = 'league';

    $beemo = new PDO('mysql:host=' . $dbhost . ';port=3306;dbname=' . $dbname, $dbuname, $dbpass);

    $query = "CALL getChampsWorstWinrate(" . $patchVersion . ")";

    try {
        ini_set('max_execution_time', 300);
        $worstWin_stmt = $beemo->prepare($query);
        $worstWin_stmt->execute();
        $champsWW = $worstWin_stmt->fetchAll();

    } catch (PDOException $ex) { // Error in database processing.
        echo $sql . "<br>" . $error->getMessage(); // HTTP 500 - Internal Server Error
    }

    if ($champsWW && $worstWin_stmt->rowCount() > 0) {
        foreach ($champsWW as $row) {
            echo $row['name'] . "<br>";
        }
    }
}


function getMPItems($patchVersion)
{
    $dbhost = '127.0.0.1';
    $dbuname = 'root';
    $dbpass = '';
    $dbname = 'league';

    $beemo = new PDO('mysql:host=' . $dbhost . ';port=3306;dbname=' . $dbname, $dbuname, $dbpass);

    $query = "CALL getMostPopularItems(" . $patchVersion . ")";

    try {
        ini_set('max_execution_time', 300);
        $itemsMP_stmt = $beemo->prepare($query);
        $itemsMP_stmt->execute();
        $itemsMP = $itemsMP_stmt->fetchAll();

    } catch (PDOException $ex) { // Error in database processing.
        echo $sql . "<br>" . $error->getMessage(); // HTTP 500 - Internal Server Error
    }

    if ($itemsMP && $itemsMP_stmt->rowCount() > 0) {
        foreach ($itemsMP as $row) {
            echo $row['name'] . "<br>";
        }
    }
}

?>