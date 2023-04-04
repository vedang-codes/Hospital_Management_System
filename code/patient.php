<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Patients</title>
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
            padding: 10px;
            font-size: 25px;
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
        Patients Record
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

        $result = $con->query("SELECT * FROM `patient`;");
        $num = mysqli_num_rows($result);
        $resArr = array();

        if ($num > 0) {
            while ($item = mysqli_fetch_assoc($result)) {
                $resArr[] = $item;
            }
        }

        echo "<table>";

        echo "<tr><th>Patient ID</th><th>Patient Name</th><th>Sex</th>" .
            "<th>Disease</th><th>Treatment</th><th>Admission Date</th>" .
            "<th>Contact Info</th><th>Patient Address</th><th>Hospital Location</th></tr>";

        foreach ($resArr as $patient) {
            echo "<tr><td> " . $patient['Patient_id'] . " </td>" .
                "<td> " . $patient['Patient_name'] . " </td>" .
                "<td> " . $patient['Sex'] . " </td>" .
                "<td> " . $patient['Disease'] . " </td>" .
                "<td> " . $patient['Treatment'] . " </td>" .
                "<td> " . $patient['AdmissionDate'] . " </td>" .
                "<td> " . $patient['Contact_info'] . " </td>" .
                "<td> " . $patient['Patient_Address'] . " </td>" .
                "<td> " . $patient['hospital_location'] . " </td></tr>";
        }

        echo "</table>";

        // Query-1: For inserting data

        $sql = "INSERT INTO `patient` (`Patient_id`, `Patient_name`, `Sex`, `Disease`, 
            `Treatment`, `AdmissionDate`, `Contact_info`, `Patient_Address`, `Hospital_location`) 
            VALUES ('11029', 'Emily', 'female', 'Fracture on Left palm', 'Normal Plaster', '2022-03-25', 1470122030, '1247 Lauzon St.', 'LocationDEF');";

        if ($con->query($sql) == true) {
            echo "<br>Query successfully inserted... <br>";
        } else {
            echo "ERROR: $sql <br> $con->error";
        }

        // Query for specific location 
        $sql = "SELECT `patient`.Patient_name, `patient`.Patient_id 
            FROM `patient`, `hospital` 
            WHERE `hospital`.hospital_location = `patient`.hospital_location AND `patient`.hospital_location = 'LocationDEF';";

        $result = $con->query($sql);
        $num = mysqli_num_rows($result);
        $resArr = array();

        if ($num > 0) {
            while ($item = mysqli_fetch_assoc($result)) {
                $resArr[] = $item;
            }
        }

        echo "<br><br><div class = 'container'>Table for Specific Location of Hospital</div><br>";

        echo "<table>";

        echo "<tr><th>Patient Name</th><th>Patient ID</th></tr>";

        foreach ($resArr as $arr) {
            echo "<tr><td> " . $arr['Patient_name'] . " </td>" .
                "<td> " . $arr['Patient_id'] . " </td></tr>";
        }

        echo "</table>";

        $con->close();
    ?>

</body>

</html>