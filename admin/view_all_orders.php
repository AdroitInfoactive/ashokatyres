<?php
include_once '../includes/inc_config.php'; //Making paging validation 
include_once $inc_nocache; //Clearing the cache information
include_once $adm_session; //checking for session
include_once $inc_cnctn; //Making database Connection
include_once $inc_usr_fnctn; //checking for session 
include_once $inc_pgng_fnctns; //Making paging validation 
include_once $inc_fldr_pth; //Making paging validation
/**************************************************************
Programm : view_all_orders.php
Purpose : For Viewing orders
Created By : Bharath
Created On :	12-04-2022
Modified By : 
Modified On : 
Company : Adroit
***************************************************************/
/*****header link********/
$pagemncat = "Stock";
$pagecat = "Stock";
$pagenm = "View all Orders";
/*****header link********/
global $msg,$loc;
$clspn_val = "7";
$rd_crntpgnm = "view_all_orders.php";
$rd_vwpgnm = "view_detail_orders.php";
if(isset($_POST['hdnchksts']) && (trim($_POST['hdnchksts']) != "") || isset($_POST['hdnallval']) && (trim($_POST['hdnallval']) != ""))
{
	$dchkval = substr($_POST['hdnchksts'],1);
	$id = glb_func_chkvl($dchkval);
	$chkallval	= glb_func_chkvl($_POST['hdnallval']);
	$updtsts = funcUpdtAllRecSts($conn,'prod_mst','prodm_id',$id,'prodm_sts',$chkallval);
	if($updtsts == 'y')
	{
		$msg = "<font color=red>Record updated successfully</font>";
	}
	elseif($updtsts == 'n')
	{
		$msg = "<font color=red>Record not updated</font>";
	}
}
if(($_POST['hdnchkval'] != "") && isset($_REQUEST['hdnchkval']))
{
	$dchkval = substr($_POST['hdnchkval'],1);
	$did = glb_func_chkvl($dchkval);
	$del = explode(',',$did);
	$count = sizeof($del);
	$delsts1 = funcDelAllRec($conn,'prod_veh_dtl','prodd_prodm_id',$did);
	$delsts3 = funcDelAllRec($conn,'prod_store_dtl','prods_prodm_id',$did);
	$delsts4 = funcDelAllRec($conn,'prodimg_dtl','prodimgd_prodm_id',$did);
	$delsts = funcDelAllRec($conn,'prod_mst','prodm_id',$did);
	if($delsts == 'y')
	{
		$msg = "<font color=red>Record deleted successfully</font>";
	}
	elseif($delsts == 'n')
	{
		$msg = "<font color=red>Record can't be deleted(child records exist)</font>";
	}
}
if(isset($_REQUEST['sts']) && (trim($_REQUEST['sts'])=='y'))
{
	$msg = "<font color=red>Record updated successfully</font>";
}
if(isset($_REQUEST['sts']) && (trim($_REQUEST['sts']) == 'n'))
{
	$msg = "<font color=red>Record not updated</font>";
}
if(isset($_REQUEST['sts']) && (trim($_REQUEST['sts'])=='d'))
{
	$msg = "<font color=red>Duplicate Recored Name Exists ,Record Not updated</font>";
}
$rowsprpg = 20; //maximum rows per page
include_once "../includes/inc_paging1.php"; //Includes pagination
$sqrycrtord_mst1 = "SELECT crtordm_id, crtordm_code, crtordm_sesid, crtordm_fstname, crtordm_lstname, crtordm_badrs, crtordm_badrs2, crtordm_bcmpny, crtordm_bmbrctym_id, crtordm_bmbrcntym_id, crtordm_bzip, crtordm_bmbrcntrym_id, crtordm_bdayphone, crtordm_emailid, crtordm_sfstname, crtordm_slstname, crtordm_sadrs, crtordm_sadrs2, crtordm_scmpny, crtordm_smbrctym_id, crtordm_smbrcntym_id, crtordm_szip, crtordm_smbrcntrym_id, crtordm_sdayphone, crtordm_semailid, crtordm_qty, crtordm_shp_typ, crtordm_amt, crtordm_hsncde, crtordm_igst, crtordm_sgst, crtordm_cgst, crtordm_disamt, crtordm_wt, crtordm_pmode, crtordm_prcssts, crtordm_cartsts, crtordm_paysts, crtordm_rmks, crtordm_pgdtl, crtordm_shpchrgm_id, crtordm_shpchrgamt, crtordm_codamt, crtordm_cpnm_id, crtordm_cpnm_typ, crtordm_cpnm_val, crtordm_mbrm_id, crtordm_ordtyp,crtordm_crtdon,ordstsd_ordstsm_id FROM crtord_mst
	inner join crtord_dtl on crtord_mst.crtordm_id = crtord_dtl.crtordd_crtordm_id
	inner join ordsts_dtl on ordsts_dtl.ordstsd_crtordm_id = crtord_mst.crtordm_id";
  //echo $sqrycrtord_mst1 ;exit;
if(isset($_REQUEST['txtsrchordno']) && (trim($_REQUEST['txtsrchordno'])!=""))
{
	$txtsrchordno = glb_func_chkvl($_REQUEST['txtsrchordno']);
	$loc .= "&txtsrchordno=".$txtsrchordno;
	if(isset($_REQUEST['chk']) && (trim($_REQUEST['chk'])=='y'))
	{
		$sqrycrtord_mst2.=" and crtord_mst.crtordm_code = '$txtsrchordno'";
	}
	else
	{
		$sqrycrtord_mst2.=" and crtord_mst.crtordm_code like '%$txtsrchordno%'";
	}
}
if(isset($_REQUEST['txtsrchsnm']) && (trim($_REQUEST['txtsrchsnm'])!=""))
{
	$txtsrchsnm = glb_func_chkvl($_REQUEST['txtsrchsnm']);
	$loc .= "&txtsrchsnm=".$txtsrchsnm;
	if(isset($_REQUEST['chk']) && (trim($_REQUEST['chk'])=='y'))
	{
		$sqrycrtord_mst2.=" and (crtord_mst.crtordm_fstname = '$txtsrchsnm' or crtord_mst.crtordm_lstname = '$txtsrchsnm')";
	}
	else
	{
		$sqrycrtord_mst2.=" and (crtord_mst.crtordm_fstname like '%$txtsrchsnm%' or crtord_mst.crtordm_lstname like '%$txtsrchsnm%')";
	}
}
if(isset($_REQUEST['lstordsts']) && (trim($_REQUEST['lstordsts'])!=""))
{
	$lstordsts = glb_func_chkvl($_REQUEST['lstordsts']);
	$loc .= "&lstordsts=".$lstordsts;
	if(isset($_REQUEST['chk']) && (trim($_REQUEST['chk'])=='y'))
	{
		$sqrycrtord_mst2.=" and crtord_mst.ordstsd_ordstsm_id = '$lstordsts'";
	}
	else
	{
		$sqrycrtord_mst2.=" and crtord_mst.ordstsd_ordstsm_id like '%$lstordsts%'";
	}
}
$sqrycrtord_mst1 = $sqrycrtord_mst1.$sqrycrtord_mst2;
$sqrycrtord_mst = $sqrycrtord_mst1." group by crtordm_id order by crtordm_id desc limit $offset, $rowsprpg";
 $sqrycrtord_mst; //exit;
$srsord_mst = mysqli_query($conn,$sqrycrtord_mst);
$cnt_recs	 = mysqli_num_rows($srsord_mst);
include_once ('script.php');
?>
<script language='javascript' src="../includes/searchpopcalendar.js"></script>
<script language="javascript">
	/*function addnew()
	{
		document.frmord.action="<?php echo $rd_adpgnm;?>";
		document.frmord.submit();
	}*/
	function srch()
	{
		var urlval = "";
		var txtsrchordno = document.frmord.txtsrchordno.value;
		var txtsrchsnm = document.frmord.txtsrchsnm.value;
		var lstordsts = document.frmord.lstordsts.value;
		if((txtsrchordno=="") && (txtsrchsnm=="") && (lstordsts==""))
		{
			alert("Select Search Criteria");
			document.frmord.txtsrchordno.focus();
			return false;
		}
		if(txtsrchordno !='')
		{
			if(urlval == "")
			{
				urlval +="txtsrchordno="+txtsrchordno;
			}
			else
			{
				urlval +="&txtsrchordno="+txtsrchordno;
			}
		}
		if(txtsrchsnm !='')
		{
			if(urlval == "")
			{
				urlval +="txtsrchsnm="+txtsrchsnm;
			}
			else
			{
				urlval +="&txtsrchsnm="+txtsrchsnm;
			}
		}
		if(lstordsts !='')
		{
			if(urlval == "")
			{
				urlval +="lstordsts="+lstordsts;
			}
			else
			{
				urlval +="&lstordsts="+lstordsts;
			}
		}
		if(document.frmord.chkexact.checked==true)
		{
			document.frmord.action="view_all_orders.php?"+urlval+"&chk=y";
			document.frmord.submit();
		}
		else
		{
			document.frmord.action="view_all_orders.php?"+urlval;
			document.frmord.submit();
		}
		return true;
	}
	function exprt()
	{
		var urlval = "prdsts=y";
		var txtsrchordno		= document.frmord.txtsrchordno.value;
		var txtsrchnm 	= document.frmord.txtsrchnm.value;
		var txtsrchprc 	= document.frmord.txtsrchprc.value;
		var lstsrchptrn		= document.frmord.lstsrchptrn.value;
		var lstordsts 	= document.frmord.lstordsts.value;
		var lstsrchtyrtyp = document.frmord.lstsrchtyrtyp.value;
		var lstsrchbrnd = document.frmord.lstsrchbrnd.value;
		var lstsrchmnfctr = document.frmord.lstsrchmnfctr.value;
		var lstsrchfbrc = document.frmord.lstsrchfbrc.value;
		var chkexactval="";
		if(document.frmord.chkexact.checked==true)
		{
			chkexactval='y';
		}
		var lstsrchsplrnm = document.frmord.lstsrchsplrnm.value;
		if((txtsrchordno!="") || (txtsrchnm!="") || (txtsrchprc!="") || (lstsrchptrn!="") || (lstordsts!="") || (lstsrchtyrtyp!="") || (lstsrchbrnd!="") || (lstsrchmnfctr!="")|| (lstsrchfbrc!="")|| (lstsrchsplrnm!=""))
		{
			urlval +="&txtsrchordno="+txtsrchordno+"&txtsrchnm="+txtsrchnm+"&txtsrchprc="+txtsrchprc+"&lstsrchptrn="+lstsrchptrn+"&lstordsts="+lstordsts+"&lstsrchtyrtyp="+lstsrchtyrtyp+"&lstsrchbrnd="+lstsrchbrnd+"&lstsrchmnfctr="+lstsrchmnfctr+"&lstsrchfbrc="+lstsrchfbrc+"&lstsrchsplrnm="+lstsrchsplrnm+"&chk="+chkexactval;
			document.frmord.action="exp_prdct_details.php?"+urlval;
			document.frmord.submit();
		}
		else
		{
			document.frmord.action="exp_prdct_details.php?"+urlval;
			document.frmord.submit();
		}
	}
</script>
<script language="javascript" type="text/javascript" src="../includes/chkbxvalidate.js"></script>
<?php include_once $inc_adm_hdr; ?>
<section class="content">
	<div class="content-header">
		<div class="container-fluid">
 			<div class="row mb-2">
 				<div class="col-sm-6">
					<h1 class="m-0 text-dark">Orders</h1>
				</div><!-- /.col -->
				<div class="col-sm-6">
					<ol class="breadcrumb float-sm-right">
						<li class="breadcrumb-item"><a href="#">Home</a></li>
 						<li class="breadcrumb-item active">Orders</li>
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
 				<strong>Deleted Successfully !</strong>
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
 			<div class="card-body p-0">
 				<form action="" method="post" enctype="multipart/form-data" name="frmord" id="frmord">
 					<input type="hidden" name="hdnchkval" id="hdnchkval">
 					<input type="hidden" name="hdnchksts" id="hdnchksts">
 					<input type="hidden" name="hdnallval" id="hdnallval">
 					<div class="col-md-12"><h2 class="mt-2">Search By</h2>
 						<div class="row justify-content-left align-items-center mt-3">
 							<div class="col-sm-4">
 								<div class="form-group">
 									<div class="row">
 										<div class="col-sm-7">
 											<input type="text" name="txtsrchordno" id="txtsrchordno" class="form-control" placeholder="Search by Order No" value="<?php if(isset($_REQUEST['txtsrchordno']) && (trim($_REQUEST['txtsrchordno'])!="")){echo $_REQUEST['txtsrchordno'];}else{echo "";}?>">
 										</div>
 									</div>
 								</div>
 							</div>
 							<div class="col-sm-4">
 								<div class="form-group">
 									<div class="row">
 										<div class="col-sm-7">
 											<input type="text" name="txtsrchsnm" id="txtsrchsnm" class="form-control" placeholder="Search by Name" value="<?php if(isset($_REQUEST['txtsrchsnm']) && (trim($_REQUEST['txtsrchsnm'])!="")){echo $_REQUEST['txtsrchsnm'];}else{echo "";}?>">
 										</div>
 									</div>
 								</div>
 							</div>
 							<div class="col-sm-4">
 								<div class="form-group">
 									<div class="row">
 										<div class="col-sm-7">
 											<select name="lstordsts" id="lstordsts" class="form-control">
 												<option value="">-- Select--</option>
 												<?php
 												$sqryordsts_mst="SELECT ordstsm_id,ordstsm_name from ordsts_mst where ordstsm_sts = 'a' group by ordstsm_id order by ordstsm_id";
 												$srsordsts_mst = mysqli_query($conn,$sqryordsts_mst);
 												while($srowordsts_mst = mysqli_fetch_assoc($srsordsts_mst))
 												{ ?>
 													<option value="<?php echo $srowordsts_mst['ordstsm_id'];?>"<?php if(isset($_REQUEST['lstordsts']) && $_REQUEST['lstordsts']==$srowordsts_mst['ordstsm_id']){echo 'selected';}?>><?php echo $srowordsts_mst['ordstsm_name'];?></option>
 													<?php
 												}
 												?>
 											</select>
 										</div>
 									</div>
 								</div>
 							</div>
 						</div>
 						<div class="col-sm-8">
							<div class="form-group">Exact
								<input type="checkbox" name="chkexact" value="1" <?php if(isset($_POST['chkexact']) && ($_POST['chkexact']==1)){echo 'checked';}elseif(isset($_REQUEST['chk']) && ($_REQUEST['chk']=='y')){echo 'checked';}?>>
								&nbsp;&nbsp;&nbsp;
								<input type="submit" value="Search" class="btn btn-primary" name="btnsbmt" onClick="srch();">
								<!-- <input name="btnexprt" id='btnexprt' type="button" class="btn btn-primary" onClick="exprt()" value="Export to Excel"> -->
								<a href="<?php echo $rd_crntpgnm; ?>" class="btn btn-primary">Refresh</a>
								<!-- <button type="submit" class="btn btn-primary" onClick="addnew();">+ Add</button> -->
							</div>
						</div>
 					</div>
 				</div>
 			</div>
 			<div class="card-body p-0">
 				<div class="table-responsive">
 					<table width="100%" height="185" border="0" cellpadding="3" cellspacing="1" class="table table-striped projects">
 						<!-- <tr>
							<td colspan="<?php echo $clspn_val; ?>">&nbsp;</td>
							<td align="center">
								<input name="btnsts" id="btnsts" type="button" value="Status" class="btn btn-xs btn-primary" onClick="updatests('hdnchksts','frmord','chksts')">
							</td>
							<td align="center"><input name="btndel" id="btndel" type="button" value="Delete" class="btn btn-xs btn-primary" onClick="deleteall('hdnchkval','frmord','chkdlt');" ></td>
						</tr> -->
						<tr>
							<td><strong>SL. No</strong></td>
							<td><strong>Order No</strong></td>
							<td><strong>Date & Time</strong></td>
							<td><strong>Name</strong></td>
							<!-- <td><strong>Email</strong></td>
							<td><strong>Mobile</strong></td> -->
							<td><strong>Total Qty</strong></td>
							<td><strong>Amount</strong></td>
							<td><strong>Payment Status</strong></td>
							<td><strong>Payment Mode</strong></td>
							<td><strong>Order Status</strong></td>
							<!-- <td width="7%" align="center" class="td_bg"><strong>Edit</strong></td>
							<td width="7%" align="center"><strong>
								<input type="checkbox" name="Check_ctr" id="Check_ctr" value="yes"onClick="Check(document.frmord.chksts,'Check_ctr','hdnallval')"></strong>
							</td>
							<td width="7%" align="center"><strong>
								<input type="checkbox" name="Check_dctr" id="Check_dctr" value="yes" onClick="Check(document.frmord.chkdlt,'Check_dctr')"><b></b></strong>
							</td> -->
						</tr>
						<?php
						if($cnt_recs > 0)
						{
							while($rowsord_mst=mysqli_fetch_assoc($srsord_mst))
							{
								$cnt+=1;
								$ordid = $rowsord_mst['crtordm_id'];
								$ordcode = $rowsord_mst['crtordm_code'];
								$orddt = $rowsord_mst['crtordm_crtdon'];
								$ordfstname	= $rowsord_mst['crtordm_fstname'];
								$ordlstname	= $rowsord_mst['crtordm_lstname'];
								$ordname	= $ordfstname." ".$ordlstname;
								$ordemail = $rowsord_mst['crtordm_emailid'];
								$ordmob = $rowsord_mst['crtordm_bdayphone'];
								$ordqty = $rowsord_mst['crtordm_qty'];
								$ordamt = $rowsord_mst['crtordm_amt'];
								if ($rowsord_mst['crtordm_paysts'] == 'y')
								{
									$ordpysts = "Yes";
								}
								else
								{
									$ordpysts = "No";
								}
								if ($rowsord_mst['crtordm_pmode'] == 'o')
								{
									$ordpymod = "Online";
								}
								else
								{
									$ordpymod = "Credit";
								}
								// write select query to get order status
								$sqry_crtord_sts = "SELECT ordstsd_ordstsm_id from ordsts_dtl where ordstsd_crtordm_id = $ordid order by ordstsd_id desc limit 1";
								$ordsts_dtl = mysqli_query($conn, $sqry_crtord_sts);
								$srs_ordsts_dtl = mysqli_fetch_assoc($ordsts_dtl);
								$ordsts = $srs_ordsts_dtl['ordstsd_ordstsm_id'];
								$ordsts_query = "SELECT ordstsm_id,ordstsm_name from ordsts_mst where ordstsm_id = $ordsts";
								$ordsts_mst = mysqli_query($conn,$ordsts_query);
								$ordsts_dtl = mysqli_fetch_assoc($ordsts_mst);
								$name = $ordsts_dtl['ordstsm_name'];
								?>
								<tr <?php if($cnt%2==0){echo "";}else{echo "";}?>>
									<td height="54"><?php echo $cnt;?></td>
									<td><a href="<?php echo $rd_vwpgnm;?>?vw=<?php echo $ordid;?>&pg=<?php echo $pgnum;?>&countstart=<?php echo $cntstart.$loc;?>"><?php echo $ordcode; ?></td>
									<td><?php echo $orddt; ?></a></td>
									<td><?php echo $ordname; ?></td>
									<!-- <td><?php echo $ordemail;?></td>
									<td><?php echo $ordmob;?></td> -->
									<td><?php echo $ordqty;?></td>
									<td><?php echo $ordamt;?></td>
									<td><?php echo $ordpysts;?></td>
									<td><?php echo $ordpymod;?></td>
									<td><?php echo $name;?></td>
									<!-- <td align="center">
										<a href="<?php echo $rd_edtpgnm; ?>?edit=<?php echo $ordid;?>&pg=<?php echo $pgnum;?>&countstart=<?php echo $cntstart.$loc;?>" class="orongelinks">Edit</a>
									</td>
									<td align="center">
										<input type="checkbox" name="chksts" id="chksts" value="<?php echo $rowsord_mst['prodm_id'];?>" <?php if($rowsord_mst['prodm_sts'] =='a') { echo "checked";}?> onClick="addchkval(<?php echo $rowsord_mst['prodm_id'];?>,'hdnchksts','frmord','chksts');">
									</td>
									<td align="center">
										<input type="checkbox" name="chkdlt" id="chkdlt" value="<?php echo $rowsord_mst['prodm_id'];?>">
									</td> -->
								</tr>
								<?php
							}
						}
						else
						{
							$msg="<font color=red>No Records In Database</font>";
						}
						?>
						<!-- <tr>
							<td colspan="<?php echo $clspn_val; ?>">&nbsp;</td>
							<td width="7%" align="center" valign="bottom">
								<input name="btnsts" id="btnsts" type="button" value="Status" onClick="updatests('hdnchksts','frmord','chksts')" class="btn btn-xs btn-primary">
							</td>
							<td width="7%" align="center" valign="bottom">
								<input name="btndel" id="btndel" type="button" value="Delete" onClick="deleteall('hdnchkval','frmord','chkdlt');" class="btn btn-xs btn-primary">
							</td>
						</tr> -->
						<?php
						$disppg = funcDispPag($conn,'links',$loc,$sqrycrtord_mst1	,$rowsprpg,$cntstart,$pgnum);
						$colspanval = $clspn_val+3;
						if($disppg != "")
						{
							$disppg = "<br><tr><td colspan='$colspanval' align='center' >$disppg</td></tr>";
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