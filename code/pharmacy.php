<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Pharmacies</title>
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
        Pharmacies Record
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

        $result = $con->query("SELECT * FROM `pharmacy`;");
        $num = mysqli_num_rows($result);
        $resArr = array();

        if ($num > 0) {
            while ($item = mysqli_fetch_assoc($result)) {
                $resArr[] = $item;
            }
        }

        echo "<table>";
        echo "<tr><th>Pharmacy ID</th><th>Pharmacy Name</th><th>Drug</th><th>Hospital Location</th></tr>";
        foreach ($resArr as $pharmacy) {
            echo "<tr><td> " . $pharmacy['Pharmacy_id'] . " </td>" .
                "<td> " . $pharmacy['Pharmacy_name'] . " </td>" .
                "<td> " . $pharmacy['Drug'] . " </td>" .
                "<td> " . $pharmacy['Hospital_location'] . " </td></tr>";
        }
        echo "</table>";

        $con->close();
    ?>

</body>

</html>