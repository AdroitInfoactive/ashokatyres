<?php
include_once '../includes/inc_config.php'; //Making paging validation	
include_once $inc_nocache; //Clearing the cache information
include_once $adm_session; //checking for session
include_once $inc_cnctn; //Making database Connection
include_once $inc_usr_fnctn; //checking for session	
include_once $inc_pgng_fnctns; //Making paging validation
include_once $inc_fldr_pth; //Making paging validation
/***************************************************************
Programm : view_detail_orders.php	
Purpose : For Viewing Order Details
Created By : Bharath
Created On : 05-01-2022
Modified By : Lokesh palagani
Modified On :26-04-2023
Purpose : 
Company : Adroit
************************************************************/
global $id, $pg, $countstart;
$rd_crntpgnm = "view_all_orders.php";
// $rd_edtpgnm = "edit_products.php";
$clspn_val = "4";
/*****header link********/
$pagemncat = "Stock";
$pagecat = "Stock";
$pagenm = "View all Orders";
/*****header link********/
if (isset($_POST['btnupd']) && isset($_POST['hdnordsts']) && (trim($_POST['hdnordsts']) != "") && isset($_POST['hdnordid']) && (trim($_POST['hdnordid']) != "")) {
	

	// && isset($_POST['txtdt']) && (trim($_POST['txtdt']) != "")
	//	if((strtotime($_POST['txtdt']) >= strtotime($_POST['hdncmpdt']))== true){}
	include_once "../database/iqry_ordsts_dtl.php";
	//	else{}
	//	$gmsg = "Date Should be After Order Date";
}
if (isset($_REQUEST['vw']) && (trim($_REQUEST['vw']) != "") && isset($_REQUEST['pg']) && (trim($_REQUEST['pg']) != "") && isset($_REQUEST['countstart']) && (trim($_REQUEST['countstart']) != "")) {
	$id = glb_func_chkvl($_REQUEST['vw']);
	$pg = glb_func_chkvl($_REQUEST['pg']);
	$countstart = glb_func_chkvl($_REQUEST['countstart']);
	$srchval = glb_func_chkvl($_REQUEST['val']);
	$chk = glb_func_chkvl($_REQUEST['chk']);
}
echo $sqryord_mst = "SELECT crtordm_id, crtordm_code, crtordm_fstname, crtordm_lstname, crtordm_badrs, crtordm_badrs2, blcty.ctym_name as bctynm,blcnty.cntym_name as bcntynm, crtordm_bzip,blcntry.cntrym_name as bcntrynm, blcntry.cntrym_id as bcntryid, crtordm_bdayphone, crtordm_emailid,crtordm_sfstname, crtordm_slstname, crtordm_sadrs, crtordm_sadrs2, shpcty.ctym_name as sctynm, shpcnty.cntym_name as scntynm, shpcnty.cntym_id as scntyid, crtordm_szip, shpcntry.cntrym_name as scntrynm, crtordm_sdayphone, crtordm_semailid, crtordm_qty, crtordm_amt, crtordm_wt, crtordm_pmode, crtordm_prcssts, crtordm_cartsts, crtordm_paysts, crtordm_rmks, crtordm_shpchrgm_id, crtordm_shpchrgamt, crtordm_cpnm_val, crtordm_mbrm_id, crtordm_ordtyp, date_format(crtordm_crtdon,'%d-%m-%Y %h:%i:%s') as crtordm_crtdon, blcty.ctym_sts as bctysts, shpcty.ctym_sts as sctysts, blcnty.cntym_sts as bcntysts, shpcnty.cntym_sts as scntysts, blcntnt.cntntm_name as bcntntm_name, shpcntnt.cntntm_name as scntntm_name, crtordm_cpnm_id, crtordm_pmode, crtordm_pmode, ordstsd_ordstsm_id
	from crtord_mst crtord
	left join cntry_mst blcntry on blcntry.cntrym_id=crtord.crtordm_bmbrcntrym_id
	left join cnty_mst blcnty on blcnty.cntym_id = crtord.crtordm_bmbrcntym_id
	left join cty_mst blcty on blcty.ctym_id = crtord.crtordm_bmbrctym_id
	left join cty_mst shpcty on shpcty.ctym_id = crtord.crtordm_smbrctym_id
	left join cnty_mst shpcnty on shpcnty.cntym_id = crtord.crtordm_smbrcntym_id
	left join cntry_mst shpcntry on shpcntry.cntrym_id= crtord.crtordm_smbrcntrym_id
	left join cntnt_mst blcntnt on blcntry.cntrym_cntntm_id= blcntnt.cntntm_id
	left join cntnt_mst shpcntnt on shpcntry.cntrym_cntntm_id= shpcntnt.cntntm_id
	left join cpn_mst on cpn_mst.cpnm_id = crtordm_cpnm_id
	left join ordsts_dtl on ordsts_dtl.ordstsd_crtordm_id = crtordm_id
where crtordm_id='$id' order by ordstsd_id desc limit 1";

// echo $sqryord_mst;
$srsord_mst = mysqli_query($conn, $sqryord_mst);
$rowsord_mst = mysqli_fetch_assoc($srsord_mst);
$ordsts = $rowsord_mst['ordstsd_ordstsm_id'];
$paymode = $rowsord_mst['crtordm_pmode'];
$state = $rowsord_mst['scntynm'];

$loc = "&val=$srchval";
if ($chk != '') {
	$loc .= "&chk=y";
}
if (isset($_REQUEST['sts']) && (trim($_REQUEST['sts']) == "y")) {
	$msg = "<center><font color=red>Record updated successfully</font></center>";
} elseif (isset($_REQUEST['sts']) && (trim($_REQUEST['sts']) == "n")) {
	$msg = "<center><font color=red>Record not updated</font></center>";
} elseif (isset($_REQUEST['sts']) && (trim($_REQUEST['sts']) == "d")) {
	$msg = "<center><font color=red>Duplicate Recored Name Exists & Recor</center>d Not updated</font>";
}
?>
<!-- <script language="javascript">
function update1() //for update download details
{
	document.frmedtordid.action="<?php echo $rd_edtpgnm; ?>?vw=<?php echo $id; ?>&pg=<?php echo $pg; ?>&countstart=<?php echo $countstart . $loc; ?>";
	document.frmedtordid.submit();
}
</script> -->
<?php
include_once $inc_adm_hdr;
include_once $inc_adm_lftlnk;
include_once('script.php');
include_once('../includes/inc_fnct_ajax_validation.php');
?>
<link rel="stylesheet" href="../ui-lightness/jquery-ui-1.10.3.custom.css">
<section class="content">
	<div class="content-header">
		<div class="container-fluid">
			<div class="row mb-2">
				<div class="col-sm-6">
					<h1 class="m-0 text-dark">View Order Details</h1>
				</div><!-- /.col -->
				<div class="col-sm-6">
					<ol class="breadcrumb float-sm-right">
						<li class="breadcrumb-item"><a href="#">Home</a></li>
						<li class="breadcrumb-item active">View Order Details</li>
					</ol>
				</div><!-- /.col -->
			</div><!-- /.row -->
		</div><!-- /.container-fluid -->
	</div>

	<body onLoad="ordstsdesc()">
		<form name="frmedtordid" id="frmedtordid" method="post" action="<?php $_SERVER['PHP_SELF']; ?>"
			onSubmit="return performCheck('frmedtordid', rules, 'inline');">
			<input type="hidden" name="hdnordid" id="hdnordid" value="<?php echo $id; ?>">
			<input type="hidden" name="hdnordsts" id="hdnordsts" value="<?php echo $ordsts; ?>">
			<input type="hidden" name="hdnpaymod" id="hdnpaymod" value="<?php echo $paymode; ?>">
			<input type="hidden" name="hdnpage" value="<?php echo $pg; ?>">
			<input type="hidden" name="hdncnt" value="<?php echo $countstart ?>">
			<?php
			if ($msg != '') {
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
								<label for="txtname" class="col-sm-2 col-md-3 col-form-label">Order No</label>
								<div class="col-sm-8">
									<?php echo $rowsord_mst['crtordm_code']; ?>
								</div>
							</div>
							<div class="form-group row">
								<label for="txtname" class="col-sm-2 col-md-3 col-form-label">Order Date & Time</label>
								<div class="col-sm-8">
									<?php echo $rowsord_mst['crtordm_crtdon']; ?>
								</div>
							</div>
							<div class="form-group row">
								<label for="txtname" class="col-sm-2 col-md-3 col-form-label">Total Amount</label>
								<div class="col-sm-8">
									<?php echo $rowsord_mst['crtordm_amt']; ?>
								</div>
							</div>
							<div class="form-group row">
								<label for="txtname" class="col-sm-2 col-md-3 col-form-label">Total Quantity</label>
								<div class="col-sm-8">
									<?php echo $rowsord_mst['crtordm_qty']; ?>
								</div>
							</div>
							<div class="form-group row">
								<label for="txtname" class="col-sm-2 col-md-3 col-form-label">Payment Status</label>
								<div class="col-sm-8">
									<?php echo funcDispCrnt($rowsord_mst['crtordm_paysts']); ?>
								</div>
							</div>
							<div class="form-group row">
								<label for="txtname" class="col-sm-2 col-md-3 col-form-label">Payment Mode</label>
								<div class="col-sm-8">
									<?php
									if ($rowsord_mst['crtordm_pmode'] == 'o') {
										$paymod = "Online";
									} else {
										$paymod = "Credit";
									}
									echo $paymod;
									?>
								</div>
							</div>
						</div>
						<div class="col-md-12">
							<table width="100%" border="0" cellpadding="4" cellspacing="1">
								<tr class="white">
									<td colspan='2' bgcolor="#585858"><strong>BILLING ADDRESS</strong></td>
								</tr>
								<tr>
									<td align="left" colspan="2">
										<?php echo $rowsord_mst['crtordm_fstname'] . " " . $rowsord_mst['crtordm_lstname']; ?>
									</td>
								</tr>
								<tr>
									<td colspan='2'>
										<?php echo $rowsord_mst['crtordm_badrs']; ?>
									</td>
								</tr>
								<tr>
									<td>
										<?php echo $rowsord_mst['bctynm']; ?>
									</td>
								</tr>
								<tr>
									<td>
										<?php echo $rowsord_mst['bcntynm']; ?>
									</td>
								</tr>
								<tr>
									<td colspan='2'>
										<?php echo $rowsord_mst['bcntrynm']; ?>
									</td>
								</tr>
								<tr>
									<td colspan='2'>
										<?php echo $rowsord_mst['crtordm_bzip']; ?>
									</td>
								</tr>
								<tr>
									<td colspan='2'>Phone No :
										<?php echo $rowsord_mst['crtordm_bdayphone']; ?>
									</td>
								</tr>
								<tr>
									<td colspan='2'>
										<?php echo $rowsord_mst['crtordm_emailid']; ?>
									</td>
								</tr>
							</table>
							<table width="100%" border="0" cellpadding="4" cellspacing="1">
								<tr class="white">
									<td colspan='2' bgcolor="#585858"><strong>SHIPPING ADDRESS</strong></td>
								</tr>
								<tr>
									<td align="left" colspan="2">
										<?php echo $rowsord_mst['crtordm_sfstname'] . ' ' . $rowsord_mst['crtordm_slstname']; ?>
									</td>
								</tr>
								<tr>
									<td colspan='2'>
										<?php echo $rowsord_mst['crtordm_sadrs']; ?>
									</td>
								</tr>
								<tr>
									<td>
										<?php echo $rowsord_mst['sctynm']; ?>
									</td>
									<!--    <td><font color='red'><?php if ($rowsord_mst['sctysts'] == 'u') {
										echo funcDispSts($rowsord_mst['sctysts']);
									} ?></font></td>-->
								</tr>
								<tr>
									<td>
										<?php echo $rowsord_mst['scntynm']; ?>
									</td>
								</tr>
								<tr>
									<td colspan='2'>
										<?php echo $rowsord_mst['scntrynm']; ?>
									</td>
								</tr>
								<tr>
									<td colspan='2'>
										<?php echo $rowsord_mst['crtordm_szip']; ?>
									</td>
								</tr>
								<tr>
									<td colspan='2'>Phone No :
										<?php
										if ($rowsord_mst['crtordm_sdayphone'] == '') {
											echo $rowsord_mst['crtordm_bdayphone'];
										} else {
											echo $rowsord_mst['crtordm_sdayphone'];
										}
										?>
									</td>
								</tr>
								<tr>
									<td colspan='2'>
										<?php echo $rowsord_mst['crtordm_semailid']; ?>
									</td>
								</tr>
							</table>
						</div>
						<div class="col-md-12">
							<table width="100%" border="0">
								<tr bgcolor="#585858" class="white">
									<td colspan="2"><strong> CART DETAIL </strong></td>
								</tr>
								<tr>
									<td colspan="2">
										<table width="100%" border="1" cellpadding="3" cellspacing="1" bgcolor="#000">
											<tr>
												<td bgcolor="#fff" width="6%"><strong>Sl No.</strong></td>
												<td width="25%" bgcolor="#fff"><strong>Code/Name</strong></td>
												<td width="10%" align="center" bgcolor="#fff"><strong>Price</strong></td>
												<?php 
												if($state=='Telangana')
												{
													?>
													<td width="10%" align="center" bgcolor="#fff"><strong>CGST(%)</strong></td>
													<td width="10%" align="center" bgcolor="#fff"><strong>SGST(%)</strong></td>
												
								<?php	}
									else{?>
										<td width="10%" align="center" bgcolor="#fff"><strong>IGST(%)</strong></td>
									<?php }?>
												
												<td width="10%" align="center" bgcolor="#fff"><strong>Qty</strong></td>

												<td width="20%" align="center" bgcolor="#fff"><strong>Total Price</strong></td>
											</tr>
											<?php
											$pototqty = $rowsord_mst['crtordm_qty'];
											$pototprc = $rowsord_mst['crtordm_amt'];
										echo 	$sqrycrtord_dtl = "SELECT  crtordd_id, crtordd_qty,crtordd_prc,prodm_id,prodm_name, crtordd_prc as unprcval,prodm_name,crtordm_shpchrgm_id,crtordd_igst,crtordd_sgst,crtordd_cgst from crtord_dtl 
											inner join crtord_mst on crtordd_crtordm_id = crtordm_id
											left join prod_mst on prod_mst.prodm_id = crtord_dtl.crtordd_prodm_id 
										where crtordd_crtordm_id=$id group by crtordd_id";
									/* 	prodszvrtnm_vrtn_nms,prodszvrtnm_id,prodprcm_id,prodprcm_sku,prodprcm_sleprc,prodprcm_ofrprc , */
											/*	inner join prodprc_mst on crtordd_prodprcd_id = prodprcm_id  	inner join prodsz_vrtns_mst on prodszvrtnm_id = crtordd_sizem_id  */
											$sqrycrtord_dtl;
											$srscrtord_dtl = mysqli_query($conn, $sqrycrtord_dtl);
											$cnttorec = mysqli_num_rows($srscrtord_dtl);
											$totqty = "";
											$totlprc = "";
											$cntord = 0;
											if ($cnttorec > 0) {
												if(($state == "Telangana"))
												{
												$nmstrws = 1;
												}
												while ($rowspo_mst = mysqli_fetch_assoc($srscrtord_dtl)) {
													$cntord += 1;
													$db_qty = $rowspo_mst['crtordd_qty'];
											
														//$crtordm_prctyp = 'u';
													if ($crtordm_prctyp == 'u') {
														$db_prc = funcDlrprc($rowspo_mst['crtordd_prc'], $conn);
														$dbunt_prc = funcDlrprc($rowspo_mst['unprcval'], $conn);
													} else {
														$db_prc = $rowspo_mst['crtordd_prc'];
														$dbunt_prc = $rowspo_mst['unprcval'];
													}
													//$szid =	$rowspo_mst['szid'];
													$crtprdid = $rowspo_mst['crtordd_prodm_id'];
													$prcid = $rowspo_mst['crtordd_prodprcd_id'];
													$totprc = ($db_qty * $db_prc);
													$db_shpprcid = $rowspo_mst['crtordm_shpchrgm_id'];
													$shpngqry = "SELECT shpngm_id,shpngm_prc from  shpng_mst WHERE shpngm_id = $db_shpprcid and shpngm_sts = 'a' ";
													$shpng_mst = mysqli_query($conn, $shpngqry);
													$shpng_dtl = mysqli_fetch_assoc($shpng_mst);
													$db_shpprc = $shpng_dtl['shpngm_prc'];
													$igstval = $rowspo_mst['crtordd_igst'];
													$sgstval = $rowspo_mst['crtordd_sgst'];
													$cgstval = $rowspo_mst['crtordd_cgst'];
													$dmeonamt = 100 + $igstval;
													$prodtax = ($db_prc / $dmeonamt) * $igstval;
													$gstval = $igstval;
													$totlprdprc = ($totlprdprc + $totprc);
													// $gst = 1+($gstval/100);
													// $sgst = 1+($sgstval/100);
													// $cgst = 1+($cgstval/100);
													//$prdprc  = $db_prc/$gst;
													$prdprc = $db_prc - $prodtax;
													$sgstprdprc = $db_prc / $sgst;
													$cgstprdprc = $db_prc / $cgst;
													$prdwoustgst = $prdprc;
													$prdwoustsgst = $sgstprdprc;
													$prdwoustcgst = $cgstprdprc;
													// $tax = $db_prc - $prdwoustgst;
													// $sgsttax = $db_prc - $prdwoustsgst;
													// $cgsttax = $db_prc - $prdwoustcgst;
													$igstper = $gstper;
													$substr = substr($gstnm, 0, 2);
													if ($nmstrws == 1) {
														$gstdiv = $prodtax / 2;
														$cgst = number_format($gstdiv, 2, '.', ',');
														$sgst = number_format($gstdiv, 2, '.', ',');
													$gstper = ($gstval / 2);
													}
													?>
													<tr bgcolor="#fff">
														<td align="left">
															<?php echo $cntord; ?>
														</td>
														<td align="left">
															<?php
															$prdcde = $rowspo_mst['prodm_code'];
															?>
															<!-- <a href="vw_all_productsord_detail.php?vw=<?php echo $crtprdid; ?>&ststyp=<?php echo $ordsts; ?>" target="_blank" class="leftlinks"><?php echo @$prdcde; ?></a><br /> -->
															Name:
															<?php echo $rowspo_mst['prodm_name']; ?> </br>
															Code:
															<?php echo $rowspo_mst['prodprcm_sku']; ?> </br>
															Size:
															<?php echo $rowspo_mst['prodszvrtnm_vrtn_nms']; ?>
														</td>
														<td align="right">
															<?php
															$prdwoustgst = $prdprc;
															echo number_format($prdwoustgst, 2, '.', ',');
															?>
														</td>
														<?php
														if($state=='Telangana'){?>
															<td align="right">
															<?php
														
															echo number_format($cgst, 2, '.', ','). " (".$gstper."%)";
															
															?>
															<td align="right">
															<?php
															echo number_format($sgst, 2, '.', ','). " (".$gstper."%)";
														
															?>
														</td>
														</td>

													<?php	}
													else{?>
													<td align="right">
															<?php
															echo number_format($prodtax, 2, '.', ','). " (".$igstval."%)";
															
															?>
														</td>
														<?php

													}
													?>
														
														<td align="right">
															<?php
															echo $db_qty;
															$totqty = $totqty + $db_qty;
															?>
														</td>

														<td align="right">
															<?php
															echo number_format($totprc, 2, ".", ",");
															$totlprc = ($totlprc + $totprc);
															?>
														</td>
													</tr>
													<?php
												}
											}
											?>
											<tr bgcolor="#fff">
										<?php	if($state=='Telangana'){?>
												<td colspan="6" align='right'><b>TOTAL QTY :
														<?php echo $totqty; ?>
													</b></td>
													<?php } 
													else{?>
														<td colspan="5" align='right'><b>TOTAL QTY :
														<?php echo $totqty; ?>
													</b></td>
												<?php	}?>
												<td colspan="5" align="right">
													<b>PRODUCT COST :
														<?php echo number_format($totlprc, 2, '.', ','); ?>
														<br><!--<b>Tax :-->
														<?php // echo number_format($taxcnty,2,'.',',');
														$totlprc = $totlprc + $taxcnty;
														$cupid = $rowsord_mst['crtordm_cpnm_id'];
														$cupnm = $rowsord_mst['cpnm_name'];
														if ($cupid != 0) {

															$cupval = $rowsord_mst['crtordm_cpnm_val'];
															$totlprc -= $cupval;
															echo "<br><b>Coupon(Applied)$cupnm : -$cupval </b>";
														}
														if ($totlprc != 0) {
															$totlprc += $db_shpprc;
															echo "<br><b>SHIPPING CHARGES : $db_shpprc</b>";
														} else {
															$shpprc = 0;
															$totlprc += $db_shpprc;
															//	echo "<br><strong>Shipping Charges Not Appilcable for More than 3000 Purchase: $shpprc</strong>";
															echo "<br><strong>Shipping Charges : $db_shpprc</strong>";
														}
														/*if($codprc > 0){
														$totlprc +=  $codprc;
														echo "<br><b>COD CHARGES : $codprc</b>";
														}*/
														?>
														<br><strong>ORDER AMOUNT :
															<?php
															if ($regid == '') {
																$regid = $crtmbrid;
															}
															/*$sqlcrtord_mst = "select crtordm_mbrm_id from crtord_mst where crtordm_mbrm_id = $regid";
															$rescrtord_mst = mysqli_query($conn,$sqlcrtord_mst);
															$numorws = mysqli_num_rows($rescrtord_mst);*/
															if ($crtdiscamt != 0) {
																$netTotal = $totlprc;
																$disPrc = $crtdiscamt;
																$ntTogPrc = $netTotal - $disPrc;
																echo "Net Total You get a 10% Discount for First time Purchase order" . number_format($ntTogPrc, 2, '.', ',');
															} else {
																echo number_format($totlprc, 2, '.', ',') . "<br>";
															
															}
															?>
														</strong>
													</b>
												</td>
											</tr>
										</table>
									</td>
								</tr>
							</table>
						</div>
						<div class="col-md-12">
							<div class="form-group row">
								<label for="ordsts" class="col-sm-2 col-md-3 col-form-label">Status</label>
								<div class="col-sm-8">
									<?php
									$sqryordsts_mst = "SELECT ordstsm_id,ordstsm_name from
									ordsts_mst where ordstsm_sts='a' order by ordstsm_prty desc";
									$srsordsts_mst = mysqli_query($conn, $sqryordsts_mst);
									?>
									<!-- <select id="ordsts" name="ordsts" onChange="ordstsdesc(); ask_qty();" class="form-control"> -->
									<select id="ordsts" name="ordsts" onChange="ordstsdesc();" class="form-control">
										<?php
										while ($rowordsts_mst = mysqli_fetch_assoc($srsordsts_mst)) {
											$ordstsm_id = $rowordsts_mst['ordstsm_id'];
											$ordstsm_name = $rowordsts_mst['ordstsm_name'];
											$ordstsm_prty = $rowordsts_mst['ordstsm_prty'];
											?>
											<option value="<?php echo $ordstsm_id; ?>" <?php if ($ordsts == $ordstsm_id) {
													echo "selected";
												} ?>><?php echo $ordstsm_name; ?></option>
											<?php
										}
										?>
									</select>
									<td align="left">

										<input id="txtdt" name="txtdt" type="text" value="" placeholder="Please Select Date" class="element"
											required>
										<span id="errorsDiv_txtdt"></span>

									</td>
								</div>
							</div>
						</div>
						<div class="col-md-12" id="stkdtls">
						</div>
						<div class="col-md-12">
							<input type="hidden" name="hdndesc" id="hdndesc">
							<!-- <div class="form-group row">
								<label for="txtdesc" class="col-sm-2 col-md-3 col-form-label">Description</label>
								<div class="col-sm-8">
									<textarea name="txtdesc" type="text" class="select" id="txtdesc" rows="5" cols="40" ></textarea>
								</div>
							</div> -->
						</div>
					</div>
					<p class="text-center">
						<input type="submit" name="btnupd" id="btnupd" class="btn btn-primary btn-cst" value="UPDATE">
						&nbsp;&nbsp;&nbsp;
						<input type="button" name="btnbck" id="btnbck" class="btn btn-primary btn-cst" value="BACK"
							onClick="location.href='view_all_orders.php?pg=<?php echo $pg . "&countstart=" . $countstart; ?><?php echo $loc; ?>'">
					</p>
				</div>
			</div>
		</form>
		<div id='showPopup' class="modal fade" role="dialog" aria-labelledby="showPopup">
			<div class="modal-dialog modal-lg">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
								aria-hidden="true">&times;</span></button>
					</div>
					<div class="modal-body" id='divprod'></div>
				</div>
			</div>
		</div>
	</body>
</section>
<?php include_once "../includes/inc_adm_footer.php"; ?>
<script type="text/javascript" src="../js/jquery-ui-timepicker-addon.js"></script>
<script type="text/javascript" src="../js/jquery-ui-sliderAccess.js"></script>
<script language="javaScript" type="text/javascript" src="js/ckeditor.js"></script>
<script type="text/javascript">
	CKEDITOR.replace('txtdesc');
	function ordstsdesc() {
		// var descval = document.getElementById('txtdesc').value;
		var ordstsid = document.getElementById('ordsts').value;
		if (ordstsid != '') {
			var url = "chkvalidname.php?ordstsid=" + ordstsid;
			xmlHttp = GetXmlHttpObject(stateChanged);
			xmlHttp.open("GET", url, true);
			xmlHttp.send(null);
		}
	}
	function stateChanged() {
		if (xmlHttp.readyState == 4 || xmlHttp.readyState == "complete") {
			var temp1 = xmlHttp.responseText;
			document.getElementById('hdndesc').value = temp1;
			// 	CKEDITOR.instances.txtdesc.setData(temp1);
		}
	}
	function ask_qty() {
		var hdnordid = document.getElementById('hdnordid').value;
		var ordstsid = document.getElementById('ordsts').value;
		if (ordstsid == 5 || ordstsid == 4) {
			var url = "getproddtls.php?ordsts=" + ordstsid + "&ordid=" + hdnordid;
			xmlHttp = GetXmlHttpObject(stateChanged1);
			xmlHttp.open("GET", url, true);
			xmlHttp.send(null);
		}
		else {
			document.getElementById('stkdtls').innerHTML = "";
		}
	}
	function stateChanged1() {
		if (xmlHttp.readyState == 4 || xmlHttp.readyState == "complete") {
			var temp = xmlHttp.responseText;
			// alert(temp);
			document.getElementById('stkdtls').innerHTML = temp;
		}
	}
	function str_stk(locid, locnm, locstk) {
		if (locid != "") {
			var url = "getproddtls.php?locid=" + locid + "&locnm=" + locnm + "&locstk=" + locstk;
			xmlHttp = GetXmlHttpObject(funcprodstkChanged);
			xmlHttp.open("GET", url, true);
			xmlHttp.send(null);
		}
	}
	function funcprodstkChanged() {
		if (xmlHttp.readyState == 4 || xmlHttp.readyState == "complete") {
			var temp = xmlHttp.responseText;
			// alert(temp);
			var tmpval = document.getElementById('divprod').innerHTML = temp
			if (tmpval != 0) {
				$(function () {
					$("#showPopup").modal('show');
				});
			}
		}
	}
	function chk_stk(prodid) {
		if (prodid != "") {
			var avl_stk = document.getElementById('clsbls' + prodid).value;
			var ord_qty = document.getElementById('ord_qty' + prodid).value;
			var dis_qty = document.getElementById('disqty' + prodid).value;
			if ((Number(dis_qty) > Number(avl_stk)) || (Number(dis_qty) > Number(ord_qty))) {
				alert("Dispatching stock should not be greater than Available stock or Order Qty");
			}
			else {
				if (dis_qty == "") {
					document.getElementById('hdnstklft' + prodid).value = "";
					document.getElementById('stk_lft' + prodid).innerHTML = "";
				}
				else {
					var bal_stk = Number(avl_stk) - Number(dis_qty);
					document.getElementById('hdnstklft' + prodid).value = bal_stk;
					document.getElementById('stk_lft' + prodid).innerHTML = bal_stk;
				}
			}
			/*alert(avl_stk+ ':' +ord_qty+ ':' +dis_qty);
			var url = "getproddtls.php?locid="+locid+"&locnm="+locnm+"&locstk="+locstk;
			xmlHttp	= GetXmlHttpObject(funcprodstkChanged);
			xmlHttp.open("GET", url , true);
			xmlHttp.send(null);*/
		}
	}
</script>
<script type="text/javascript">
	$(function () {

		$('#txtdt').datetimepicker({
			timeFormat: 'H:m:00', dateFormat: "yy-mm-dd", showOn: "button",



			buttonImage: "images/calendar.gif",



			buttonImageOnly: true, buttonText: ""
		});

	});
</script>