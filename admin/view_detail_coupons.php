<?php
include_once '../includes/inc_config.php'; //Making paging validation	
include_once $inc_nocache; //Clearing the cache information
include_once $adm_session; //checking for session
include_once $inc_cnctn; //Making database Connection
include_once $inc_usr_fnctn; //checking for session	
include_once $inc_pgng_fnctns; //Making paging validation
include_once $inc_fldr_pth; //Making paging validation
/***************************************************************
Programm : view_detail_coupons.php	
Purpose : For Viewing Coupon Details
Created By : Lokesh palagani
Created On : 27-05-2023
Modified By : 
Modified On :
Purpose : 
Company : Adroit
************************************************************/
global $id,$pg,$countstart;
$rd_crntpgnm = "view_all_coupons.php";
$rd_edtpgnm = "edit_coupons.php";
$clspn_val = "4";
/*****header link********/
$pagemncat = "Setup";
$pagecat = "Coupons";
$pagenm = "Coupons";
/*****header link********/
if(isset($_REQUEST['vw']) && (trim($_REQUEST['vw'])!="") && isset($_REQUEST['pg']) && (trim($_REQUEST['pg'])!="") && isset($_REQUEST['countstart']) && (trim($_REQUEST['countstart'])!=""))
{
	$id = glb_func_chkvl($_REQUEST['vw']);
	$pg = glb_func_chkvl($_REQUEST['pg']);
	$countstart = glb_func_chkvl($_REQUEST['countstart']);
	$srchval = glb_func_chkvl($_REQUEST['val']);
	$chk = glb_func_chkvl($_REQUEST['chk']);
}
 $sqrycpn_mst="SELECT cpnm_id, cpnm_cde, cpnm_name, cpnm_applon, cpnm_cat, cpnm_scat, cpnm_brnd, cpnm_aptyp, cpnm_ntamttyp, cpnm_ntamt, cpnm_memtyp, cpnm_mbrm_id, cpnm_usetyp, cpnm_uselmt, cpnm_disctyp, cpnm_discamt, cpnm_discper, cpnm_exdt, cpnm_desc, cpnm_odr_cntaply, cpnm_odr_apltyp, cpnm_odr_discper, cpnm_prty, if(cpnm_sts = 'a', 'Active','Inactive') as cpnm_sts from cpn_mst where cpnm_id = $id";
$srscpn_mst = mysqli_query($conn,$sqrycpn_mst);
$rowscpn_mst = mysqli_fetch_assoc($srscpn_mst);
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
	document.frmedtcpnid.action="<?php echo $rd_edtpgnm;?>?vw=<?php echo $id;?>&pg=<?php echo $pg;?>&countstart=<?php echo $countstart.$loc;?>";
	document.frmedtcpnid.submit();
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
					<h1 class="m-0 text-dark">View Coupons</h1>
				</div><!-- /.col -->
				<div class="col-sm-6">
					<ol class="breadcrumb float-sm-right">
						<li class="breadcrumb-item"><a href="#">Home</a></li>
						<li class="breadcrumb-item active">View Coupons</li>
					</ol>
				</div><!-- /.col -->
			</div><!-- /.row -->
		</div><!-- /.container-fluid -->
	</div>
	<form name="frmedtcpnid" id="frmedtcpnid" method="post" action="<?php $_SERVER['PHP_SELF'];?>" onSubmit="return performCheck('frmedtcpnid', rules, 'inline');">
		<input type="hidden" name="hdncpnid" value="<?php echo $id;?>">
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
							<label for="txtname" class="col-sm-2 col-md-2 col-form-label">Code</label>
							<div class="col-sm-8">
								<?php echo $rowscpn_mst['cpnm_cde'];?>
							</div>
						</div>
						<div class="form-group row">
							<label for="txtname" class="col-sm-2 col-md-2 col-form-label">Name</label>
							<div class="col-sm-8">
								<?php echo $rowscpn_mst['cpnm_name'];?>
							</div>
						</div>
						<?php
						if ($rowscpn_mst['cpnm_applon'] == 1)
						{
							$appl_on = "Category Level";
						}
						elseif ($rowscpn_mst['cpnm_applon'] == 2)
						{
							$appl_on = "Tyre Brand";
						}
						else
						{
							$appl_on = "NA";
						}
						?>
						<div class="form-group row">
							<label for="txtname" class="col-sm-2 col-md-2 col-form-label">Applied on</label>
							<div class="col-sm-8">
								<?php echo $appl_on; ?>
							</div>
						</div>
						<?php
						if ($rowscpn_mst['cpnm_applon'] == 1)
						{ 
							if ($rowscpn_mst['cpnm_cat'] == 0)
							{
								$cat_name = "All";
							}
							else
							{
								$cat_id = $rowscpn_mst['cpnm_cat'];
								$sqry_cat_mst = "SELECT prodcatm_name from prodcat_mst where prodcatm_id = $cat_id";
								$srscat_mst = mysqli_query($conn,$sqry_cat_mst);
								$rowscat_mst = mysqli_fetch_assoc($srscat_mst);
								$cat_name = $rowscat_mst['prodcatm_name'];
							}
							?>
							<div class="form-group row">
								<label for="cat" class="col-sm-2 col-md-2 col-form-label">Category</label>
								<div class="col-sm-8">
									<?php echo $cat_name; ?>
								</div>
							</div>
							<?php
							if ($rowscpn_mst['cpnm_scat'] == 0)
							{
								$scat_name = "All";
							}
							else
							{
								$scat_id = $rowscpn_mst['cpnm_scat'];
								$sqry_scat_mst = "SELECT prodscatm_name from prodscat_mst where prodscatm_id = $scat_id";
								$srsscat_mst = mysqli_query($conn,$sqry_scat_mst);
								$rowsscat_mst = mysqli_fetch_assoc($srsscat_mst);
								$scat_name = $rowsscat_mst['prodscatm_name'];
							}
							?>
							<div class="form-group row">
								<label for="scat" class="col-sm-2 col-md-2 col-form-label">Subcategory</label>
								<div class="col-sm-8">
									<?php echo $scat_name;?>
								</div>
							</div>
							<?php
						}
						elseif ($rowscpn_mst['cpnm_applon'] == 2)
						{ 
							if ($rowscpn_mst['cpnm_brnd'] == 0)
							{
								$brnd_name = "All";
							}
							else
							{	 
								// tyre brand details
								$brnd_id = $rowscpn_mst['cpnm_brnd'];
							 $sqry_brnd_mst = "SELECT tyrbrndm_name from tyr_brnd_mst where tyrbrndm_id = $brnd_id";
								$srsbrnd_mst = mysqli_query($conn,$sqry_brnd_mst);
								$rowsbrnd_mst = mysqli_fetch_assoc($srsbrnd_mst);
								$brnd_name = $rowsbrnd_mst['tyrbrndm_name'];
							}
							?>
							<div class="form-group row">
								<label for="brand" class="col-sm-2 col-md-2 col-form-label">Brand</label>
								<div class="col-sm-8">
									<?php echo $brnd_name; ?>
								</div>
							</div>
							<?php
						}
						else
						{
							
						}
						?>
						<div class="form-group row">
							<label for="brand" class="col-sm-2 col-md-2 col-form-label">Applicable Type</label>
							<div class="col-sm-8">
								<?php
								if ($rowscpn_mst['cpnm_aptyp'] == 1)
								{
									$appl_typ = "Product Price";
								}
								elseif ($rowscpn_mst['cpnm_aptyp'] == 2)
								{
									$appl_typ = "Net Price";
								}
								elseif ($rowscpn_mst['cpnm_aptyp'] == 3)
								{
									$appl_typ = "Shipping Price";
								}
								echo $appl_typ;
								?>
							</div>
						</div>
						<div class="form-group row">
							<label for="netamtbse" class="col-sm-2 col-md-2 col-form-label">Net Amount Base</label>
							<div class="col-sm-8">
								<?php
								if ($rowscpn_mst['cpnm_ntamttyp'] == 'y')
								{
									$ntamtbs = 'Yes';
								}
								else
								{
									$ntamtbs = 'No';
								}
								echo $ntamtbs;
								?>
							</div>
						</div>
						<?php
						if ($rowscpn_mst['cpnm_ntamttyp'] == 'y')
						{ ?>
							<div class="form-group row">
								<label for="ntamt" class="col-sm-2 col-md-2 col-form-label">Net Amount</label>
								<div class="col-sm-8">
									<?php echo $rowscpn_mst['cpnm_ntamt'];?>
								</div>
							</div>
							<?php
						}
						?>
						<div class="form-group row">
							<label for="usrtyp" class="col-sm-2 col-md-2 col-form-label">User Type</label>
							<div class="col-sm-8">
								<?php
								if ($rowscpn_mst['cpnm_usetyp'] == 'au')
								{
									$usrtyp = "All Users";
								}
								elseif($rowscpn_mst['cpnm_usetyp'] == 's')
								{
									$usrtyp = "Single User";
								}
								elseif($rowscpn_mst['cpnm_usetyp'] == 'nu')
								{
									$usrtyp = "New User";
								}
								else
								{
									$usrtyp = "";
								}
								echo $usrtyp;
								?>
							</div>
						</div>
						<?php
						if ($rowscpn_mst['cpnm_usetyp'] != '')
						{ ?>
							<div class="form-group row">
								<label for="users" class="col-sm-2 col-md-2 col-form-label">Users</label>
								<div class="col-sm-8">
									<?php
									if ($rowscpn_mst['cpnm_mbrm_id'] == 0)
									{
										$users = "All";
									}
									else
									{
										$mbrid = $rowscpn_mst['cpnm_mbrm_id'];
									 $sqry_mbr_mst = "SELECT mbrm_name, mbrm_emailid from mbr_mst where mbrm_id = $mbrid";
										$srsmbr_mst = mysqli_query($conn,$sqry_mbr_mst);
										$rowsmbr_mst = mysqli_fetch_assoc($srsmbr_mst);
										$users = $rowsmbr_mst['mbrm_name']." (".$rowsmbr_mst['mbrm_emailid'].")";
									}
									echo $users;
									?>
								</div>
							</div>
							<?php
						}
						?>
						<div class="form-group row">
							<label for="use" class="col-sm-2 col-md-2 col-form-label">Use</label>
							<div class="col-sm-8">
								<?php
								if($rowscpn_mst['cpnm_usetyp'] == 1)
								{
									$use = "Single time";
								}
								elseif ($rowscpn_mst['cpnm_usetyp'] == 2)
								{
									$use = "Every time";
								}
								echo $use;
								?>
							</div>
						</div>
						<div class="form-group row">
							<label for="usagelimit" class="col-sm-2 col-md-2 col-form-label">Usage Limit</label>
							<div class="col-sm-8">
								<?php echo $rowscpn_mst['cpnm_uselmt']; ?>
							</div>
						</div>
						<div class="form-group row">
							<label for="disctyp" class="col-sm-2 col-md-2 col-form-label">Discount Type</label>
							<div class="col-sm-8">
								<?php
								if($rowscpn_mst['cpnm_disctyp'] == 'p')
								{
									$disctyp = "Percentage";
								}
								elseif ($rowscpn_mst['cpnm_disctyp'] == 'a')
								{
									$disctyp = "Amount";
								}
								echo $disctyp;
								?>
							</div>
						</div>
						<?php
						if ($rowscpn_mst['cpnm_disctyp'] == 'p')
						{
							$label = "Percentage";
							$val = $rowscpn_mst['cpnm_discper'];
						}
						elseif ($rowscpn_mst['cpnm_disctyp'] == 'a')
						{
							$label = "Amount";
							$val = $rowscpn_mst['cpnm_discamt'];
						}
						?>
						<div class="form-group row">
							<label for="<?php echo $label; ?>" class="col-sm-2 col-md-2 col-form-label"><?php echo $label; ?></label>
							<div class="col-sm-8">
								<?php echo $val; ?>
							</div>
						</div>
						<div class="form-group row">
							<label for="exprdt" class="col-sm-2 col-md-2 col-form-label">Expiry Date</label>
							<div class="col-sm-8"> 
								<?php echo $rowscpn_mst['cpnm_exdt']; ?>
							</div>
						</div>
						<div class="form-group row">
							<label for="desc" class="col-sm-2 col-md-2 col-form-label">Description</label>
							<div class="col-sm-8"> 
								<?php echo $rowscpn_mst['cpnm_desc'];?>
							</div>
						</div>
						<div class="form-group row">
							<label for="rank" class="col-sm-2 col-md-2 col-form-label">Rank</label>
							<div class="col-sm-8"> 
								<?php echo $rowscpn_mst['cpnm_prty'];?>
							</div>
						</div>
						<div class="form-group row">
							<label for="txtname" class="col-sm-2 col-md-2 col-form-label">Status</label>
							<div class="col-sm-8"> 
								<?php echo $rowscpn_mst['cpnm_sts'];?>
							</div>
						</div>
						<p class="text-center">
							<!-- <input type="Submit" class="btn btn-primary btn-cst" name="frmedtcpnid" id="frmedtcpnid" value="Edit" 
							onclick="update1()"> -->
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