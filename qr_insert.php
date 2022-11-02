<?php
include('include/connect.php');

if(isset($_POST['text'])){
$voice= new com("SAPI.SpVoice");
$text=$_POST['text'];
$date=date('Y-m-d');
$time = date('H:i:s');
$message="Hi".$text."Your Attendence has been successfully added Thank you";
$timeout="Hi".$text."Your Attendence has been successfully added Good bye";
    



     $sql= "SELECT*FROM attendance WHERE name='$text' AND logdate='$date' AND status='0'";
     $query=mysqli_query($db,$sql);
     $res=mysqli_num_rows($query);
     
     if($res>0){

       $sql= "UPDATE attendance SET name='$text',Timeout='$time',status='1' WHERE name='$text' AND logdate='$date'";
      $query=mysqli_query($db,$sql);
     $voice->speak($timeout);
}

          else{

      $sql="INSERT INTO attendance(logdate,name,Timein,status) VALUES ('$date','$text','$time','0')";
      if($res=mysqli_query($db,$sql)=== TRUE){
      $voice->speak($message);
      } else  {
        echo "not";
            }
         }
      }


   else {
     echo "not";
         }

header("location:attendence.php");




?>