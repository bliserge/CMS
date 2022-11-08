<?php

use LDAP\Result;

include('include/connect.php');
include('include/header.php');
include('user/include/sidebar2.php')
?>

<style>
  .actionIn {
    border: 1px solid green !important;
    padding: 5px 20px 5px 20px !important;
    border-radius: 5px !important;
    min-width: 20px !important;
  }

  .actionOut {
    border: 1px solid red !important;
    padding: 5px 20px 5px 20px !important;
    border-radius: 5px !important;
    min-width: 20px !important;
  }
</style>

<!-- DataTables Example -->
<!-- DataTables Example -->
<div id="content-wrapper">

  <div class="container-fluid">
    <div class="row">
      <div class="col col-8">
        <h2>Payroll List</h2>
      </div>
      <div class="col">
        <div class="row">
          <a href="Payroll_history.php" class="btn btn-success">Payroll History</a>
          <form action="" method="post">
            <input type="submit" name="pay" class="btn btn-danger" style="margin-left: 5px;" value="Dispatch">
          </form>
        </div>
      </div>
    </div>
    <div class="card-body">
      <div class="table-responsive">
        <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
          <thead>
            <tr>
              <th>S/N</th>
              <th>Employee Name</th>
              <th>Phone Number</th>
              <th>Amount</th>
              <th>Date</th>
              <th>TimeIn</th>
              <th>TimeOut</th>
              <!-- <th>Action</th> -->
            </tr>
          </thead>
          <tbody>
            <?php
            $today = date('Y-m-d');
            $query = "SELECT e.*, att.`logdate` as `date`, att.`timeIn`, att.`timeOut`,act.`title` as activity, act.`price` as amount, att.`att_id` FROM employees e 
              JOIN attendance att ON att.`emp_id` = e.`emp_id`
            JOIN activities act ON act.`id` = e.`position`
            WHERE att.`timeIn` IS NOT NULL AND att.`timeOut` IS NOT NULL AND `status` = 1 AND logdate ='$today'";
            $result = mysqli_query($db, $query) or die(mysqli_error($db));
            $a = 1;
            $totalAmount = 0;
            if ($result->num_rows == 0) {
              echo "<tr><td colspan='8'><center>No data Found</center>";
            } else {
              while ($row = mysqli_fetch_assoc($result)) {
                $totalAmount += $row['amount'];
                echo '<tr>';
                echo '<td>' . $a++ . '</td>';
                echo '<td>' . $row['name'] . '</td>';
                echo '<td>' . $row['contact_number'] . '</td>';
                echo '<td>' . $row['amount'] . '</td>';
                echo '<td>' . $row['date'] . '</td>';
                echo '<td>' . $row['timeIn'] . '</td>';
                echo '<td>' . $row['timeOut'] . '</td>';
                // echo '<td></td>';
              }
            }
            if (isset($_POST["pay"])) {
              $query2 = "SELECT e.*, att.`logdate` as `date`, att.`timeIn`, att.`timeOut`,act.`title` as activity, act.`price` as amount, att.`att_id` FROM employees e 
              JOIN attendance att ON att.`emp_id` = e.`emp_id`
              JOIN activities act ON act.`id` = e.`position`
              WHERE att.`timeIn` IS NOT NULL AND att.`timeOut` IS NOT NULL AND `status` = 1 AND logdate ='$today'";
              $result2 = mysqli_query($db, $query2) or die(mysqli_error($db));
              if ($result->num_rows == 0) { ?>
                <script type="text/javascript">
                  alert("Payroll has no data! Contact system admin if you think this is error");
                </script>
              <?php } else {
                $payrollRes = mysqli_query($db, "INSERT INTO payroll(amount,`status`,`date_created`) VALUES ('$totalAmount',0,'" . date('Y-m-d h:i:s') . "')") or die(mysqli_error($db));
                $payrollId = mysqli_query($db, "SELECT MAX(id) as id FROM payroll") or die(mysqli_error($db));
                $id = mysqli_fetch_assoc($payrollId);
                while ($rows = mysqli_fetch_assoc($result2)) {
                  $emp_id = $rows['emp_id'];
                  $att_id = $rows['att_id'];
                  $amout = $rows['amount'];
                  $payId = $id['id'];
                  $res = mysqli_query($db, "INSERT INTO `payroll_item`(`payroll_id`, `emp_id`, `att_id`, `salary`, `Date_created`) VALUES ('$payId','$emp_id','$att_id','$amout','" . date('Y-m-d h:i:s') . "')") or die(mysqli_error($db));
                  if ($res) {
                    $res = mysqli_query($db, "UPDATE `attendance` SET `status` = 2 WHERE att_id = $att_id") or die(mysqli_error($db));
                  }
                }
              ?>
                <script type="text/javascript">
                  window.location.reload()
                </script>
            <?php
              }
            } ?>

          </tbody>
        </table>
      </div>
    </div>
  </div>
</div>
<?php
include('include/scripts.php');
include('include/footer.php');

?>