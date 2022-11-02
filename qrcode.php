<?php
include('include/connect.php');
include('include/header.php');
include('user/include/sidebar2.php');
?>
<html>

<head>
    <meta charset="utf-8">
    
    <title>QR Code Generator</title>
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <script type="text/javascript" src="js/qrcode.js"></script>

</head>

<body>
  <div class="row">
    <div class="col-md-8 offset-md-2">
      <div class="card">
      <div class="card-header bg">
        <h1>QR Code Generator</h1>

      </div>
          <div class="card-body">
          <form onsubmit="generate();return false;">
          <input type="text" id="qr" class="form-control"><br><br>
        <input type="submit"  class="btn btn-primary" value="Generate QRCode">
</form>

<div id="qrResult" style="height:300px; width:1000px"></div>
          </div>
      </div>
    </div>
  </div>	
  <script type="text/javascript">
    var qrcode= new QRCode(document.getElementById('qrResult'),{
    width:200,
    height:200
    });

    function generate(){
      var message = document.getElementById('qr');
      qrcode.makeCode(message.value);
    }
  </script>
    <script src="assets/js/jquery.min.js"></script>
    <script src="assets/bootstrap/js/bootstrap.min.js"></script>
</body>

</html>
<?php

include('include/footer.php');

?>