<?php
    $insert = false;
    if(isset($_POST['name'])) {
        $sever = 'localhost';
        $username = 'patel3u1_Hospital';
        $password = '123456';
        $db = 'patel3u1_Hospital';

        $con = mysqli_connect($sever, $username, $password, $db);

        if (!$con) {
            die("Connection error " . mysqli_connect_error());
        }

        $name = $_POST['name'];
        $email = $_POST['email'];
        $contact = $_POST['contact'];
        $suggestions = $_POST['suggestions'];

        $sql = "INSERT INTO `feedback` ( `name`, `email`, `contact`, `suggestions`) VALUES ('$name', '$email', '$contact', '$suggestions');";
        if($con->query($sql) == true) {
            $insert = true;
        }
        else {
            echo "ERROR: $sql <br> $con->error";
        }
    }
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home Page</title>
    <link rel="stylesheet" href="style.css">
</head>

<body>
    <img src="bg.png" class="bg" alt="Windsor Regional Hospital">
    <div>
        <nav id="top" class="sidebar">
            <a href="aboutus.html">About Us</a><br><br><br>
            <a href="hospital.php">Branches</a><br><br><br>
            <a href="patient.php">Patients Records</a><br><br><br>
            <a href="doctor.php">Doctors Records</a><br><br><br>
            <a href="nurse.php">Nurses Records</a><br><br><br>
            <a href="pharmacy.php">Affilated Pharmacies</a><br><br><br>
            <a href="updates.html">Updates</a><br><br><br>
        </nav>
    </div>
    <div class="container">
        <h1>Windsor Regional Hospital</h1>
        <br><br><br>
        <p><b>Feed Back Form</b></p>
        <?php
            if($insert == true) {
                echo "<p class = 'Submsg'>You successfully submited feedback form...<br>THANK YOU!!!</p>";
            }
        ?>
        <form action="index.php" method="post">
            <input type="text" name="name" id="name" placeholder="Enter your name" required>
            <input type="email" name="email" id="email" placeholder="Enter your email" required>
            <input type="text" name="contact" id="contact" placeholder="Enter your contact number" required>
            <textarea name="suggestions" id="suggestions" cols="50" rows="10" placeholder="Write your suggestions"></textarea>
            <button type="submit" class="btn">Submit</button>
        </form>
    </div>

</body>

</html>