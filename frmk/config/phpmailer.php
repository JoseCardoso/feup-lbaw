<?php

require 'phpmailer/class.phpmailer.php';

$mail = new PHPMailer;

$mail->IsSMTP();                                      // Set mailer to use SMTP
$mail->SMTPDebug = 0;                                 // debugging: 1 = errors and messages, 2 = messages only
$mail->SMTPAuth = true;                               // authentication enabled
$mail->SMTPSecure = 'tls';                            // secure transfer enabled REQUIRED for GMail
$mail->Host = 'smtp.gmail.com';                       // Specify main and backup server
$mail->Port = 587;
$mail->Username = 'askfeup@gmail.com';      // SMTP username
$mail->Password = 'gF576kv0';              // SMTP password

