<?php
include_once '../includes/inc_config.php'; //Making paging validation	
include_once $inc_nocache; //Clearing the cache information
include_once $adm_session; //checking for session
include_once $inc_cnctn; //Making database Connection
include_once $inc_usr_fnctn; //checking for session	
include_once $inc_pgng_fnctns; //Making paging validation
include_once $inc_fldr_pth; //Making paging validation
/***************************************************************
Programm : view_detail_ordsts.php	
Purpose : For Viewing Order Status Details
Created By : Bharath
Created On : 16-02-2022
Modified By : 
Modified On :
Purpose : 
Company : Adroit
************************************************************/
global $id,$pg,$countstart;
$rd_crntpgnm = "view_all_ordsts.php";
$rd_edtpgnm = "edit_ordsts.php";
$clspn_val = "4";
/*****header link********/
$pagemncat = "Setup";
$pagecat = "Order Status";
$pagenm = "Order Status";
/*****header link********/
if(isset($_REQUEST['vw']) && (trim($_REQUEST['vw'])!="") && isset($_REQUEST['pg']) && (trim($_REQUEST['pg'])!="") && isset($_REQUEST['countstart']) && (trim($_REQUEST['countstart'])!=""))
{
	$id = glb_func_chkvl($_REQUEST['vw']);
	$pg = glb_func_chkvl($_REQUEST['pg']);
	$countstart = glb_func_chkvl($_REQUEST['countstart']);
	$srchval = glb_func_chkvl($_REQUEST['val']);
	$chk = glb_func_chkvl($_REQUEST['chk']);
}
$sqryordsts_mst="SELECT ordstsm_id, ordstsm_name, ordstsm_prty, ordstsm_desc, if(ordstsm_sts = 'a', 'Active','Inactive') as ordstsm_sts from ordsts_mst where ordstsm_id = $id";
$srsordsts_mst = mysqli_query($conn,$sqryordsts_mst);
$rowsordsts_mst = mysqli_fetch_assoc($srsordsts_mst);
$loc= "&val=$srchval";
if($chk !='')
{
	$loc .="&chk=y";
}
if(isset($_REQUEST['sts']) && (trim($_REQUEST['sts']) == "y"))	
{
	$msg = "<center><font color=red>Record updated successfully</font></center>";
}
elseif(isset($_REQUEST['sts']) && (trim($_REQUEST['sts']) == "n"))
{
	$msg = "<center><font color=red>Record not updated</font></center>";
}
elseif(isset($_REQUEST['sts']) && (trim($_REQUEST['sts']) == "d"))
{
	$msg = "<center><font color=red>Duplicate Recored Name Exists & Recor</center>d Not updated</font>";
}
?>
<script language="javascript">
function update1() //for update download details
{
	document.frmedtordstsid.action="<?php echo $rd_edtpgnm;?>?vw=<?php echo $id;?>&pg=<?php echo $pg;?>&countstart=<?php echo $countstart.$loc;?>";
	document.frmedtordstsid.submit();
}
</script>
<?php 
include_once $inc_adm_hdr;
include_once $inc_adm_lftlnk;
?>
<section class="content">
	<div class="content-header">
		<div class="container-fluid">
			<div class="row mb-2">
				<div class="col-sm-6">
					<h1 class="m-0 text-dark">View Order Status</h1>
				</div><!-- /.col -->
				<div class="col-sm-6">
					<ol class="breadcrumb float-sm-right">
						<li class="breadcrumb-item"><a href="#">Home</a></li>
						<li class="breadcrumb-item active">View Order Status</li>
					</ol>
				</div><!-- /.col -->
			</div><!-- /.row -->
		</div><!-- /.container-fluid -->
	</div>
	<form name="frmedtordstsid" id="frmedtordstsid" method="post" action="<?php $_SERVER['PHP_SELF'];?>" onSubmit="return performCheck('frmedtordstsid', rules, 'inline');">
		<input type="hidden" name="hdnordstsid" value="<?php echo $id;?>">
		<input type="hidden" name="hdnpage" value="<?php echo $pg;?>">
		<input type="hidden" name="hdncnt" value="<?php echo $countstart?>">
		<?php
		if($msg !='')
		{
	 		echo "<tr bgcolor='#FFFFFF'>
				<td colspan='4' bgcolor='#F3F3F3' align='center'><strong>$msg</strong></td> 
			 </tr>";
		}
		?>
		<div class="card">
			<div class="card-body">
				<div class="row justify-content-center">
					<div class="col-md-12">
						<div class="form-group row">
							<label for="txtname" class="col-sm-2 col-md-2 col-form-label">Name</label>
							<div class="col-sm-8">
								<?php echo $rowsordsts_mst['ordstsm_name'];?>
							</div>
						</div>
						<div class="form-group row">
							<label for="txtname" class="col-sm-2 col-md-2 col-form-label">Description</label>
							<div class="col-sm-8">
								<?php echo $rowsordsts_mst['ordstsm_desc'];?>
							</div>
						</div>
						<div class="form-group row">
							<label for="txtname" class="col-sm-2 col-md-2 col-form-label">Rank</label>
							<div class="col-sm-8">
								<?php echo $rowsordsts_mst['ordstsm_prty'];?>
							</div>
						</div>
						<div class="form-group row">
							<label for="txtname" class="col-sm-2 col-md-2 col-form-label">Status</label>
							<div class="col-sm-8"> 
								<?php echo $rowsordsts_mst['ordstsm_sts'];?>
							</div>
						</div>
						<p class="text-center">
							<input type="Submit" class="btn btn-primary btn-cst" name="frmedtordstsid" id="frmedtordstsid" value="Edit" 
							onclick="update1()">
							&nbsp;&nbsp;&nbsp;
							<input type="button" name="btnBack" value="Back" class="btn btn-primary btn-cst" onclick="location.href='<?php echo $rd_crntpgnm;?>?<?php echo $loc;?>'">
						</p>
					</div>
				</div>
			</div>
		</div>
	</form> 
</section>
<?php include_once "../includes/inc_adm_footer.php";?>