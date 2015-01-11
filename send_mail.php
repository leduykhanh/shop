<?php
$to = "leejangkoo@gmail.com";
$subject = "Test mail";
$message = "Hello! This is a simple email message.";
$from = "ledu0003@e.ntu.edu.sg";
$headers = "From:" . $from;
mail($to,$subject,$message,$headers);
echo "Mail Sent.";
?>