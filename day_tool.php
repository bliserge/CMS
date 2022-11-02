<?php
      
      include('include/connect.php');
       include('include/header.php');
         include('user/include/sidebar2.php')
        ?>
      
        
          <!-- DataTables Example -->
              <!-- DataTables Example -->
              <div id="content-wrapper">

        <div class="container-fluid">
           <h2>Daily stock data<a href="#" data-toggle="modal" data-target="#AddReq" class="btn btn-sm btn-info">Request</a></h2>
           <div class="card-body">
                <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                  <thead>
                    <tr>
                    <th>S/N</th>
                      <th>Tool(s)</th>
                      <th>Quantity</th>
                      <th>Date/Time out</th>
                      <th>Assigned Employee</th>
                      
                      </tr>
                        </thead>
                        <?php

                   $query = "SELECT * FROM stock";
                    $result = mysqli_query($db, $query) or die (mysqli_error($db));
                     $a=1;
                        while ($row = mysqli_fetch_assoc($result)) {
                                             
                              echo '<tr>';
                              echo '<td>'.$a++.'</td>';
                              echo '<td>'. $row['item_name'].'</td>';
                              echo '<td>'. $row['quantity'].' '.$row['measure'].'</td>';
                              echo '<td>'. $row['out_date'].'</td>';
                              echo '<td>'. $row['employee_name'].'</td>';
                               
                               
                              
                         } ?>


                  <div id="AddReq" class="modal fade" role="dialog">
              <div class="modal-dialog">

                <!-- Modal content-->
                <div class="modal-content" style="width: 130%">
                  <div class="modal-header"><h3>Add New Item</h3>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                  </div>
                  <div class="modal-body">
               
                  
                       

                          <form method="POST" action="#">
                            <div class="form-group">
                            <div class="form-label-group">
                           
                            <p>Tool name</p>
                           
                            <select style="margin-left:px;" name="name" class="form-control">
                            <option>-----Select Any Tool--- </option>
                            <?php

                           $query = "SELECT * FROM item";
                           $result = mysqli_query($db, $query) or die (mysqli_error($db));
                            while ($row = mysqli_fetch_assoc($result)) { ?>
                          <option><?php echo $row['item_name'];?> </option>
                          <?php }?>
                          </select>                    
                            </div>
                            </div>


                            <div class="form-group">
                            <div class="form-label-group">
                            <input type="number" id="inputAge" class="form-control" placeholder="Age" name="quantity" required>
                            <label for="inputAge">Quantity</label>
                            </div>
                            </div>

                            <div class="form-group">
                            <div class="form-label-group">
                           
                            <p>Measurement</p>
                           
                            <select style="margin-left:px;witdh:30px;" name="measure" required class="form-control">
                            <option>-----Select measure--- </option>
                            <?php

                           $query = "SELECT * FROM measure";
                           $result = mysqli_query($db, $query) or die (mysqli_error($db));
                            while ($row = mysqli_fetch_assoc($result)) { ?>
                          <option ><?php echo $row['name'];?> </option>
                          <?php }?>
                          </select>                    
                            </div>
                            </div>

                            <div class="form-group">
                            <div class="form-label-group">
                           
                            <p>Assigned Employee</p>
                           
                            <select style="margin-left:px;witdh:30px;" name="employee" required class="form-control">
                            <option>-----Select Employee</option>
                            <?php

                           $query = "SELECT * FROM employees";
                           $result = mysqli_query($db, $query) or die (mysqli_error($db));
                            while ($row = mysqli_fetch_assoc($result)) { ?>
                          <option><?php echo $row['name'];?> </option>
                          <?php }?>
                          </select>                    
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
  $qty = $_POST['quantity'];
  $ms = $_POST['measure'];
  $emp = $_POST['employee'];
  

  date_default_timezone_set("Asia/Manila"); 
  $date1 = date("Y-m-d H:i:s");
   
  $sql="SELECT * FROM item WHERE status='1' ";
  $query=mysqli_query($db,$sql);
  $row=mysqli_fetch_array($query);
 
   



  

          $remarks="Item $name withdrown from stock";  
          $query = "INSERT INTO stock(item_name,quantity,measure,employee_name) VALUES ('".$name."','".$qty."','".$ms."','".$emp."')";
          $res=mysqli_query($db,$query)or die (mysqli_error($db));

               if($res=mysqli_num_rows($db,$query)== 1){          



      mysqli_query($db,"INSERT INTO logs(action,date_time) VALUES('$remarks','$date1')")or die(mysqli_error($db));

                ?>
                <script type="text/javascript">
      alert("Item Added Successfully!.");
      window.location = "day_tool.php";
    </script>
    <?php
}

}

              include('include/scripts.php');
       include('include/footer.php');
       
        ?>            
                     
