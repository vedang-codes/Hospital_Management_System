<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Doctors</title>
    <style>
        table {
            border-spacing: 2px;
            font-size: 20px;
            border: 2px solid black;
        }

        tr,
        td,
        th {
            border-spacing: 1px;
            font-size: 20px;
            border: 1px solid black;
        }

        .container {
            margin: auto;
            font-size: 25px;
            padding: 10px;
        }

        .bton {
            color: whitesmoke;
            background: black;
            border: 2px solid whitesmoke;
            border-radius: 6px;
            font-size: 16px;
            padding: 4px 8px;
            cursor: pointer;
        }
    </style>
    <script>
        function goBack() {
            window.history.back();
        }
    </script>
</head>

<body>
    <button class="bton" onclick="goBack()">Go Back</button>
    <div class="container">
        Doctors Record
    </div>

    <?php
    $sever = 'localhost';
    $username = 'patel3u1_Hospital';
    $password = '123456';
    $db = 'patel3u1_Hospital';

    $con = mysqli_connect($sever, $username, $password, $db);

    if (!$con) {
        die("Connection error " . mysqli_connect_error());
    }

    $result = $con->query("SELECT * FROM `doctor`;");
    $num = mysqli_num_rows($result);
    $resArr = array();

    if ($num > 0) {
        while ($item = mysqli_fetch_assoc($result)) {
            $resArr[] = $item;
        }
    }

    echo "<table>";
    echo "<tr><th>Doctor ID</th><th>Doctor Name</th><th>Doctor Contact</th><th>Patient ID</th><th>Hospital Location</th></tr>";
    foreach ($resArr as $doctor) {
        echo "<tr><td> " . $doctor['Doctor_id'] . " </td>" .
            "<td> " . $doctor['Doctor_name'] . " </td>" .
            "<td> " . $doctor['Doctor_Contact_NO'] . " </td>" .
            "<td> " . $doctor['Patient_ID'] . " </td>" .
            "<td> " . $doctor['hospital_location'] . " </td></tr>";
    }
    echo "</table>";

    // Query for Update
    $sql = "UPDATE `doctor` SET Doctor_name = 'Jenny' WHERE Doctor_id = '102';";

    if ($con->query($sql) == true) {
        echo "<br>Query successfully updated... <br>";
    } else {
        echo "ERROR: $sql <br> $con->error";
    }

    // Query of Left Inner Join
    $sql = "SELECT `doctor`.Doctor_name, `doctor`.Doctor_id, `patient`.Patient_name
				FROM `doctor`
				INNER JOIN `patient`
				ON `doctor`.Patient_ID = `patient`.Patient_id;";

    $result = $con->query($sql);
    $num = mysqli_num_rows($result);
    $resArr = array();

    if ($num > 0) {
        while ($item = mysqli_fetch_assoc($result)) {
            $resArr[] = $item;
        }
    }
    echo "<br><br><div class = 'container'>Table for Left Inner Join</div><br>";
    echo "<table>";
    echo "<tr><th>Doctor Name</th><th>Doctor ID</th><th>Patient Name</th></tr>";
    foreach ($resArr as $doctor) {
        echo "<tr><td> " . $doctor['Doctor_name'] . " </td>" .
            "<td> " . $doctor['Doctor_id'] . " </td>" .
            "<td> " . $doctor['Patient_name'] . " </td></tr>";
    }
    echo "</table>";

    $con->close();
    ?>

</body>

</html>
