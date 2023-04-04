<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Nurses</title>
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
        Nurses Record
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

        $result = $con->query("SELECT * FROM `nurse`;");
        $num = mysqli_num_rows($result);
        $resArr = array();

        if ($num > 0) {
            while ($item = mysqli_fetch_assoc($result)) {
                $resArr[] = $item;
            }
        }

        echo "<table>";
        echo "<tr><th>Nurse ID</th><th>Nurse Name</th><th>Patient ID</th><th>Hospital Location</th></tr>";
        foreach ($resArr as $nurse) {
            echo "<tr><td> " . $nurse['Nurse_id'] . " </td>" .
                "<td> " . $nurse['Nurse_name'] . " </td>" .
                "<td> " . $nurse['Patient_id'] . " </td>" .
                "<td> " . $nurse['Hospital_location'] . " </td></tr>";
        }
        echo "</table>";

        // Query for patients allocated to specific nurse
        $sql = "SELECT `nurse`.Nurse_name, `nurse`.Nurse_id, `patient`.Patient_name
                    FROM `nurse`, `patient`
                    WHERE `nurse`.Patient_id = `patient`.Patient_id AND `nurse`.Nurse_id = '209';";

        $result = $con->query($sql);
        $num = mysqli_num_rows($result);
        $resArr = array();

        if ($num > 0) {
            while ($item = mysqli_fetch_assoc($result)) {
                $resArr[] = $item;
            }
        }
        echo "<br><br><div class = 'container'>Table for Specific Nurse</div><br>";
        echo "<table>";
        echo "<tr><th>Nurse Name</th><th>Nurse ID</th><th>Patient Name</th></tr>";
        foreach ($resArr as $nurse) {
            echo "<tr><td> " . $nurse['Nurse_name'] . " </td>" .
                "<td> " . $nurse['Nurse_id'] . " </td>" .
                "<td> " . $nurse['Patient_name'] . " </td></tr>";
        }
        echo "</table>";

        $con->close();
    ?>

</body>

</html>