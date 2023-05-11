<?php
$pagetitle = "View All Order Status";
include_once '../includes/inc_config.php'; //Making paging validation
include_once $inc_nocache; //Clearing the cache information
include_once $adm_session; //checking for session
include_once $inc_cnctn; //Making database Connection
include_once $inc_usr_fnctn; //checking for session	
include_once $inc_pgng_fnctns; //Making paging validation 
include_once $inc_fldr_pth; //Making paging validation
/***************************************************************
Programm : view_all_ordsts.php
Purpose : For Viewing Order Status
Created By : Bharath
Created On : 15-02-2022
Modified By : 
Modified On :
Company : Adroit
************************************************************/
global $msg,$loc,$rowsprpg,$dispmsg,$disppg;
$clspn_val = "4";
$rd_adpgnm = "add_ordsts.php";
$rd_edtpgnm = "edit_ordsts.php";
$rd_crntpgnm = "view_all_ordsts.php";
$rd_vwpgnm = "view_detail_ordsts.php";
$loc = "";
/*****header link********/
$pagemncat = "Setup";
$pagecat = "Order Status";
$pagenm = "Order Status";
/*****header link********/
if(isset($_POST['hdnchksts']) && (trim($_POST['hdnchksts'])!="") || isset($_POST['hdnallval']) && (trim($_POST['hdnallval'])!=""))
{
	$dchkval = substr($_POST['hdnchksts'],1);
	$id = glb_func_chkvl($dchkval);
	$chkallval	= glb_func_chkvl($_POST['hdnallval']);
	$updtsts = funcUpdtAllRecSts($conn,'ordsts_mst','ordstsm_id',$id,'ordstsm_sts',$chkallval);
	if($updtsts == 'y')
	{
		$msg = "<font color=red>Record updated successfully</font>";
	}
	elseif($updtsts == 'n')
	{
		$msg = "<font color=red>Record not updated</font>";
	}
}
if(($_POST['hdnchkval']!="") && isset($_REQUEST['hdnchkval']))
{
	$dchkval = substr($_POST['hdnchkval'],1);
	$did = glb_func_chkvl($dchkval);
	$del = explode(',',$did);
	$count = sizeof($del);
	$delsts = funcDelAllRec($conn,'ordsts_mst','ordstsm_id',$did);
	if($delsts == 'y')
	{
		$msg = "<font color=red>Record deleted successfully</font>";
	}
	elseif($delsts == 'n')
	{
		$msg = "<font color=red>Record can't be deleted(child records exist)</font>";
	}
}
if(isset($_REQUEST['sts']) && (trim($_REQUEST['sts']) == "y"))	
{
	$msg = "<font color=red>Record updated successfully</font>";
}
elseif(isset($_REQUEST['sts']) && (trim($_REQUEST['sts']) == "n"))
{
	$msg = "<font color=red>Record not updated</font>";
}
elseif(isset($_REQUEST['sts']) && (trim($_REQUEST['sts']) == "d"))
{
	$msg = "<font color=red>Duplicate Recored Name Exists & Record Not updated</font>";
}
$rowsprpg = 20;//maximum rows per page
include_once "../includes/inc_paging1.php"; //Includes pagination
include_once 'script.php'; ?>
<script language="javascript">
	function addnew()
	{
		document.frmordstsmst.action="<?php echo $rd_adpgnm;?>";
		document.frmordstsmst.submit();
	}
	function srch()
	{
		if(document.frmordstsmst.txtsrchval.value=="")
		{
			alert("Please Enter Name");
			document.frmordstsmst.txtsrchval.focus();
			return false;
		}
		var val=document.frmordstsmst.txtsrchval.value;
		if(document.frmordstsmst.chkexact.checked==true)
		{
			document.frmordstsmst.action="<?php echo $rd_crntpgnm ;?>?val="+val+"&chk=y";
			document.frmordstsmst.submit();
		}
		else
		{
			document.frmordstsmst.action="<?php echo $rd_crntpgnm ;?>?val="+val;
			document.frmordstsmst.submit();
		}
	}
</script>
<script language="javascript" type="text/javascript" src="../includes/chkbxvalidate.js"></script>
<?php 
	include_once $inc_adm_hdr;
	//include_once $inc_adm_lftlnk;
?>
<section class="content">
	<div class="content-header">
 <div class="container-fluid">
 	<div class="row mb-2">
  		<div class="col-sm-6">
  			<h1 class="m-0 text-dark">View All Order Status</h1>
  		</div><!-- /.col -->
  		<div class="col-sm-6">
  			<ol class="breadcrumb float-sm-right">
  				<li class="breadcrumb-item"><a href="#">Home</a></li>
  				<li class="breadcrumb-item active">View All Order Status</li>
  			</ol>
  		</div><!-- /.col -->
  	</div><!-- /.row -->
  </div><!-- /.container-fluid -->
  </div>
  <!-- Default box -->
  <div class="card">
 	<?php if(isset($_REQUEST['sts']) && (trim($_REQUEST['sts']) == "y"))
 	{ ?>
 		<div class="alert alert-danger alert-dismissible fade show" role="alert" id="delids"> 
 			<strong>Deleted Successfully!</strong>
 			<button type="button" class="close" data-dismiss="alert" aria-label="Close">
 				<span aria-hidden="true">&times;</span>
 			</button>
 		</div>	
 		<?php
 	}
 	?>
 	<div class="alert alert-warning alert-dismissible fade show" role="alert" id="updid" style="display:none">
 		<strong>Updated Successfully !</strong>
 		<button type="button" class="close" data-dismiss="alert" aria-label="Close">
 			<span aria-hidden="true">&times;</span>
 		</button>
 	</div>
 	<div class="alert alert-info alert-dismissible fade show" role="alert" id="sucid" style="display:none">
 		<strong>Added Successfully !</strong>
 		<button type="button" class="close" data-dismiss="alert" aria-label="Close">
 			<span aria-hidden="true">&times;</span>
 		</button>
 	</div>
 	<div class="card-body p-0">
 		<form method="post" action="<?php $_SERVER['SCRIPT_NAME'];?>" name="frmordstsmst" id="frmordstsmst">
				<input type="hidden" name="hdnchkval" id="hdnchkval">
				<input type="hidden" name="hdnchksts" id="hdnchksts">
				<input type="hidden" name="hdnallval" id="hdnallval">
				<div class="col-md-12">
					<div class="row justify-content-left align-items-center">
						<div class="col-sm-6">
							<div class="form-group">
							 <label for="txtsrchval"></label>
								<div id="div1" style="display:block">
									<input type="text" name="txtsrchval" class="form-control" value="<?php if(isset($_POST['txtsrchval']) && ($_POST['txtsrchval']!="")){echo $_POST['txtsrchval'];}elseif(isset($_REQUEST['val']) && ($_REQUEST['val']!="")){echo $_REQUEST['val'];}?>" placeholder="Search By Order Status">
								</div>
							</div>
						</div>
						<div class="col-sm-4">
							<div class="form-group">Exact
								<input type="checkbox" name="chkexact" value="1"<?php if(isset($_POST['chkexact']) && ($_POST['chkexact']==1)){echo 'checked';}elseif(isset($_REQUEST['chk']) && ($_REQUEST['chk']=='y')){echo 'checked';}?>>
								&nbsp;&nbsp;&nbsp;
								<input name="button" type="button" class="btn btn-primary" onClick="srch()" value="Search">
								<a href="<?php echo $rd_crntpgnm; ?>" class="btn btn-primary">Refresh</a>
								<button type="submit" class="btn btn-primary" onClick="addnew();">+ Add</button>
							</div>
						</div>
					</div>
				</div>
				<div class="card-body p-0">
					<div class="table-responsive">
						<table width="100%" border="0" cellpadding="3" cellspacing="1" class="table table-striped projects">
							<tr>
								<td colspan="<?php echo $clspn_val;?>">&nbsp;</td>
								<td width="7%" align="center" valign="bottom">
									<div align="center">
										<input name="btnsts" id="btnsts" type="button" class="btn btn-xs btn-primary" value="Status" onClick="updatests('hdnchksts','frmordstsmst','chksts')">
									</div>
								</td>
								<td width="7%" align="center" valign="bottom">
									<div align="center">
										<input name="btndel" id="btndel" type="button" class="btn btn-xs btn-primary" value="Delete" onClick="deleteall('hdnchkval','frmordstsmst','chkdlt');">
									</div>
								</td>
							</tr>
							<tr>
								<td width="8%" class="td_bg"><strong>SL.No.</strong></td>
								<td width="28%" class="td_bg"><strong>Status Name</strong></td>
								<td width="6%" align="center" class="td_bg"><strong>Rank</strong></td>
								<td width="7%" align="center" class="td_bg"><strong>Edit</strong></td>
								<td width="7%" class="td_bg" align="center"><strong>
								<input type="checkbox" name="Check_ctr" id="Check_ctr" value="yes"onClick="Check(document.frmordstsmst.chksts,'Check_ctr','hdnallval')"></strong></td>
								<td width="7%" class="td_bg" align="center"><strong>
								<input type="checkbox" name="Check_dctr" id="Check_dctr" value="yes" onClick="Check(document.frmordstsmst.chkdlt,'Check_dctr')"></strong></td>
							</tr>
					  <?php
					  $sqryordsts_mst1 ="SELECT ordstsm_id, ordstsm_name, ordstsm_sts, ordstsm_prty from ordsts_mst";
					  if(isset($_REQUEST['val']) && $_REQUEST['val']!="")
					  {
						  $val = glb_func_chkvl($_REQUEST['val']);
						  if(isset($_REQUEST['chk']) && $_REQUEST['chk']=='y')
						  {
						  	$loc = "&val=".$val."&chk=y";
						  	$sqryordsts_mst1.=" where ordstsm_name='$val'";
						  }
						  else
						  {
						  	$loc = "&val=".$val;
						  	$sqryordsts_mst1.=" where ordstsm_name like '%$val%'";
						  }
					  }
					  $sqryordsts_mst=$sqryordsts_mst1." order by ordstsm_name asc limit $offset,$rowsprpg";
					  $srsordsts_mst = mysqli_query($conn,$sqryordsts_mst);
						$cnt_recs  = mysqli_num_rows($srsordsts_mst);
						$cnt = $offset;
						if($cnt_recs > 0)
						{
							while($srowordsts_mst=mysqli_fetch_assoc($srsordsts_mst))
							{
								$cnt+=1;
								$pgval_srch	= $pgnum.$loc;
								$db_ordstsid	= $srowordsts_mst['ordstsm_id'];
								$db_vehname	= $srowordsts_mst['ordstsm_name'];
								$db_prty = $srowordsts_mst['ordstsm_prty'];
								$db_sts	= $srowordsts_mst['ordstsm_sts'];
								?>
								<tr <?php if($cnt%2==0){echo "";}else{echo "";}?>>
									<td><?php echo $cnt;?></td>
									<td>
										<a href="<?php echo $rd_vwpgnm; ?>?vw=<?php echo $db_ordstsid;?>&pg=<?php echo $pgnum;?>&countstart=<?php echo $cntstart.$loc;?>" class="links"><?php echo $db_vehname;?></a>
									</td>
									<td align="center"><?php echo $db_prty;?></td>
									<td align="center">
										<a href="<?php echo $rd_edtpgnm;?>?edit=<?php echo $db_ordstsid;?>&pg=<?php echo $pgnum;?>&countstart=<?php echo $cntstart.$loc;?>" class="orongelinks">Edit</a>
									</td>
									<td align="center">
										<input type="checkbox" name="chksts" id="chksts" value="<?php echo $srowordsts_mst['ordstsm_id'];?>" <?php if($srowordsts_mst['ordstsm_sts'] =='a') { echo "checked";}?> onClick="addchkval(<?php echo $srowordsts_mst['ordstsm_id'];?>,'hdnchksts','frmordstsmst','chksts');">
									</td>
									<td align="center">
										<input type="checkbox" name="chkdlt" id="chkdlt" value="<?php echo $srowordsts_mst['ordstsm_id'];?>">
									</td>
								</tr>
								<?php
							}
						}
						else
						{
							$msg="<font color=red>No Records In Database</font>";
						}
						?>
						<tr>
							<td colspan="<?php echo $clspn_val;?>">&nbsp;</td>
							<td width="7%" align="center" valign="bottom">
								<input name="btnsts" id="btnsts" type="button" value="Status" onClick="updatests('hdnchksts','frmordstsmst','chksts')" class="btn btn-xs btn-primary">
							</td>
							<td width="7%" align="center" valign="bottom">
								<input name="btndel" id="btndel" type="button" value="Delete" onClick="deleteall('hdnchkval','frmordstsmst','chkdlt');" class="btn btn-xs btn-primary">
							</td>
						</tr>
						<?php
						$disppg = funcDispPag($conn,'links',$loc,$sqryordsts_mst1,$rowsprpg,$cntstart,$pgnum);
						$colspanval = $clspn_val+2;
						if($disppg != "")
						{
							$disppg = "<br><tr><td colspan='$colspanval' align='center'>$disppg</td></tr>";
							echo $disppg;
						}				
						if($msg != "")
						{
							$dispmsg = "<tr><td colspan='$colspanval' align='center' >$msg</td></tr>";
							echo $dispmsg;
						}
						?>
					</table>
				</div>
			</div>
		</form>
	</div>
	<!-- /.card-body -->
</div>
<!-- /.card -->
</section>
<?php include_once "../includes/inc_adm_footer.php"; ?>
