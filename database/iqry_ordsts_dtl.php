<?php
include_once "../includes/inc_nocache.php"; //Clearing the cache information
include_once "../includes/inc_adm_session.php"; //checking for session
include_once "../includes/inc_connection.php"; //Making database Connection
include_once "../includes/inc_usr_functions.php"; //Use function for validation and more 

// $prdt = "Too-".date('my')."-";
$cur = date('y');
$nxt = date('y', strtotime('+1 year'));
$prdt = "FY" . $cur . "-" . $nxt . "MAN-";
if (
	isset($_POST['btnupd']) &&
	isset($_POST['hdnordid']) && (trim($_POST['hdnordid']) != "") &&
	isset($_POST['txtdt']) && (trim($_POST['txtdt']) != "")
) {
	$orderid = glb_func_chkvl($_POST['hdnordid']);
$stsdt = glb_func_chkvl($_POST['txtdt']);
	$paymod = glb_func_chkvl($_POST['hdnpaymod']);
	//echo  $stsdt    	= dateFormat('Y-m-d h:i:s', strtotime($sdate));
	$stsid = glb_func_chkvl($_POST['ordsts']);
	$crnt_dt = date('Y-m-d h:i:s');
	$cstsprty = glb_func_chkvl($_POST['hdnordsts']);
	$sqryordstsnm_mst = "SELECT ordstsm_id,ordstsm_name FROM ordsts_mst WHERE ordstsm_id='$stsid'";
	//  echo $sqryordstsnm_mst;					  
	$srsordstsnm_mst = mysqli_query($conn, $sqryordstsnm_mst);
	$rwsordstsnm_mst = mysqli_fetch_array($srsordstsnm_mst);
	$odrstsnm = $rwsordstsnm_mst['ordstsm_name'];
	//echo "hello".$odrstsnm;exit;
	$sqryordsts_mst = "SELECT ordstsd_id,ordstsd_dttm,ordstsm_name FROM ordsts_dtl left join ordsts_mst on ordstsm_id  = ordstsd_ordstsm_id WHERE  ordstsd_ordstsm_id='$stsid' AND ordstsd_crtordm_id='$orderid' AND ordstsd_dttm='$stsdt' ORDER BY ordstsd_id desc limit 0,1";
	$srsordsts_mst = mysqli_query($conn, $sqryordsts_mst);
	$rowsordsts_mst = mysqli_num_rows($srsordsts_mst);
	// echo $sqryordsts_mst;exit;
	//$rowsordsts_mst = 0;
	if ($rowsordsts_mst < 1) {
		if ((($stsid == '6') || ($odrstsnm == "Dispached"))) {
			$uqrycrtord_mst = "UPDATE crtord_mst set crtordm_paysts = 'y' where crtordm_id = '$orderid'";
			//	 echo "Helooo";exit;
			$resuqrycrtord_mst = mysqli_query($conn, $uqrycrtord_mst);
			if ($resuqrycrtord_mst == true) {
				//Cod Staus
				$sqrycrtord_mst = "SELECT crtordm_id,crtordm_code,crtordm_fstname,crtordm_lstname,  crtordm_badrs,crtordm_badrs2,crtordm_bcmpny, blcty.ctym_name as bctynm,blcnty.cntym_name as bcntynm, crtordm_bzip,blcntry.cntrym_name as bcntrynm,crtordm_bdayphone, crtordm_emailid,crtordm_sfstname,crtordm_slstname,crtordm_sadrs, crtordm_sadrs2,crtordm_scmpny,shpcty.ctym_name as sctynm, shpcnty.cntym_name as scntynm, shpcnty.cntym_id as scntyid, crtordm_szip,shpcntry.cntrym_name as scntrynm,crtordm_codamt, crtordm_sdayphone,crtordm_semailid,crtordm_qty,crtordm_amt,crtordm_wt, crtordm_pmode,crtordm_prcssts,crtordm_cartsts,crtordm_paysts,crtordm_rmks, crtordm_shpchrgm_id,crtordm_shpchrgamt,crtordm_cpnm_val,crtordm_mbrm_id, crtordm_ordtyp,date_format(crtordm_crtdon,'%d-%m-%Y') as crtordm_crtdon_dt, date_format(crtordm_crtdon,'%h:%i:%s') as crtordm_crtdon_tm, crtordm_hsncde,crtordm_igst,cpnm_name,crtordm_cpnm_id,crtordm_cpnm_typ from crtord_mst crtord 
					left join cty_mst blcty on blcty.ctym_id = crtord.crtordm_bmbrctym_id
					left join cty_mst shpcty on shpcty.ctym_id = crtord.crtordm_smbrctym_id 
					left join cnty_mst blcnty on blcnty.cntym_id = blcty.ctym_cntym_id 
					left join cnty_mst shpcnty on shpcnty.cntym_id = shpcty.ctym_cntym_id
					left join cntry_mst blcntry on blcntry.cntrym_id= blcnty.cntym_cntrym_id 
					left join cntry_mst shpcntry on shpcntry.cntrym_id= shpcnty.cntym_cntrym_id	
					left join shpng_mst on crtord.crtordm_shpchrgm_id = shpngm_id	
					left join cpn_mst on cpn_mst.cpnm_id = crtordm_cpnm_id 
				where crtordm_id = '$orderid'";
				// echo "here	".$sqrycrtord_mst; exit;
				$srscrtord_mst = mysqli_query($conn, $sqrycrtord_mst);
				$cntord_rec = mysqli_num_rows($srscrtord_mst);
				if ($cntord_rec > 0) {
					$srowcrtord_mst = mysqli_fetch_assoc($srscrtord_mst);
					$crtord_id = $srowcrtord_mst['crtordm_id'];
					$bfname = $srowcrtord_mst['crtordm_fstname'];
					$blname = $srowcrtord_mst['crtordm_lstname'];
					$bemail = $srowcrtord_mst['crtordm_emailid'];
					$ordcode = $srowcrtord_mst['crtordm_code'];
					$ordmid = base64_encode($srowcrtord_mst['crtordm_id']);
					$orddate = $srowcrtord_mst['crtordm_crtdon_dt'] . " " . $srowcrtord_mst['crtordm_crtdon_tm'];
					// $shipname 	= $srowcrtord_mst['shpchrgm_name'];	 
					$shpprc = $srowcrtord_mst['crtordm_shpchrgamt'];
					$sfname = $srowcrtord_mst['crtordm_sfstname'];
					$slname = $srowcrtord_mst['crtordm_slstname'];
					$sadrs = $srowcrtord_mst['crtordm_sadrs'];
					$sgst = $srowcrtord_mst['crtordm_sadrs2'];
					$scom = $srowcrtord_mst['crtordm_scmpny'];
					$scty = $srowcrtord_mst['sctynm'];
					$state = $srowcrtord_mst['scntynm'];
					$scounty = $srowcrtord_mst['scntynm'];
					$scountyid = $srowcrtord_mst['scntyid'];
					$scountry = $srowcrtord_mst['scntrynm'];
					$badrs = $srowcrtord_mst['crtordm_badrs'];
					$bgst = $srowcrtord_mst['crtordm_badrs2'];
					$bcom = $srowcrtord_mst['crtordm_bcmpny'];
					$bcty = $srowcrtord_mst['bctynm'];
					$bcounty = $srowcrtord_mst['bcntynm'];
					$bcountry = $srowcrtord_mst['bcntrynm'];
					$bzip = $srowcrtord_mst['crtordm_bzip'];
					$bemail = $srowcrtord_mst['crtordm_emailid'];
					$bphno = $srowcrtord_mst['crtordm_bdayphone'];
					$szip = $srowcrtord_mst['crtordm_szip'];
					$semail = $srowcrtord_mst['crtordm_semailid'];
					$sphno = $srowcrtord_mst['crtordm_sdayphone'];
					$ordamt = $srowcrtord_mst['crtordm_amt'];
					$shpamt = $srowcrtord_mst['crtordm_shpchrgamt'];
					$crtwt = $srowcrtord_mst['crtordm_wt'];
					$totcrtprc = $ordamt + $shipprc;
					// $srowcrtord_mst['crtordm_pmode'];
					$db_pmode = funcPayMod($srowcrtord_mst['crtordm_pmode']);
					//$db_pmode 	= $srowcrtord_mst['shpchrgm_name'];
					$dispsy = funcDispCrnt($srowcrtord_mst['crtordm_paysts']);
					$db_ordqty = $srowcrtord_mst['crtordm_qty'];
					$db_ordamt = $srowcrtord_mst['crtordm_amt'];
					$db_ordrmks = $srowcrtord_mst['crtordm_rmks'];
					$db_codamt = $srowcrtord_mst['crtordm_codamt'];
					$hsncde = $srowcrtord_mst['crtordm_hsncde'];
					$crtgst = $srowcrtord_mst['crtordm_igst'];
					$shpmnid = $srowcrtord_mst['crtordm_shpchrgm_id'];
					$cupid = $srowcrtord_mst['crtordm_cpnm_id'];
					$cupnm = $srowcrtord_mst['cpnm_name'];
					$cupval = $srowcrtord_mst['crtordm_cpnm_val'];
					$cuptyp = $srowcrtord_mst['crtordm_cpnm_typ'];
					//$paysts = $srowcrtord_mst['crtordm_paysts'];
									
										$sqry_crtord_sts = "SELECT ordstsd_ordstsm_id from ordsts_dtl where ordstsd_crtordm_id = $ordmstid order by ordstsd_id desc limit 1";
										$ordsts_dtl = mysqli_query($conn, $sqry_crtord_sts);
										$srs_ordsts_dtl = mysqli_fetch_assoc($ordsts_dtl);
										$ordsts = $srs_ordsts_dtl['ordstsd_ordstsm_id'];
										$ordqnty = $order_dtl['crtordm_qty'];
										$ordamt = $order_dtl['crtordm_amt'];
										//$ordsts = $order_dtl['ordstsd_ordstsm_id'];
										$state=$order_dtl['scntynm'];
										// $ordsts_qry = "SELECT ordstsm_id, ordstsm_name, ordstsm_desc, ordstsm_sts, ordstsm_prty FROM ordsts_mst WHERE ordstsm_id = $ordsts ";
										// $ordersts_mst = mysqli_query($conn,$ordsts_qry);
										// $ordersts_dtl = mysqli_fetch_assoc($ordersts_mst);
										// $type = $ordersts_dtl['ordstsm_name'];
					$shpchrges_qry = "SELECT shpngm_id,shpngm_prc from shpng_mst where shpngm_sts = 'a' and shpngm_id = '$shpmnid'";
					$shpngchrges_mst = mysqli_query($conn, $shpchrges_qry);
					$num_rows = mysqli_num_rows($shpngchrges_mst);
					if ($num_rows > 0) {
						$shpngchrges_dtl = mysqli_fetch_assoc($shpngchrges_mst);
						$shpmnprc = $shpngchrges_dtl['shpngm_prc'];
					}
					if (($state == "Telangana")) {
						$nmstrws = 1;
					}
					//$dispsy    ="No";
					$shpcmpltadrs = "";
					if ($sfname != '') {
						$shpcmpltadrs = $sfname;
					}
					if ($slname != '') {
						$shpcmpltadrs .= "&nbsp;" . $slname;
					}
					if ($sadrs != '') {
						$shpcmpltadrs .= "<br>" . $sadrs;
					}
					if ($sgst != '') {
						$shpcmpltadrs .= ",&nbsp;GST Number :&nbsp;" . $sgst;
					}
					if ($scom != '') {
						$shpcmpltadrs .= "<br>" . ",&nbsp;Company :&nbsp;" . $scom;
					}
					if ($scty != '') {
						$shpcmpltadrs .= "<br>" . $scty;
					}
					if ($scounty != '') {
						$shpcmpltadrs .= ",&nbsp;" . $scounty;
					}
					if ($scountry != '') {
						$shpcmpltadrs .= "<br>" . $scountry;
					}
					if ($szip != '') {
						$shpcmpltadrs .= ",&nbsp;Zip Code :&nbsp;" . $szip;
					}
					if ($sphno != '') {
						$shpcmpltadrs .= "<br>Mobile No :&nbsp;" . $sphno;
					}
					if ($bemail != '') {
						$shpcmpltadrs .= "<br>" . $bemail;
					}
					$blngcmpltadrs = "";
					if ($bfname != '') {
						$blngcmpltadrs = $bfname;
					}
					if ($blname != '') {
						$blngcmpltadrs .= "&nbsp;" . $blname;
					}
					if ($badrs != '') {
						$blngcmpltadrs .= "<br>" . $badrs;
					}
					if ($bgst != '') {
						$blngcmpltadrs .= ",&nbsp;GST Number :&nbsp;" . $bgst;
					}
					if ($bcom != '') {
						$blngcmpltadrs .= "<br>" . ",&nbsp;Company :&nbsp;" . $bcom;
					}
					if ($bcty != '') {
						$blngcmpltadrs .= "<br>" . $bcty;
					}
					if ($bcounty != '') {
						$blngcmpltadrs .= ",&nbsp;" . $bcounty;
					}
					if ($bcountry != '') {
						$blngcmpltadrs .= "<br>" . $bcountry;
					}
					if ($bzip != '') {
						$blngcmpltadrs .= ",&nbsp;Zip Code :&nbsp;" . $bzip;
					}
					if ($bphno != '') {
						$blngcmpltadrs .= "<br>Mobile No :&nbsp;" . $bphno;
					}
					if ($bemail != '') {
						$blngcmpltadrs .= "<br>" . $bemail;
					}
					$dt = "DEL-" . date('my') . "-";
					$hdimg = "http://" . $u_prjct_mnurl . "/" . $site_logo; //Return the URL	
					$orddate = date('l jS F Y', strtotime($orddate));
					
					$msgbody = "<!DOCTYPE HTML PUBLIC '-//W3C//DTD HTML 4.01//EN' 'http://www.w3.org/TR/html4/strict.dtd'>
			<html>
			<head><meta http-equiv='Content-Type' content='text/html; charset=utf-8'>
			<meta name='viewport' content='width=device-width, initial-scale=1.0'/>
			<title>$usr_cmpny | Order has been logged, payment is pending</title>
			<style type='text/css'>
			#outlook a{padding:0}body{width:100% !important;-webkit-text-size-adjust:100%;-ms-text-size-adjust:100%;margin:0;padding:0;background-color:#fdfbed;font-family:Arial,Helvetica,sans-serif;font-size:12px}p{margin-top:0;margin-bottom:10px}table td{border-collapse:collapse}table{border-collapse:collapse;mso-table-lspace:0pt;mso-table-rspace:0pt}img{outline:none;text-decoration:none;-ms-interpolation-mode:bicubic}a img{border:none}.image_fix{display:block} a{color:#109547; text-decoration:none;} a:hover{color:#ea7724; text-decoration:none;}
			</style>
			</head>
			<body style='margin:0; background-color:#ffffff;' marginheight='0' topmargin='0' marginwidth='0' leftmargin='0'>
			<div style='background-color:#fff;'>
				<table style='background-color:#ffffff;padding:0' background='#ffffff' width='605' border='0' align='center' cellpadding='0' cellspacing='0'>
					<tr>
						<td><a href='https://" . $u_prjct_mnurl . "/home' ><img src='https://www.ashokatyre.com/images/ashokatyre-logo.png' alt='$usr_cmpny' hspace='10' vspace='15' width='200'></a></td>
						<td align='right' width='50%'> <a href='https://www.ashokatyre.com/list-order' target='_blank' style='color:#e99005; margin-right:10px;'>Your Orders</a> | <a href='https://www.ashokatyre.com/' target='_blank' style='color:#e99005; margin-left:10px;'>ashokatyre.com</a><br>
							<h2 style='margin-top:5px; margin-bottom:5px; font-family:Arial, Helvetica, sans-serif;font-size:18px;  color:#332308;'>Order Information</h2>
							<p>$ordcode</p>
						</td>
					</tr>
				</table>
				<table style='background-color:#ffffff;padding:0' background='#ffffff' width='605' border='0' align='center' cellpadding='0' cellspacing='0'>
					<tr>
						<td valign='top' bgcolor='#ffffff' style=' margin-bottom:5px;'></td>
					</tr>
					<tr>
						<td height='2' valign='top' bgcolor='#cccccc' colspan='2'  style='margin-top:0;margin-right:0;margin-bottom:0;margin-left:0;padding-top:0;padding-right:0;padding-bottom:0;padding-left:0;text-align:left;-webkit-text-size-adjust:none;font-size:0;line-height:0;'>&nbsp;</td>
					</tr>
					<tr>
						<td height='10' valign='top' bgcolor='#fff' class='spacer' style='margin-top:0;margin-right:0;margin-bottom:0;margin-left:0;padding-top:0;padding-right:0;padding-bottom:0;padding-left:0;text-align:left;-webkit-text-size-adjust:none;font-size:0;line-height:0;'>&nbsp;</td>
					</tr>
					<tr>
						<td valign='top' bgcolor='#ffffff'><p style='font-family:Arial, Helvetica, sans-serif; color:#e99005; font-weight:bold;'>Dear $bfname,</p>
							<p style='font-family:Arial, Helvetica, sans-serif; '>Thank you for placing your order. </p>
							We thank you for being our valued customer. We hope you enjoyed your purchase. All our products are crafted with an obsessive attention to detail.<br>
						</td>
					</tr>
				</table>
				<table width='605' border='1' align='center' cellpadding='5' cellspacing='0' bordercolor='#dfdfdf' style='border:1px solid #dfdfdf; margin-top:15px;' >
					<tr valign='top' ><td colspan='2'><p style='color:#e99005; font-family:Arial, Helvetica, sans-serif; margin-top:5px; margin-bottom:5px'>Order Summery</p></td></tr>
					<tr valign='top'>
						<td align='left'>
							<p><strong style='color:color:#332308;'>Order No</strong> $ordcode</p>
							<p><strong  style='color:color:#332308;'>Order Date</strong> $orddate</p>
							<p><strong  style='color:color:#332308;'>Payment Status</strong> <span style='color:#e99005'>	$dispsy</span></p>
							<p><strong  style='color:color:#332308;'>Order Status</strong> $odrstsnm</p>
						
						</td>
					</tr> 
				</table>
				<table width='605' border='1' align='center' cellpadding='5' cellspacing='0' bordercolor='#dfdfdf' style='border:1px solid #dfdfdf; margin-top:15px;' >
					<tr>
						<td valign='middle'><p style='color:#e99005'>Sno</p></td>
						<td valign='middle'><p style='color:#e99005'>Product</p></td>
						<td valign='middle'><p style='color:#e99005'>Code/Nmae</p></td>
						<td valign='middle'><p style='color:#e99005'>Unit Price</p></td>
						<td valign='middle'><p style='color:#e99005'>Qty</p></td>
						<td align='right' valign='middle'><p style='color:#e99005'>Total Price(INR)</p></td>
					</tr>";

				$sqrycrtord_dtl =	"SELECT  crtordd_id, crtordd_qty,crtordd_prc,prodm_id,prodm_name, crtordd_prc as unprcval,prodm_id,prodm_sku,prodm_sleprc,prodm_ofrprc ,prodm_name,crtordm_shpchrgm_id,prodimgd_simg,prodimgd_title,crtordd_igst,crtordd_cgst,crtordd_sgst,prodm_tyrrmsz
					from crtord_dtl 
					inner join crtord_mst on crtordd_crtordm_id = crtordm_id
					inner join prod_mst on prod_mst.prodm_id = crtord_dtl.crtordd_prodm_id 
				left join prodimg_dtl on prodimgd_prodm_id = prodm_id
				 where crtordd_crtordm_id = $orderid group by crtordd_id";
				//echo $sqrycrtord_dtl;
				error_reporting(0);
				$srscrtord_dtl = mysqli_query($conn, $sqrycrtord_dtl);
				$cnttorec = mysqli_num_rows($srscrtord_dtl);
				$totqty = "";
				$totlprc = "";
				$cntord = 0;
				if ($cnttorec > 0) {
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
						$crtprdid =	$rowspo_mst['crtordd_prodm_id'];
						$img =	$rowspo_mst['prodimgd_simg'];
						if ($img != "") {
							/* $smlImgPth = $gprodsimg_usrpth . $smlImgNm . '.jpg'; */
							$imgpth = $rtpth . $gprodsimg_upldpth . $img . '.jpg';
						} else {
							$imgpth  = $rtpth . 'images/ashoka-no-image.jpg';
						}
						$prcid = $rowspo_mst['crtordd_prodprcd_id'];
						$totprc = ($db_qty * $db_prc);
						$db_shpprcid = $order_dtl['crtordm_shpchrgamt'];

						//$db_shpprcid = $rowspo_mst['crtordm_shpchrgm_id'];

						/* 	$shpngqry = "SELECT shpngm_id,shpngm_prc from  shpng_mst WHERE shpngm_id = $db_shpprcid and shpngm_sts = 'a' ";
							$shpng_mst = mysqli_query($conn,$shpngqry);
							$shpng_dtl = mysqli_fetch_assoc($shpng_mst);
							$db_shpprc = $shpng_dtl['shpngm_prc']; */
						$tax = $rowspo_mst['crtordd_igst'];
						$prdprc  = $db_prc;
						$dmeonamt = 100 + $tax;
						$prodtax = ($prdprc / $dmeonamt) * $tax;
						$prdgst = $gstval;
						$totlprdprc = ($totlprdprc + $totprc);
						// $gst = 1+($gstval/100);
						// $sgst = 1+($sgstval/100);
						// $cgst = 1+($cgstval/100);
						//$prdprc  = $db_prc/$gst;
						$prdprc  = $db_prc;
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
						if ($state == 'Telangana') {
							$gstdiv =  $prodtax / 2;
							$cgst = number_format($gstdiv, 2, '.', ',');
							$sgst = number_format($gstdiv, 2, '.', ',');
							// $gstper = ($gstval/2);
						}

						$msgbody .= "	<tr>
							<td> $cntord </td>
			<td><img src='$imgpth' width='100px' height='100px' ></td>
			<td> 
					Name :  $rowspo_mst[prodm_name] </br>
							Code : $rowspo_mst[prodm_sku]
									Size : $rowspo_mst[prodm_tyrrmsz] 
			</td>";
						
											$prdwoustgst = $prdprc - $prodtax;
															$prodprcwqty = $prdwoustgst * $db_qty;
								$msgbody.="<td>".number_format($prdwoustgst,2,'.',',')."	</td>";
								


						//tax code 


						$msgbody .= "
					<td> $db_qty</td>";
					$totqty	=	$totqty + $db_qty;

						
						$msgbody.="<td>". number_format($totprc,2,'.',',')."</td>";
														$totlprc = ($totlprc+$totprc);
															$prodprcwgst += $prodprcwqty; 
														
						$msgbody.="	</tr>";
					}
				}
				$msgbody .= "<tr>
				<td  colspan='5' align='right'>Payment : </td>
				<td align='right' valign='middle'>" . number_format($totlprdprc, 2, '.', ',') . "</td>
				</tr>";
		?>	
		
			<!-- <p class="mb-0"><strong>Total <?php echo $totqty;?> Item(s) :
				</strong><?php echo number_format($prodprcwgst,2,'.',',');?></p> -->
			<!-- <p class="mb-0"><strong>Total Tax: </strong>
			<?php echo number_format($tottax,2,'.',','); ?>
			</p> -->
			<?php
					$cupid  = $srowcrtord_mst['crtordm_cpnm_id'];
					$cupnm  = $srowcrtord_mst['cpnm_name'];
					if($cupid!=0)
					{
						
						$cupval  = $srowcrtord_mst['crtordm_cpnm_val'];
						$totlprc -= $cupval;
				// echo "<b>Coupon(Applied)$cupnm : -$cupval </b>";
		
				$msgbody .= "<tr>	
				<td  colspan='5' align='right'>Coupon Applied : $cupnm  </td>
				<td align='right' valign='middle'> -$cupval  </td>
				</tr>";
			
					}
					?>
			<?php 
				$db_shpprc = $srowcrtord_mst['crtordm_shpchrgamt'];
					if($db_shpprc != ''){
					?>
			<!-- <p class="mb-0"><strong>Total Shipping Charges: </strong> -->
				<?php
					if($totlprc != 0)
					{
						$totlprc +=  $db_shpprc;
					//	echo $db_shpprc;
						$msgbody .= "<tr>
						<td  colspan='5' align='right'>Shipping Charges : </td>
						<td align='right' valign='middle'>$db_shpprc</td>
						</tr>";
					}
					else
					{
						$shpprc = 0;
						$totlprc +=  $db_shpprc;
						//echo  $db_shpprc;
						$msgbody .= "<tr>
						<td  colspan='5' align='right'>Shipping Charges : </td>
						<td align='right' valign='middle'>$db_shpprc</td>
						</tr>";
					}
				
					?>
			</p>
			<?php } ?>
			<!-- <p class="mb-0"><u><strong>Total Amount:
					</strong><?php echo number_format($totlprc,2,'.',',') ?></u></p> -->
				<?php
					$msgbody .= "<tr>
						<td  colspan='5' align='right'>Total Amount : </td>
						<td align='right' valign='middle'>" . number_format($totlprc, 2, '.', ',') . "</td>
						</tr>";

			
		$msgbody .=	"</table>
  <table width='605' border='0' align='center' cellpadding='0' cellspacing='0' bgcolor='#ffffff' style='background-color:#ffffff; margin-top:15px;'>
	  <tr>
		  <td>
			  <table width='605' border='1' cellspacing='0' cellpadding='5' bordercolor='#dfdfdf' style='border:1px solid #dfdfdf'>
				  <tr>
					  <td align='center'><p style='color:#e99005'>Billing Address</p></td>";
				if ($shp_typ == 's') {
					$msgbody .= "<td align='center'><p style='color:#e99005'>Shop Address</p></td>";
				} else {
					$msgbody .= "<td align='center'><p style='color:#e99005'>Shipping Address</p></td>";
				}
				$msgbody .= "
				  </tr>
				  <tr>
					  <td>$blngcmpltadrs</td>
					  <td>$shpcmpltadrs</td>
				  </tr>
			  </table>
		  </td>
	  </tr>

	  <tr>
		  <td height='10'  bgcolor='#ffffff' class='spacer' style='margin-top:0;margin-right:0;margin-bottom:0;margin-left:0;padding-top:0;padding-right:0;padding-bottom:0;padding-left:0;text-align:left;-webkit-text-size-adjust:none;font-size:0;line-height:0;'>&nbsp;</td>
	  </tr>
  </table>
  <table width='605' border='0' align='center' cellpadding='0' cellspacing='0'>
	  <tr>
		  <tr>
			  <td height='10'  bgcolor='#ffffff' class='spacer' style='margin-top:0;margin-right:0;margin-bottom:0;margin-left:0;padding-top:0;padding-right:0;padding-bottom:0;padding-left:0;text-align:left;-webkit-text-size-adjust:none;font-size:0;line-height:0;'>&nbsp;</td>
		  </tr>";

				$msgbody .= "<td><p>Thank You order with $usr_cmpny.</p>
		  We hope to see you soon again<br>
		  <a href='mailto:$u_prjct_mnurlhttp' style='color:#e99005; text-decoration:none'>$usr_cmpny</a>.<br>
		  </p></td>
	  </tr>
  </table>
</div>
</body>
</html>";

			// echo $msgbody; exit;		
					$to = $bemail;
					$from = $u_prjct_email;
					//	$subject  = "Your $usr_cmpny order " .$ordcode." Payment Confirm";
					$subject = "Your order $usr_cmpny " . $ordcode . " Payment Confirm";
					$headers = "From: " . $from . "\r\n";
					$headers .= "CC: " . $from . "\r\n";
					$headers .= "MIME-Version: 1.0\r\n";
					$headers .= "Content-Type: text/html; charset=ISO-8859-1\r\n";
					mail($to, $subject, $msgbody, $headers);
				}
				//Cod Staus
			}
		}
		$uqryordsts_dtl = "UPDATE ordsts_dtl SET ordstsd_sts = 'd',	ordstsd_crtdon	= '$crnt_dt',ordstsd_crtdby	= '$ses_admin' WHERE ordstsd_ordstsm_id='$stsid' AND ordstsd_crtordm_id='$orderid'";
		// echo $uqryordsts_dtl; exit;
		$srsordsts_dtl = mysqli_query($conn, $uqryordsts_dtl);
		$iqryordsts_mst = "INSERT INTO ordsts_dtl(ordstsd_ordstsm_id,ordstsd_crtordm_id,ordstsd_dttm,ordstsd_desc,ordstsd_crtdon,ordstsd_crtdby)VALUES('$stsid','$orderid','$stsdt','$desc','$crnt_dt','$ses_admin')";
		$irsordsts_mst = mysqli_query($conn, $iqryordsts_mst);
		if ($irsordsts_mst == true) {
			$sqryordsts_mst = "SELECT ordstsm_name, ordstsm_desc FROM ordsts_mst WHERE ordstsm_id='$stsid'";
			$srsordsts_mst = mysqli_query($conn, $sqryordsts_mst);
			$srowordsts_mst = mysqli_fetch_assoc($srsordsts_mst);
			$db_ordstsnm = $srowordsts_mst['ordstsm_name'];
			$db_ordstsdesc = $desc;
			//$hdimg = "http://".$u_prjct_mnurl."/".$site_logo;//Return the URL
			$hdimg = "http://" . $u_prjct_mnurl . "/" . $site_mail_logo;
			$sqrycrtord_mst = "SELECT crtordm_id,crtordm_code,crtordm_fstname,crtordm_lstname,  crtordm_badrs,crtordm_badrs2,crtordm_bcmpny, blcty.ctym_name as bctynm,blcnty.cntym_name as bcntynm, crtordm_bzip,blcntry.cntrym_name as bcntrynm,crtordm_bdayphone, crtordm_emailid,crtordm_sfstname,crtordm_slstname,crtordm_sadrs, crtordm_sadrs2,crtordm_scmpny,shpcty.ctym_name as sctynm, shpcnty.cntym_name as scntynm, shpcnty.cntym_id as scntyid, crtordm_szip,shpcntry.cntrym_name as scntrynm,crtordm_codamt, crtordm_sdayphone,crtordm_semailid,crtordm_qty,crtordm_amt,crtordm_wt, crtordm_pmode,crtordm_prcssts,crtordm_cartsts,crtordm_paysts,crtordm_rmks, crtordm_shpchrgm_id,crtordm_shpchrgamt,crtordm_cpnm_val,crtordm_mbrm_id, crtordm_ordtyp,date_format(crtordm_crtdon,'%d-%m-%Y') as crtordm_crtdon_dt, date_format(crtordm_crtdon,'%h:%i:%s') as crtordm_crtdon_tm, crtordm_hsncde,crtordm_igst,cpnm_name,crtordm_cpnm_id,crtordm_cpnm_typ from crtord_mst crtord 
					left join cty_mst blcty on blcty.ctym_id = crtord.crtordm_bmbrctym_id
					left join cty_mst shpcty on shpcty.ctym_id = crtord.crtordm_smbrctym_id 
					left join cnty_mst blcnty on blcnty.cntym_id = blcty.ctym_cntym_id 
					left join cnty_mst shpcnty on shpcnty.cntym_id = shpcty.ctym_cntym_id
					left join cntry_mst blcntry on blcntry.cntrym_id= blcnty.cntym_cntrym_id 
					left join cntry_mst shpcntry on shpcntry.cntrym_id= shpcnty.cntym_cntrym_id	
					left join shpng_mst on crtord.crtordm_shpchrgm_id = shpngm_id	
					left join cpn_mst on cpn_mst.cpnm_id = crtordm_cpnm_id 
				where crtordm_id = '$orderid'";
			// echo $sqrycrtord_mst; exit;
			$srscrtord_mst = mysqli_query($conn, $sqrycrtord_mst);
			$cntord_rec = mysqli_num_rows($srscrtord_mst);
			if ($cntord_rec > 0) {
			
				$srowcrtord_mst = mysqli_fetch_assoc($srscrtord_mst);
				$crtord_id = $srowcrtord_mst['crtordm_id'];
				$bfname = $srowcrtord_mst['crtordm_fstname'];
				$blname = $srowcrtord_mst['crtordm_lstname'];
				$bemail = $srowcrtord_mst['crtordm_emailid'];
				$ordcode = $srowcrtord_mst['crtordm_code'];
				$ordmid = base64_encode($srowcrtord_mst['crtordm_id']);
				$orddate = $srowcrtord_mst['crtordm_crtdon_dt'] . " " . $srowcrtord_mst['crtordm_crtdon_tm'];
				$shipname = $srowcrtord_mst['shpchrgm_name'];
				$shpprc = $srowcrtord_mst['crtordm_shpchrgamt'];
				$sfname = $srowcrtord_mst['crtordm_sfstname'];
				$slname = $srowcrtord_mst['crtordm_slstname'];
				$sadrs = $srowcrtord_mst['crtordm_sadrs'];
				$sadrs2 = $srowcrtord_mst['crtordm_sadrs2'];
				$scty = $srowcrtord_mst['sctynm'];
				$scounty = $srowcrtord_mst['scntynm'];
				$scountry = $srowcrtord_mst['scntrynm'];
				$badrs = $srowcrtord_mst['crtordm_badrs'];
				$badrs2 = $srowcrtord_mst['crtordm_badrs2'];
				$bcty = $srowcrtord_mst['bctynm'];
				$bcounty = $srowcrtord_mst['bcntynm'];
				$bcountry = $srowcrtord_mst['bcntrynm'];
				$bzip = $srowcrtord_mst['crtordm_bzip'];
				$bemail = $srowcrtord_mst['crtordm_emailid'];
				$bphno = $srowcrtord_mst['crtordm_bdayphone'];
				$szip = $srowcrtord_mst['crtordm_szip'];
				$semail = $srowcrtord_mst['crtordm_semailid'];
				$sphno = $srowcrtord_mst['crtordm_sdayphone'];
				$ordamt = $srowcrtord_mst['crtordm_amt'];
				$shipprc = $srowcrtord_mst['crtordm_shpchrgamt'];
				$crtwt = $srowcrtord_mst['crtordm_wt'];
				$totcrtprc = $ordamt + $shipprc;
				$db_pmode = funcPayMod($srowcrtord_mst['crtordm_pmode']);
				$db_psts = funcDispCrnt($srowcrtord_mst['crtordm_paysts']);
				$db_ordqty = $srowcrtord_mst['crtordm_qty'];
				$db_ordamt = $srowcrtord_mst['crtordm_amt'];
				$db_ordrmks = $srowcrtord_mst['crtordm_rmks'];
				$dispsy = $db_psts;
				$shpcmpltadrs = "";
				
				if ($bemail != '') {
					$shpcmpltadrs = $bemail;
				}
				if ($sfname != '') {
					$shpcmpltadrs .= "<br/>" . $sfname;
				}
				if ($slname != '') {
					$shpcmpltadrs .= "&nbsp;" . $slname;
				}
				if ($sadrs != '') {
					$shpcmpltadrs .= "<br>" . $sadrs;
				}
				if ($sadrs2 != '') {
					$shpcmpltadrs .= ",&nbsp;" . $sadrs2;
				}
				if ($scty != '') {
					$shpcmpltadrs .= "<br>" . $scty;
				}
				if ($scounty != '') {
					$shpcmpltadrs .= ",&nbsp;" . $scounty;
				}
				if ($scountry != '') {
					$shpcmpltadrs .= "<br>" . $scountry;
				}
				if ($szip != '') {
					$shpcmpltadrs .= ",&nbsp;Zip Code :&nbsp;" . $szip;
				}
				if ($sphno != '') {
					$shpcmpltadrs .= "<br>Mobile No :&nbsp;" . $sphno;
				}
				$blngcmpltadrs = "";
				if ($bemail != '') {
					$blngcmpltadrs = $bemail;
				}
				if ($bfname != '') {
					$blngcmpltadrs .= "<br/>" . $bfname;
				}
				if ($blname != '') {
					$blngcmpltadrs .= "&nbsp;" . $blname;
				}
				if ($badrs != '') {
					$blngcmpltadrs .= "<br>" . $badrs;
				}
				if ($badrs2 != '') {
					$blngcmpltadrs .= ",&nbsp;" . $badrs2;
				}
				if ($bcty != '') {
					$blngcmpltadrs .= "<br>" . $bcty;
				}
				if ($bcounty != '') {
					$blngcmpltadrs .= ",&nbsp;" . $bcounty;
				}
				if ($bcountry != '') {
					$blngcmpltadrs .= "<br>" . $bcountry;
				}
				if ($bzip != '') {
					$blngcmpltadrs .= ",&nbsp;Zip Code :&nbsp;" . $bzip;
				}
				if ($bphno != '') {
					$blngcmpltadrs .= "<br>Mobile No :&nbsp;" . $bphno;
				}
				
				$orddate = date('l jS F Y', strtotime($orddate));
				$stsdate = date('l jS F Y', strtotime($stsdt));
				
				$msgbody = "<!DOCTYPE HTML PUBLIC '-//W3C//DTD HTML 4.01//EN' 'http://www.w3.org/TR/html4/strict.dtd'>
				<html>
				<head>
				<meta http-equiv='Content-Type' content='text/html; charset=utf-8'>
				<meta name='viewport' content='width=device-width, initial-scale=1.0'/>
				<title>$usr_cmpny | Order Information</title>
				<style type='text/css'>
				#outlook a{padding:0}body{width:100% !important;-webkit-text-size-adjust:100%;-ms-text-size-adjust:100%;margin:0;padding:0;background-color:#fff;font-family:Arial,Helvetica,sans-serif;font-size:16px}p{margin-top:0;margin-bottom:10px}table td{border-collapse:collapse}table{border-collapse:collapse;mso-table-lspace:0pt;mso-table-rspace:0pt}img{outline:none;text-decoration:none;-ms-interpolation-mode:bicubic}a img{border:none}.image_fix{display:block}
				</style>
				</head>
				<body style='margin:0; background-color:#ffffff;' marginheight='0' topmargin='0' marginwidth='0' leftmargin='0'>
				<div style='background-color:#fff;'>
					<table style='background-color: #ffffff;' width='100%' border='0' cellspacing='0' cellpadding='0'>
					<tr>
						<td> <table style='background-color:#ffffff;padding:0' background='#ffffff' width='605' border='0' align='center' cellpadding='0' cellspacing='0'>

<tr>
<td><a href='https://" . $u_prjct_mnurl . "/home' ><img src='https://www.ashokatyre.com/images/ashokatyre-logo.png' alt='$usr_cmpny' hspace='10' vspace='15' width='200'></a></td>

<td align='right' width='50%'> <a href='https://www.ashokatyre.com/list-order' target='_blank' style='color:#e99005; margin-right:10px;'>Your Orders</a> | <a href='https://www.ashokatyre.com/' target='_blank' style='color:#e99005; margin-left:10px;'>ashokatyre.com</a><br>
<h2 style='margin-top:5px; margin-bottom:5px; font-family: Georgia, 'Times New Roman', Times, serif; font-size:30px'>Order Information</h2>
<p>$ordcode</p> </td>
</tr>
</table>
						<table style='background-color:#ffffff;padding:0' background='#ffffff' width='605' border='0' align='center' cellpadding='0' cellspacing='0'>
							
							<tr>
							<td height='4' valign='top' bgcolor='#cccccc' class='spacer'    style='margin-top:0;margin-right:0;margin-bottom:0;margin-left:0;padding-top:0;padding-right:0;padding-bottom:0;padding-left:0;text-align:left;-webkit-text-size-adjust:none;font-size:0;line-height:0;'>&nbsp;</td>
							</tr>
							<tr>
							<td height='10' valign='top' bgcolor='#fff' class='spacer'    style='margin-top:0;margin-right:0;margin-bottom:0;margin-left:0;padding-top:0;padding-right:0;padding-bottom:0;padding-left:0;text-align:left;-webkit-text-size-adjust:none;font-size:0;line-height:0;'>&nbsp;</td>
							</tr>
							<tr>
							<td valign='top' bgcolor='#ffffff'><p style='font-family:Arial, Helvetica, sans-serif; color:#e99005; font-weight:bold;'>Dear $bfname,</p>
								<p style='font-family:Arial, Helvetica, sans-serif; font-size:14px;'>Thank you for your order $ordcode <br> $db_ordstsnm on " . $stsdate . ".</p>
								<p style='font-family:Arial, Helvetica, sans-serif; font-size:14px;'>
								If  you have any queries about your order, kindly contact our <a href=''https://" . $u_prjct_mnurl . "/contact-us' target='_blank' style='color:#ff6600; text-decoration:none'>Customer Care</a></p></td>
							</tr>
						</table>
					<table align='center' width='605' cellpadding='0' cellspacing='0' bgcolor='#ffffff' style='background-color:#ffffff'>
							<tr>
								<td>&nbsp;</td>
							</tr>
							<tr>
								<td>$desc</td>
							</tr>
								
						</table>
					</table>
					
					<table width='605' border='0' align='center' cellpadding='0' cellspacing='0'>
							<tr>
								<tr>
							<td height='10'  bgcolor='#ffffff' class='spacer'    style='margin-top:0;margin-right:0;margin-bottom:0;margin-left:0;padding-top:0;padding-right:0;padding-bottom:0;padding-left:0;text-align:left;-webkit-text-size-adjust:none;font-size:0;line-height:0;'>&nbsp;</td>
							</tr>
							<td>
							<p>Thank You order with $usr_cmpny.</p>

								


We hope to see you soon again<br>
<a href='mailto:$u_prjct_mnurlhttp' style='color:#e99005; text-decoration:none'>$usr_cmpny</a>.<br>



								</p>
							</td>
							</tr>
						</table>
					
					</body>
					</html>";
			//	echo $msgbody;exit;
				$to = $bemail; 
				$from = $u_prjct_email;
				$subject = "Your order $usr_cmpny " . $ordcode . " $db_ordstsnm";
				$headers = "From: " . $from . "\r\n";
				$headers .= "CC: " . $from . "\r\n";
				$headers .= "MIME-Version: 1.0\r\n";
				$headers .= "Content-Type: text/html; charset=ISO-8859-1\r\n";
				mail($to, $subject, $msgbody, $headers);
				// echo $msgbody;
			}
			$gmsg = "Record Updated successfully";
		}
	} else {
		$gmsg = "Duplicate name. Record not updated";
	}
}
?>