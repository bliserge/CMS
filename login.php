 <?php
  include "include/connect.php";

  session_start();
  if (isset($_SESSION["name"])) {
    header("Location: index.php");
  } else {


    if (isset($_POST['submitbtn'])) {
      $type = $_POST['type'];
      $username = $_POST['user'];
      $pass = $_POST['pass'];

      $query = mysqli_query($db, "SELECT * FROM `user` WHERE username='$username' && password='$pass' && user_type='$type'");
      $res = mysqli_num_rows($query);
      $row = mysqli_fetch_array($query);

      if ($type == "engineer") {
        # code...
        if (mysqli_num_rows($query) == 1) {
          $_SESSION['name'] = $row['name'];
          $_SESSION['username'] = $row['username'];
          // echo 'OK  ';
          header("location: engineer_index.php");
        } else {
          echo 'User not regisstered';
        }
      } else if ($type == "customer") {
        # code...
        if (mysqli_num_rows($query) == 1) {
          $_SESSION['name'] = $row['name'];
          $_SESSION['username'] = $row['username'];
          // echo 'OK  ';
          header("location: index.php");
        } else {
          echo 'User not registered';
        }
      } else if ($type == "site manager") {
        # code...
        if (mysqli_num_rows($query) == 1) {
          $_SESSION['name'] = $row['name'];
          $_SESSION['username'] = $row['username'];
          // echo 'OK  ';
          header("location: site_manager_index.php");
        } else {
          echo 'User not registered';
        }
      } else {
        echo 'user not selected';
      }
    }
  ?>
   <!DOCTYPE html>
   <html lang="en">

   <head>

     <meta charset="utf-8">
     <meta http-equiv="X-UA-Compatible" content="IE=edge">
     <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
     <meta name="description" content="">
     <meta name="author" content="">

     <title>Login</title>
     <!-- Bootstrap core CSS-->
     <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">


     <!-- Custom fonts for this template-->
     <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">

     <!-- Custom styles for this template-->
     <link href="css/sb-admin.css" rel="stylesheet">

   </head>

   <body>

     <nav class="navbar navbar-expand navbar-dark bg-dark static-top">

       <b class="navbar-brand mr-1">CMS</b>

       <button class="btn btn-link btn-sm text-white order-1 order-sm-0" id="sidebarToggle" href="#">
         <i class="fas fa-bars"></i>
       </button>
       <!-- Navbar Search -->
       <form class="d-none d-md-inline-block form-inline ml-auto mr-0 mr-md-3 my-2 my-md-0">
         <div class="input-group" style="color: green">
           <?php
            $Today = date('d:m:y');
            $new = date('l, F d, Y', strtotime($Today));
            echo $new;
            ?>

         </div>
       </form>
       <!-- Navbar -->
       <ul class="navbar-nav ml-auto ml-md-0">

         <li class="nav-item dropdown no-arrow">
           <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Rwanda,
             <?php
              if (!isset($_SESSION['name'])) {
                # code...
                echo "";
              } else {
                echo "" . $_SESSION['name'];
              }
              ?>
             <i class="fas fa-user-circle fa-fw"></i>
           </a>
           <div class="dropdown-menu dropdown-menu-right" aria-labelledby="userDropdown">
             <a class="dropdown-item" href="#"><i class="fas fa-user-circle fa-fw"></i> <?php
                                                                                        if (!isset($_SESSION['name'])) {
                                                                                          # code...
                                                                                          echo "";
                                                                                        } else {
                                                                                          echo "" . $_SESSION['name'];
                                                                                        }
                                                                                        ?></a>
             <div class="dropdown-divider"></div>
             <a class="dropdown-item fas fa-sign-out-alt" href="#" data-toggle="modal" data-target="#logoutModal">Logout</a>
           </div>
         </li>
       </ul>

     </nav>

     <div id="wrapper">


   </body>

   </html>




   <div class="container">
     <div class="card card-login mx-auto mt-5">

       <div class="card-header">USER LOG IN</div>


       <div class="card-body">


         <form method="POST">


           <center>
             <h1><i class="fas fa-lock"></i></h1>
           </center><br><br>

           <!-- <div>
                          <input type="radio"  name="status" value="1" required="required" />Client
                          <input type="radio"  name="status"  value="2" required="required"/>Engineer
                          <input type="radio"  name="status"  value="3" required="required" />Site Manager
                       </div> -->

           <div>
             <select class="form-control" name="type" id="">
               <option> SELECT TYPE</option>
               <option value="engineer">engineer</option>
               <option value="customer">customer</option>
               <option value="site manager">site manager</option>
             </select>
           </div>
           <br>
           <div class="form-group">
             <div>
               <input type="text" id="inputEmail" class="form-control" name="user" placeholder="Username" required="required" autofocus="autofocus" />
             </div>
           </div>
           <div class="form-group">
             <div><input type="password" id="inputEmail" class="form-control" name="pass" required="required" placeholder="Password" />
             </div>
           </div>
           <input type="submit" name="submitbtn" class="btn btn-primary btn-block fas fa-key" value="Login">

         </form>
       </div>
     </div>
   </div>
   </div>


   </body>

   </html>
 <?php
  }

  include "include/footer.php";
  ?>