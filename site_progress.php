<?php
       include('include/connect.php');
       include('include/header.php');
       include('include/sidebar1.php');
       
       
        ?>
<div id="content-wrapper">

        <div class="container-fluid">
 <h2>Site Progress <a href="#" data-toggle="modal" data-target="#AddEmployee" class="btn btn-sm btn-info">Add New Picture</a></h2> 
      
 <?php


// Get images from the database
$query = $db->query("SELECT * FROM image ORDER BY uploaded_on DESC");

if($query->num_rows > 0){
    while($row = $query->fetch_assoc()){
        $imageURL = 'uploads/'.$row["file_name"];
?>
    <img src="<?php echo $imageURL; ?>" alt="" />
<?php }
}else{ ?>
    <p>No image(s) found...</p>
<?php } ?>
 
 
   

              <div id="AddEmployee" class="modal fade" role="dialog">
              <div class="modal-dialog">

                <!-- Modal content-->
                <div class="modal-content" style="width: 130%">
                  <div class="modal-header"><h3>Upload New Picture</h3>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                  </div>
                  <div class="modal-body">
                      
                        
                          <form method="POST" action="upload.php"  enctype="multipart/form-data">
                            <div class="form-group">
                            <div class="form-label-group">
                            <input type="text" id="inputName" class="form-control" placeholder="Name" name="file" autofocus="autofocus" required>
                            <label for="inputName">title</label>
                            </div>
                            </div>

                            

                            <div class="form-group">
                            <div class="form-label-group">
                            <input type="file" id="inputAge" class="form-control" placeholder="image" name="file" required>
                            <label for="inputAge">Picture</label>
                            </div>
                            </div>
                            
                            
                            
                          
                 
                  <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">
                      Close
                      <span class="glyphicon glyphicon-remove-sign"></span>
                    </button>
                    <input type="submit" name="submit" value="Save" class="btn btn-success">
                  </div>
                  </form>
               
</div>
</div>
              </div>
            </div>
              <?php
if(isset($_POST['submit'])){
  $name = $_POST['name'];
  $age = $_POST['age'];
  $add = $_POST['add'];
  $contact = $_POST['contact'];
  $position = $_POST['position'];

  date_default_timezone_set("Asia/Manila"); 
  $date1 = date("Y-m-d H:i:s");

 $remarks="employee $name was Added";  
  $query = "INSERT INTO employees(name,age,address,contact_number,position)
                VALUES ('".$name."','".$age."','".$add."','".$contact."','".$position."')";
                mysqli_query($db,$query)or die (mysqli_error($db));
  mysqli_query($db,"INSERT INTO logs(action,date_time) VALUES('$remarks','$date1')")or die(mysqli_error($db));

                ?>
                <script type="text/javascript">
      alert("New Employee Added Successfully!.");
      window.location = "employees.php";
    </script>
    <?php
}

              include('include/scripts.php');
       include('include/footer.php');
       
        ?>