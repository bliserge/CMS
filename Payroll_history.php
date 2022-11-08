<?php
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
				<h2>Payroll History List</h2>
			</div>
			<!-- <div class="col">
				<form action="" method="post">
					<div class="row">

						<input type="submit" name="pay" class="btn btn-danger" style="margin-left: 5px;" value="Search">
					</div>
				</form>
			</div> -->
		</div>
		<div class="row">
			<div class="col">
				<div class="card">
					<div class="card-header">
						<strong class="card-title">All History</strong>
					</div>
					<div class="card-body">
						<table id="bootstrap-data-table" class="table table-striped table-bordered" width="100%" cellspacing="0">
							<thead>
								<tr class="border-0">
									<th>S/N</th>
									<th>Date</th>
									<th>Amount</th>
									<th>Number of employees</th>
								</tr>
							</thead>
							<tbody>
								<?php
								$today = date('Y-m-d');
								$query = "SELECT p.`id`, p.`amount`, date(p.`date_created`) as `date`, pr.`num` FROM payroll p JOIN (SELECT COUNT(id) as num, payroll_id FROM payroll_item GROUP BY payroll_id) pr ON pr.`payroll_id` = p.`id` ORDER BY date(p.`date_created`) DESC";
								$result = mysqli_query($db, $query) or die(mysqli_error($db));
								$a = 1;
								$totalAmount = 0;
								if ($result->num_rows == 0) {
									echo "<tr><td colspan='8'><center>No data Found</center>";
								} else {
									while ($row = mysqli_fetch_assoc($result)) {
										echo '<tr>';
										echo '<td>' . $a++ . '</td>';
										echo '<td><a href="Payroll_history.php?payrollId='. $row['id'] .'&date='.$row['date'].'">' . $row['date'] . '</a></td>';
										echo '<td>' . $row['amount'] . '</td>';
										echo '<td>' . $row['num'] . '</td>';
									}
								}
								?>
							</tbody>
						</table>
					</div>
				</div>
			</div>
			<?php
			if (isset($_GET['payrollId']) && !empty($_GET["payrollId"])) : ?>
				<div class="col">
					<div class="card">
						<div class="card-header">
							<div class="row">
								<div class="col-10">
									<strong class="card-title">Employees in payroll <?= isset($_GET['date']) ? 'of '.$_GET['date'] : '' ?></strong>
								</div>
								<a href="Payroll_history.php" class="btn btn-sm btn-danger">Close</a>
							</div>
						</div>
						<div class="card-body">
							<table id="bootstrap-data-table" class="table table-striped table-bordered" width="100%" cellspacing="0">
								<thead>
									<tr class="border-0">
										<th>S/N</th>
										<th>Name</th>
										<th>Activity</th>
										<th>Amount</th>
										<th>Status</th>
									</tr>
								</thead>
								<tbody>
									<?php
									$id = $_GET['payrollId'];
									$query2 = "SELECT e.*, act.`title` as activity, act.`price` as amount, if(`status` = 1 , 'Paid', 'unPaid') as `status` FROM employees e
											  JOIN activities act ON act.`id` = e.`position`
											  JOIN payroll_item pr ON pr.`emp_id` = e.`emp_id` 
											  WHERE pr.`payroll_id` ='$id'";
									$result2 = mysqli_query($db, $query2) or die(mysqli_error($db));
									$a = 1;
									if ($result2->num_rows == 0) {
										echo "<tr><td colspan='8'><center>No data Found</center>";
									} else {
										while ($rows = mysqli_fetch_assoc($result2)) {
											echo '<tr>';
											echo '<td>' . $a++ . '</td>';
											echo '<td>' . $rows['name'] . '</td>';
											echo '<td>' . $rows['activity'] . '</td>';
											echo '<td>' . $rows['amount'] . '</td>';
											echo '<td>' . $rows['status'] . '</td>';
										}
									}
									?>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			<?php endif; ?>
		</div>
	</div>
</div>