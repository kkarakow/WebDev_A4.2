<!DOCTYPE html>
<?php
require("connect.php");
?>
<html>
    <head>
        <meta charset="UTF-8">
        <title></title>
    </head>
    <body>
        <?php
        $dbc=connect($hostname, $username, $password);
        displayImage($dbc);
        ?>
    
        <?php
        function connect ($hname, $un, $pswd){
        try {
            $dbConn = new PDO($hname, $un, $pswd);
            
            return $dbConn;
        } catch (PDOException $e) {
            echo "connection error " . $e.getMessage();
        }
        }
        
        function displayImage($dbc){
            $query= "SELECT A.fileName, B.name
                    FROM image A, holiday B 
                    WHERE A.holidayId=B.id";
            
            $stmt = $dbc->prepare($query);
            $exeOk = $stmt->execute();

            if ($exeOk) {
                
                while ($row = $stmt->fetch()) {
                    echo "For " .$row[name];
                    echo "<img src="."images/".$row[filename]."<br><br>";
                }
            } else
                echo "error executing query";
            }
        ?>

    </body>
</html>
