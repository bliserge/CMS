<?php
include('include/connect.php');
include('include/header.php');
include('user/include/sidebar2.php')

?>

<div id="content-wrapper">

  <div class="container-fluid">
    <h2>List of item(s)<a href="#" data-toggle="modal" data-target="#AddEmployee" class="btn btn-sm btn-info">Add New</a></h2>
    <div class="card-body">
      <div class="table-responsive">
        <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
          <thead>
            <tr>

              <th>Item Name</th>
              <th>Quantity</th>
              <th>cost</th>
              <th>total</th>
              <th>Date</th>
              <th>Options</th>
            </tr>
          </thead>

          <?php

          $query = "SELECT * FROM item";
          $result = mysqli_query($db, $query) or die(mysqli_error($db));

          while ($row = mysqli_fetch_assoc($result)) {

            echo '<tr>';
            echo '<td>' . $row['item_name'] . '</td>';
            echo '<td>' . $row['quantity'] . '</td>';
            echo '<td>' . $row['cost'] . '</td>';
            echo '<td>' . $row['total'] . '</td>';
            echo '<td>' . $row['date'] . '</td>';
            echo " ";
            echo '<td><a type="button" class="btn btn-sm btn-warning fa fa-edit fw-fa" href="#" data-toggle="modal" data-target="#UpdateEmployee' . $row['item_id'] . '">Add Value</a>';
          ?>
            <div id="UpdateEmployee<?php echo $row['item_id']; ?>" class="modal fade" role="dialog">
              <div class="modal-dialog">

                <!-- Modal content-->
                <div class="modal-content" style="width: 130%">
                  <div class="modal-header">
                    <h3>Modify Employee</h3>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                  </div>
                  <div class="modal-body">


                    <form method="POST" action="#">
                      <div class="form-group">
                        <div class="form-label-group">
                          <input type="text" id="inputName1" class="form-control" placeholder="Name" name="name" value="<?php echo $row['item_name']; ?>" autofocus="autofocus" required>
                          <input type="hidden" id="inputName1" class="form-control" name="id" value="<?php echo $row['item_id']; ?>" autofocus="autofocus" required>
                          <label for="inputName1">Name</label>
                        </div>
                      </div>
                      <div class="form-group">
                        <div class="form-label-group">
                          <input type="number" id="inputAge1" class="form-control" placeholder="Age" name="quantity" value="<?php echo $row['quantity']; ?>" required>
                          <label for="inputAge1">Quantity</label>
                        </div>
                      </div>
                      <div class="form-group">
                        <div class="form-label-group">
                          <input type="text" id="inputAddress1" class="form-control" placeholder="Address" value="<?php echo $row['cost']; ?>" name="cost" required>
                          <label for="inputAddress1">Cost</label>
                        </div>
                      </div>
                      <div class="form-group">
                        <div class="form-label-group">
                          <input type="text" id="inputContact1" class="form-control" placeholder="Contact Number" value="<?php echo $row['total']; ?>" name="total" required>
                          <label for="inputContact1">Total</label>
                        </div>
                      </div>




                      <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">
                          Close
                          <span class="glyphicon glyphicon-remove-sign"></span>
                        </button>
                        <input type="submit" name="update" value="Update" class="btn btn-success">
                      </div>
                    </form>

                  </div>
                </div>
              </div>
            </div>
            <?php

            if (isset($_POST['update'])) {
              $id = $_POST['id'];
              $name = $_POST['name'];
              $qty = $_POST['quantity'];
              $cs = $_POST['cost'];
              $am = $_POST['total'];
              $dt = $_POST['date'];


              date_default_timezone_set("Asia/Manila");
              $date1 = date("Y-m-d H:i:s");

              $remarks = "Item $name was updated";
              $query = "UPDATE `item` SET `item_name`='$name',`quantity`='$qty',`cost`='$cs',`total`='$am',`date`='$dt' WHERE `item_id`='$id'";
              mysqli_query($db, $query) or die(mysqli_error($db));
              mysqli_query($db, "INSERT INTO logs(action,date_time) VALUES('$remarks','$date1')") or die(mysqli_error($db));

            ?>
              <script type="text/javascript">
                alert("Item Updated Successfully!.");
                window.location = "Item.php";
              </script>
          <?php
            }
            echo '</td> ';
            echo '</tr> ';
          }

          ?>

        </table>
      </div>
    </div>
    <div id="AddEmployee" class="modal fade" role="dialog">
      <div class="modal-dialog">

        <!-- Modal content-->
        <div class="modal-content" style="width: 130%">
          <div class="modal-header">
            <h3>Add New Item</h3>
            <button type="button" class="close" data-dismiss="modal">&times;</button>
          </div>
          <div class="modal-body">


            <form method="POST" action="#">
              <div class="form-group">
                <div class="form-label-group">
                  <input type="text" id="inputName" class="form-control" placeholder="Name" name="name" autofocus="autofocus" required>
                  <label for="inputName">Name</label>
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
                  <input type="text" id="inputAddress" class="form-control" placeholder="Address" name="cost" required>
                  <label for="inputAddress">Cost/Unit</label>
                </div>
              </div>
              <div class="form-group">
                <div class="form-label-group">
                  <input type="text" id="inputContact" class="form-control" placeholder="Contact Number" name="total" required>
                  <label for="inputContact">Total</label>
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
    if (isset($_POST['submit'])) {
      $name = $_POST['name'];
      $qty = $_POST['quantity'];
      $cs = $_POST['cost'];
      $am = $_POST['total'];


      date_default_timezone_set("Asia/Manila");
      $date1 = date("Y-m-d H:i:s");

      $sql = "SELECT* FROM item WHERE item_name=' $name'AND quantity='$qty' AND cost='$cs'";
      $res = mysqli_query($db, $sql);
      $row = mysqli_num_rows($res);
      if ($row > 0) {

    ?>
        <script type="text/javascript">
          window.alert('Data Already inserted');
        </script>


      <?php

      } else {



        $remarks = "Item $name was Added";
        $query = "INSERT INTO item(item_name,quantity,cost,total)
                VALUES ('" . $name . "','" . $qty . "','" . $cs . "','" . $am . "')";
        mysqli_query($db, $query) or die(mysqli_error($db));
        mysqli_query($db, "INSERT INTO logs(action,date_time) VALUES('$remarks','$date1')") or die(mysqli_error($db));

      ?>
        <script type="text/javascript">
          alert("Item Added Successfully!.");
          window.location = "Item.php";
        </script>
    <?php

      }
    }

    include('include/scripts.php');
    include('include/footer.php');

    ?>