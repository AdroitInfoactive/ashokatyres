<?php
session_start();

include_once '../includes/inc_config.php';       //Making paging validation	
include_once '../includes/inc_connection.php';        //Clearing the cache information
// include_once '../includes/inc_usr_sessions.php';    //checking for session
include_once '../includes/inc_connection.php';     //Making database Connection
include_once '../includes/inc_nocache.php';;  //checking for session	
include_once "../includes/inc_usr_functions.php";//Making database Connection	
require('config.php');
require('razorpay-php/Razorpay.php');
error_reporting(0);
use Razorpay\Api\Api;
use Razorpay\Api\Errors\SignatureVerificationError;

$success = true;
$error = "Payment Failed";

if (empty($_POST['razorpay_payment_id']) === false)
{
	$api = new Api($keyId, $keySecret);
	try
	{
		// Please note that the razorpay order ID must
		// come from a trusted source (session here, but
		// could be database or something else)
		$attributes = array(
			'razorpay_order_id' => $_SESSION['razorpay_order_id'],
			'razorpay_payment_id' => $_POST['razorpay_payment_id'],
			'razorpay_signature' => $_POST['razorpay_signature']
		);
		$api->utility->verifyPaymentSignature($attributes);
	}
	catch(SignatureVerificationError $e)
	{
		$success = false;
		$error = 'Razorpay Error : ' . $e->getMessage();
	}
}
else
{
	?>
		<script language="javascript" type="text/javascript">
			location.href = "https://www.mamathatulluri.com/cancel";
		</script>
	<?php
}
if ($success === true)
{

  $txn_odrid =  $_POST['razorpay_orderid'];       
  //$txn_odrid =  1078;
	$uqrycrtord_mst = "UPDATE 
										crtord_mst set crtordm_paysts = 'y'
										where
							     	crtordm_id = '$txn_odrid'";
          					$resuqrycrtord_mst = mysqli_query($conn,$uqrycrtord_mst);
	if($resuqrycrtord_mst==true)
	{
		$uqrycrtordsts_mst = "UPDATE 
																ordsts_dtl set ordstsd_ordstsm_id = '1'
																where
																ordstsd_crtordm_id = '$txn_odrid'";
		$resuqrycrtordsts_mst = mysqli_query($conn,$uqrycrtordsts_mst);
		$usrsesid 	= $_POST['crtsesid'];
		$sqrycrtord_mst = "select
									crtordm_id,crtordm_code,crtordm_fstname,crtordm_lstname, 
									crtordm_badrs,crtordm_badrs2,crtordm_bcmpny,
									blcty.ctym_name as bctynm,blcnty.cntym_name as bcntynm,
									crtordm_bzip,blcntry.cntrym_name as bcntrynm,crtordm_bdayphone,
									crtordm_emailid,crtordm_sfstname,crtordm_slstname,crtordm_sadrs,
									crtordm_sadrs2,crtordm_scmpny,shpcty.ctym_name as sctynm,
									shpcnty.cntym_name as scntynm,
									shpcnty.cntym_id as scntyid,
									crtordm_szip,shpcntry.cntrym_name as scntrynm,crtordm_codamt,
									crtordm_sdayphone,crtordm_semailid,crtordm_qty,crtordm_amt,crtordm_wt,
									crtordm_pmode,crtordm_prcssts,crtordm_cartsts,crtordm_paysts,crtordm_rmks,
									crtordm_shpchrgm_id,crtordm_shpchrgamt,crtordm_cpnm_val,crtordm_mbrm_id,
									crtordm_ordtyp,date_format(crtordm_crtdon,'%d-%m-%Y') as crtordm_crtdon_dt,
									date_format(crtordm_crtdon,'%h:%i:%s') as crtordm_crtdon_tm,
									crtordm_hsncde,crtordm_igst,cpnm_name,crtordm_cpnm_id,crtordm_cpnm_typ								
							  from
									crtord_mst crtord 
									left join cty_mst blcty on blcty.ctym_id = crtord.crtordm_bmbrctym_id
									left join cty_mst shpcty on shpcty.ctym_id = crtord.crtordm_smbrctym_id 
									
									left join cnty_mst blcnty on blcnty.cntym_id = blcty.ctym_cntym_id 
									left join cnty_mst shpcnty on shpcnty.cntym_id = shpcty.ctym_cntym_id
									
									left join cntry_mst blcntry on blcntry.cntrym_id= blcnty.cntym_cntrym_id 
									left join cntry_mst shpcntry on shpcntry.cntrym_id= shpcnty.cntym_cntrym_id	
									left join shpng_mst on crtord.crtordm_shpchrgm_id = shpngm_id	
								    left join cpn_mst on cpn_mst.cpnm_id = crtordm_cpnm_id 
								
								where 
									crtordm_id = '$txn_odrid'";
									//echo $sqrycrtord_mst; exit;
					$srscrtord_mst = mysqli_query($conn,$sqrycrtord_mst);
					$cntord_rec	   = mysqli_num_rows($srscrtord_mst);
					if($cntord_rec > 0)
					{			
						$srowcrtord_mst = mysqli_fetch_assoc($srscrtord_mst);
						$crtord_id	= $srowcrtord_mst['crtordm_id'];											
						$bfname  	= $srowcrtord_mst['crtordm_fstname'];
						$blname	  	= $srowcrtord_mst['crtordm_lstname'];	
						$bemail 	= $srowcrtord_mst['crtordm_emailid'];
						$ordcode 	= $srowcrtord_mst['crtordm_code'];
						$ordmid	 	= base64_encode($srowcrtord_mst['crtordm_id']);
						$orddate 	= $srowcrtord_mst['crtordm_crtdon_dt']." ".$srowcrtord_mst['crtordm_crtdon_tm'];
						// $shipname 	= $srowcrtord_mst['shpchrgm_name'];	 
						$shpprc  	= $srowcrtord_mst['crtordm_shpchrgamt'];
						$sfname   	= $srowcrtord_mst['crtordm_sfstname'];	 
						$slname	  	= $srowcrtord_mst['crtordm_slstname'];	 			   
						$sadrs	  	= $srowcrtord_mst['crtordm_sadrs'];
						$sgst   	= $srowcrtord_mst['crtordm_sadrs2'];
						$scom   	= $srowcrtord_mst['crtordm_scmpny'];
						$scty 	  	= $srowcrtord_mst['sctynm'];
						$scounty  	= $srowcrtord_mst['scntynm'];
						$scountyid  = $srowcrtord_mst['scntyid'];
						$scountry 	= $srowcrtord_mst['scntrynm'];
						$badrs	  	= $srowcrtord_mst['crtordm_badrs'];
						$bgst   	= $srowcrtord_mst['crtordm_badrs2'];
						$bcom   	= $srowcrtord_mst['crtordm_bcmpny'];
						$bcty 	  	= $srowcrtord_mst['bctynm'];
						$bcounty  	= $srowcrtord_mst['bcntynm'];
						$bcountry 	= $srowcrtord_mst['bcntrynm'];
						$bzip	  	= $srowcrtord_mst['crtordm_bzip'];		
						$bemail	  	= $srowcrtord_mst['crtordm_emailid'];
						$bphno	  	= $srowcrtord_mst['crtordm_bdayphone'];
						$szip	  	= $srowcrtord_mst['crtordm_szip'];		
						$semail	  	= $srowcrtord_mst['crtordm_semailid'];	
						$sphno	  	= $srowcrtord_mst['crtordm_sdayphone'];
						$ordamt	  	= $srowcrtord_mst['crtordm_amt'];
						$shpamt	  	= $srowcrtord_mst['crtordm_shpchrgamt'];
						$crtwt	  	= $srowcrtord_mst['crtordm_wt'];
						$totcrtprc 	= $ordamt + $shipprc;
						// $srowcrtord_mst['crtordm_pmode'];
						$db_pmode 	= funcPayMod($srowcrtord_mst['crtordm_pmode']);
						//$db_pmode 	= $srowcrtord_mst['shpchrgm_name'];
						$dispsy 	= funcDispCrnt($srowcrtord_mst['crtordm_paysts']);
						$db_ordqty	= $srowcrtord_mst['crtordm_qty'];
						$db_ordamt	= $srowcrtord_mst['crtordm_amt'];
						$db_ordrmks	= $srowcrtord_mst['crtordm_rmks'];
						$db_codamt	= $srowcrtord_mst['crtordm_codamt'];
						$hsncde	= $srowcrtord_mst['crtordm_hsncde'];
						$crtgst	= $srowcrtord_mst['crtordm_igst'];
						$shpmnid  = $srowcrtord_mst['crtordm_shpchrgm_id']; 
						$cupid  = $srowcrtord_mst['crtordm_cpnm_id'];
						$cupnm  = $srowcrtord_mst['cpnm_name'];
						$cupval  = $srowcrtord_mst['crtordm_cpnm_val'];
						$cuptyp  = $srowcrtord_mst['crtordm_cpnm_typ'];
						$shpchrges_qry = "SELECT shpngm_id,shpngm_prc from shpng_mst where shpngm_sts = 'a' and shpngm_id = '$shpmnid'";
						$shpngchrges_mst = mysqli_query($conn,$shpchrges_qry);
						$num_rows = mysqli_num_rows($shpngchrges_mst);
						if($num_rows > 0 )
						{
							$shpngchrges_dtl = mysqli_fetch_assoc($shpngchrges_mst);
							$shpmnprc = $shpngchrges_dtl['shpngm_prc'];
						} 
						if(($scounty == "Telangana")||($scountyid == 115))
						{
							$nmstrws = 1;
						}			
						//$dispsy    ="No";
						$shpcmpltadrs ="";					
						if($sfname != ''){
							$shpcmpltadrs = $sfname;	
						}						 
						if($slname != ''){
							$shpcmpltadrs .= "&nbsp;".$slname;	
						}
						if($sadrs != ''){
							$shpcmpltadrs .= "<br>".$sadrs;	
						}						 
						if($sgst != ''){
							$shpcmpltadrs .= ",&nbsp;GST Number :&nbsp;".$sgst;	
						}
							if($scom != ''){
							$shpcmpltadrs .="<br>". ",&nbsp;Company :&nbsp;".$scom;	
						}						 
						if($scty != ''){
							$shpcmpltadrs .= "<br>".$scty;	
						}						 
						if($scounty != ''){
							$shpcmpltadrs .= ",&nbsp;".$scounty;	
						}						 
						if($scountry != ''){
							$shpcmpltadrs .= "<br>".$scountry;	
						}						 
						if($szip != ''){
							$shpcmpltadrs .= ",&nbsp;Zip Code :&nbsp;".$szip;	
						}
						if($sphno != ''){
							$shpcmpltadrs .= "<br>Mobile No :&nbsp;".$sphno;	
						}	
						if($bemail != ''){
							$shpcmpltadrs .= "<br>".$bemail;	
						}
						$blngcmpltadrs ="";					
						if($bfname != ''){
							$blngcmpltadrs = $bfname;	
						}						 
						if($blname != ''){
							$blngcmpltadrs .= "&nbsp;".$blname;	
						}						 
						if($badrs != ''){
							$blngcmpltadrs .= "<br>".$badrs;	
						}						 
						if($bgst != ''){
							$blngcmpltadrs .= ",&nbsp;GST Number :&nbsp;".$bgst;	
						}
							if($bcom != ''){
							$blngcmpltadrs .="<br>". ",&nbsp;Company :&nbsp;".$bcom;	
						}						 
						if($bcty != ''){
							$blngcmpltadrs .= "<br>".$bcty;	
						}						 
						if($bcounty != ''){
							$blngcmpltadrs .= ",&nbsp;".$bcounty;	
						}						 
						if($bcountry != ''){
							$blngcmpltadrs .= "<br>".$bcountry;	
						}						 
						if($bzip != ''){
							$blngcmpltadrs .= ",&nbsp;Zip Code :&nbsp;".$bzip;	
						}
						if($bphno != ''){
							$blngcmpltadrs .= "<br>Mobile No :&nbsp;".$bphno;	
						}
						if($bemail != ''){
							$blngcmpltadrs .= "<br>".$bemail;	
						}	   
			    	$dt = "DEL-".date('my')."-";
						$hdimg    = "http://".$u_prjct_mnurl."/".$site_logo;//Return the URL	
						$orddate	= date('l jS F Y',strtotime($orddate));															
			$msgbody="<!DOCTYPE HTML PUBLIC '-//W3C//DTD HTML 4.01//EN' 'http://www.w3.org/TR/html4/strict.dtd'>
			<html>
			<head>
			<meta http-equiv='Content-Type' content='text/html; charset=utf-8'>
			<meta name='viewport' content='width=device-width, initial-scale=1.0'/>
			<title>$usr_cmpny | Order has been logged, payment is pending</title>
			<style type='text/css'>
			#outlook a{padding:0}body{width:100% !important;-webkit-text-size-adjust:100%;-ms-text-size-adjust:100%;margin:0;padding:0;background-color:#fff;font-family:Arial,Helvetica,sans-serif;font-size:12px}p{margin-top:0;margin-bottom:10px}table td{border-collapse:collapse}table{border-collapse:collapse;mso-table-lspace:0pt;mso-table-rspace:0pt}img{outline:none;text-decoration:none;-ms-interpolation-mode:bicubic}a img{border:none}.image_fix{display:block} a{color:#109547; text-decoration:none;} a:hover{color:#ea7724; text-decoration:none;}
			</style>
			</head>
			<body style='margin:0; background-color:#ffffff;' marginheight='0' topmargin='0' marginwidth='0' leftmargin='0'>
			<div style='background-color:#fff;'>
				<table style='background-color: #ffffff;' width='100%' border='0' cellspacing='0' cellpadding='0'>
				<tr>
					<td><table style=' background-color:#ffffff' background='#ffffff' width='605' border='0' align='center' cellpadding='20' cellspacing='0'>
						<tr>
						<td valign='top' bgcolor='#ffffff'><table width='181' border='0' align='left' cellpadding='0' cellspacing='0'>
							<tr>
								<td valign='top' align='center' bgcolor='#FFFFFF'><a href='".$u_prjct_mnurl."home' ><img src='".$hdimg."' alt='$usr_cmpny'  border='0'></a></td>
							</tr>
							</table></td>
						</tr>
					</table>
					<table style='background-color:#ffffff;padding:0' background='#ffffff' width='605' border='0' align='center' cellpadding='0' cellspacing='0'>
						<tr>
						<td valign='top' bgcolor='#ffffff'>
							<h2 style='margin-top:5px; margin-bottom:5px; font-family:Arial, Helvetica, sans-serif;font-size:25px'>Order Information</h2></td>
						</tr>
						<tr>
						<td height='4' valign='top' bgcolor='#cccccc' class='spacer'    style='margin-top:0;margi n-right:0;margin-bottom:0;margin-left:0;padding-top:0;padding-right:0;padding-bottom:0;padding-left:0;text-align:left;-webkit-text-size-adjust:none;font-size:0;line-height:0;'>&nbsp;</td>
						</tr>
						<tr>
						<td height='10' valign='top' bgcolor='#fff' class='spacer'    style='margin-top:0;margin-right:0;margin-bottom:0;margin-left:0;padding-top:0;padding-right:0;padding-bottom:0;padding-left:0;text-align:left;-webkit-text-size-adjust:none;font-size:0;line-height:0;'>&nbsp;</td>
						</tr>
						<tr>
						<td valign='top' bgcolor='#ffffff'><p style='font-family:Arial, Helvetica, sans-serif; font-size:14px;'>Dear $bfname,</p>
						<p style='font-family:Arial, Helvetica, sans-serif; font-size:14px;'>Thank you for placing your order. </p>
							</td>
						</tr>
					</table>
					<table width='605' border='0' align='center' cellpadding='0' cellspacing='0' bgcolor='#ffffff' style='background-color:#ffffff'>
						<tr>
						<td  bgcolor='#ffffff' ><p style='color:#d31b12; font-family:Arial, Helvetica, sans-serif; margin-top:5px; margin-bottom:5px'>Address Details:</p></td>
						</tr>
						<tr>
						<td ><table width='605' border='1' cellspacing='0' cellpadding='5' bordercolor='#dfdfdf' style='border:1px solid #dfdfdf'>
							<tr>
								<td align='center'><p style='color:#d31b12'>Billing Address</p></td>
								<td align='center'><p style='color:#d31b12'>Shipping Address</p></td>
							</tr>
							<tr>
								<td>$blngcmpltadrs</td>
								<td>$shpcmpltadrs</td>
							</tr><tr>
							<tr>
								<td align='center'><p style='color:#d31b12'>Payment Mode</p></td>
								<td align='center'><p style='color:#d31b12'>Payment Status</p></td>
								</tr>
								<tr><td align='center'>$db_pmode</td>
								<td align='center'>$dispsy</td></tr></tr>
							</table></td>
						</tr>
						<tr>
						<td height='10'  bgcolor='#ffffff' class='spacer'    style='margin-top:0;margin-right:0;margin-bottom:0;margin-left:0;padding-top:0;padding-right:0;padding-bottom:0;padding-left:0;text-align:left;-webkit-text-size-adjust:none;font-size:0;line-height:0;'>&nbsp;</td>
						</tr>
					</table>
					<table width='605' border='1' align='center' cellpadding='5' cellspacing='0' bordercolor='#dfdfdf' style='border:1px solid #dfdfdf' >
						<tr valign='top'>
						<td align='center' ><p style='color:#d31b12'>Order No</p></td>
						<td align='center'><p style='color:#d31b12'>Order Date</p></td>
					
						</tr>
						<tr valign='top'>
						<td align='center'  >$ordcode</td> 
						<td align='center' >$orddate</td>
						
						</tr> 
					</table>
					<table align='center' width='605'  cellpadding='0' cellspacing='0' bgcolor='#ffffff' style='background-color:#ffffff'>
						<tr>
						<td><p style='color:#d31b12;font-family:Arial, Helvetica, sans-serif;margin-top:5px; margin-bottom:5px'>Your Recent Order:</p></td>
						</tr>
						<tr>
						<td><table width='100%' cellpadding='5' cellspacing='0' border='1' bordercolor='#dfdfdf' style='border:1px solid #dfdfdf'>
							<tr >
								<td  valign='middle' colspan='2'><p style='color:#d31b12'>Product</p></td>
								<td  valign='middle'><p style='color:#d31b12'>Price</p></td>";
								if($nmstrws == 1)
								{ 
									 $msgbody.=" <td  valign='middle'><p style='color:#d31b12'>CGST</p></td>
									<td  valign='middle'><p style='color:#d31b12'>SGST</p></td>"; 
								}
								else
								{
								$msgbody.=" <td  valign='middle'><p style='color:#d31b12'>TAX</p></td>";
								}
								 $msgbody.="<td  valign='middle'><p style='color:#d31b12'>Price + Tax</p></td><td  valign='middle'><p style='color:#d31b12'>Qty</p></td><td align='right' valign='middle'><p style='color:#d31b12'>Total Price</p>                                </td>
							</tr>";
							//Your order has been logged and we are waiting for the payment. Once we received the payment the order will be confirmed and expected date of dispatch of your order is $orddate
										/* $sqrycrtord_dtl ="select 
																prodm_code,prodm_hsn,prodm_gst,crtordd_id,crtordd_qty,crtordd_prc,
																(crtordd_prc * crtordd_qty) as crtorddprd_prc,prodprcd_prc,
																crtordd_prc as unprcval,prodm_name,untm_name,concat(szd_name,' ',szm_name) as szd_name
															from 
																crtord_dtl 
															inner join 
																vw_prod_unt_dtl 
															on 
																(crtordd_prodm_id=prodm_id)
															where 
																crtordd_crtordm_id=$ordmstid
											group by prodm_id,untm_id order by untm_prty desc";*/
							$sqrycrtord_dtl =	"SELECT  crtordd_id, crtordd_qty,(crtordd_prc * crtordd_qty) as crtordd_prc,prodm_id,prodm_name, crtordd_prc as unprcval,prodszvrtnm_vrtn_nms,prodszvrtnm_id,prodprcm_id,prodprcm_sku,prodprcm_sleprc,prodprcm_ofrprc ,prodm_name,crtordd_igst,crtordd_cgst,crtordd_sgst
							from crtord_dtl 
							inner join prod_mst on prod_mst.prodm_id = crtord_dtl.crtordd_prodm_id 
							inner join prodsz_vrtns_mst on prodszvrtnm_id = crtordd_sizem_id 
							inner join prodprc_mst on crtordd_prodprcd_id = prodprcm_id where crtordd_crtordm_id=$txn_odrid	";	
							//concat(szd_name,' ',szm_name) as			  
							$srscrtord_dtl = mysqli_query($conn,$sqrycrtord_dtl);
							$cnttorec      = mysqli_num_rows($srscrtord_dtl);
							if($cnttorec > 0)
							{	
								$totcrtprc = "";						
								while($rowspo_mst=mysqli_fetch_assoc($srscrtord_dtl))
								{
									$prdgst =$rowspo_mst['prodm_gst'];
													
									$db_shpprc = ($rowspo_mst['crtordd_qty']*$rowspo_mst['crtordd_shpprc']);
												$msgbody.="<tr>
												<td colspan='2'>Name: $rowspo_mst[prodm_name]<br/>
												Code: $rowspo_mst[prodprcm_sku] <br/>
												Size: $rowspo_mst[prodszvrtnm_vrtn_nms]</td>
													";

												$prdtotprc = $rowspo_mst['unprcval'];
												$igstval = $rowspo_mst['crtordd_igst'];
												
																	 $gstval = $igstval;
												
												$gst = 1+($gstval/100);
											 
												 $prdprc  = $prdtotprc/$gst;
												$prdwoustgst = $prdprc; 
												$tax = $prdtotprc - $prdwoustgst;
												$totalprdprc +=	$prdprc;	
											$prdprc  =  number_format($prdprc,2,'.',',');
											$tax     = number_format($tax,2,'.',',');
											$clid = 6;
											if($nmstrws == 1){
												$gstdiv =  $tax/2;
												 $cgst =  number_format($gstdiv,2,'.',',');
												 $sgst =  number_format( $gstdiv,2,'.',',');
												$gstper = ($gstval/2)."%";
												$clid = 7;
												}
												$igstper  = $gstval."%";					
																			
											$msgbody.="
											<td valign='right'>$prdprc</td>";
											if($nmstrws == 1){
												$totalcgst += $cgst;
												$totalsgst += $sgst;
								$msgbody.="<td valign='right'>$cgst<br>$gstper</td>
											<td valign='right'>$sgst<br>$gstper</td>
											";		
												}else{
													$totaltax += $tax;
							$msgbody.="<td valign='right'>$tax<br>($igstper)</td>
							";		
													
												}
												
												$totalqnty +=  $rowspo_mst['crtordd_qty'];
												$totlprodtotprc += $prdtotprc;
																	$msgbody.="<td>$prdtotprc</td><td>$rowspo_mst[crtordd_qty]</td><td align='right' valign='right'>";
																	$totitmprc = ($rowspo_mst['crtordd_prc']); 
																		$ntitmprc += $totitmprc;
																	
																	$totcrtprc +=  $totitmprc+$db_shpprc;
																									
																	
																	
																	$untbx_prc 		   = ($rowspo_mst['crtordd_prc'] + $rowspo_mst['crtordd_shpprc']);
																
																	$msgbody.=   number_format($totitmprc+$db_shpprc,2,".",",")."
																	</td>
																	
																							
																
																
																
																
																								
																								</tr>";							
																							}
																						}		
																						$grscrtprc = $totcrtprc + $shpmnprc;
																		//	echo "%%%%%%".$shipprc;			
																		$msgbody.="<tr><td colspan='2'></td>
																		";
																		$totalprdprc =  number_format($totalprdprc,2,'.',',');
																		$msgbody.="<td>$totalprdprc</td>";
																		if($nmstrws == 1){
																			$msgbody.="<td>$totalcgst</td>";
																			$msgbody.="<td>$totalsgst</td>";
																		}else{
																			$msgbody.="<td>$totaltax</td>";
																		}
																		$prodcost = number_format($ntitmprc,2,'.',',');
																			$msgbody.="<td>$totlprodtotprc</td><td>$totalqnty</td>
																			
																		<td align='right'>Product Cost:$prodcost";
																						/*if($shipprc > 0){ }
																							$msgbody.="<br/>Ship Cost:";*/
																							
																				if($db_codamt > 0){
																					$grscrtprc = ($grscrtprc+$db_codamt);
																					$codammt = number_format($db_codamt,2,'.',',');
																					}
																				if($db_codamt > 0){
																					$msgbody.="<br/>COD Cost:$codammt";
																				}
																			
																				if($cupid!=0){
																					$msgbody.= "<br><b>Coupon(Applied)-$cupnm : </b>";
																				

																					$totlprdprc -= $cupval;
										
																					$msgbody.= "-<b>$cupval </b>"; 
										
																													}
																											
																												$shpngchrges = number_format($shpmnprc,2,'.',',');
																							if($totcrtprc < 600){
																		$totcrtprc +=  $shpmnprc;
																		
																		$msgbody.= "<br><b>SHIPPING CHARGES :$shpngchrges</b>";
																												
																		}else{
																	
																			
																	$totcrtprc +=  $shpprc;		
											//	$msgbody.= "<br><strong>Shipping Charges Not Appilcable for More than 3000 Purchase: </strong>";
													$msgbody.= "<br><strong>Shipping Charges :$shpngchrges </strong>";
												
																			}
																							
										
										 if($db_codamt > 0){
											$msgbody.="<br/>COD Cost:";
										 }
										 $msgbody.="</td>";
					
							// <td align='right' valign='middle'>".number_format($ntitmprc,2,'.',',');
								// 	 if($cupid!=0){
								 
								// $totlprc -= $cupval;
								// $msgbody.= "<br><b>-$cupval </b>";
								//        				 }else{
								//  }
								// 	  if($totcrtprc < 0){
								// 		$msgbody.="<br/>".number_format($shpmnprc,2,'.',',');
										
								// 	  }else{
											
								// 		 $msgbody.="<br/>".number_format($shpmnprc,2,'.',',');

								// 		  }
								// 	  if($db_codamt > 0){
								// 		$grscrtprc = ($grscrtprc+$db_codamt);
								// 		$msgbody.="<br/>".number_format($db_codamt,2,'.',',');
								// 	  }
									$msgbody.="</tr>";
		
									$msgbody.="<tr>
							<td colspan='$clid'  align='right'>Order Amount: </td>
							<td align='right' valign='middle'>";
							if($cupval >0){
							
						//	echo "$$$$".$grscrtprc;exit;
							
							$grscrtprc= $grscrtprc-$cupval;
								}else{
								$grscrtprc= $grscrtprc;  
									}
						$msgbody.= number_format($grscrtprc,2,'.',',')."</td>
										</tr>";
						$msgbody.="<tr>
											<td  colspan='$clid' align='right'>Payment : </td>
											<td align='right' valign='middle'>".number_format($grscrtprc,2,'.',',')."</td>
										</tr>";
									$msgbody .=	"</table></td>
										</tr>
				</table>
				<table width='605' border='0' align='center' cellpadding='0' cellspacing='0'>
					<tr>
						<tr>
					<td height='10'  bgcolor='#ffffff' class='spacer'    style='margin-top:0;margin-right:0;margin-bottom:0;margin-left:0;padding-top:0;padding-right:0;padding-bottom:0;padding-left:0;text-align:left;-webkit-text-size-adjust:none;font-size:0;line-height:0;'>&nbsp;</td>
					</tr>
					<td><p>For suggestions / support please feel free to email us at <a href='mailto:info@liamsons.com' style='color:#d31b12;  text-decoration:none'>info@liamsons.com</a>.</p>
						<p>Sincerely, <br>

						Customer Service,<br>

						
											 $usr_cmpny<br><br>

						</p></td>
					</tr>
				</table></td>
			</tr>
			</table>
			<table width='100%' border='0' cellspacing='0' cellpadding='0'>
					<tr>
						<td align='center'><strong>liamsons Industries.</strong><br />
							
							Shop on www.liamsons.com</td>
					</tr>
				</table>
		</div>
		</body>
		</html>";				

					//echo $msgbody; exit;				

					$to       = $bemail;

					$from     = $u_prjct_email;

					$subject  = "Your $usr_cmpny order " .$prdt.$ordcode." Payment Confirm";

					$headers  = "From: " . $from . "\r\n";

					$headers .= "CC: ".$from ."\r\n";

					$headers .= "MIME-Version: 1.0\r\n";

					$headers .= "Content-Type: text/html; charset=ISO-8859-1\r\n";
//echo $msgbody; exit;
					mail($to,$subject,$msgbody,$headers);					

				

				

//-------------------------------------------update--------------------------------------------------------------//

  $sqlprcdtl = "select prodprcd_id,prodprcd_qnty,prodprcd_preodrqty  

                         from

                      prodprc_dtl

					  where prodprcd_id = '$sz_id'";

 

					 // echo $sqlprcdtl;exit;

	$resprcdtl = mysqli_query($conn,$sqlprcdtl);

	$rwsprcdtl = mysqli_fetch_array($resprcdtl);

     $prdqnty = $rwsprcdtl['prodprcd_qnty'];

     $prdpreqnty = $rwsprcdtl['prodprcd_preodrqty'];



	 $updtqty = $prdqnty-$untqty;

	 $updtpreqty = $prdpreqnty-$untqty;

	

	/*if($prdqnty == 0){

		$updtqty = 0;

		}else{

		$updtqty = $updtqty;

			}*/

		if(($prdqnty ==0)&&($prdpreqnty > 0)){

	    	$updtqty = $updtpreqty;

			$prests = 1;

			}else if(($prdqnty == 0)&&($prdpreqnty = 0)){

			$updtqty = 0;

			$prests = 2;

		}else{

		$updtqty = $updtqty;

		$prests = 0;

			}

	                        $uqryprcdtl = "update prodprc_dtl set";

	                         if($prests == 2){

							 $uqryprcdtl .= "  prodprcd_qnty = $updtqty ,

							                   prodprcd_preodrqty = $updtqty";     

							 }else if($prests == 1){

							 $uqryprcdtl .= " prodprcd_preodrqty = $updtqty";  

						          }else{

		                       $uqryprcdtl .= " prodprcd_qnty = $updtqty ";

		 									  }

				                 $uqryprcdtl .=" where prodprcd_id = '$sz_id'";

					

					  $resprcdtl = mysqli_query($conn,$uqryprcdtl);



//-------------------------------------------update--------------------------------------------------------------//	



	





		//	echo "Hello";

		

		//$msg = "ORD ID:$prdt$$ordcode, Transaction DATE:$orddate,Qty: $rowspo_mst[crtordd_qty], AMOUNT : Rs.$grscrtprc,http://www.mamathatulluri.in, +91 70934 60111";	

		

//$msg = urlencode($msg);			//$url="http://alerts.sinfini.com/api/web2sms.php?workingkey=444996u43a3863ec0z3&sender=HYDTOU&to=$mobno&message=$msg";

//$url=		

//"http://www.pointsms.in/API/sms.php?username=mamathatulluri&password=71uOYkCo&from=DELCIS&to=7569861057&message=test";







			$ch=curl_init();



			curl_setopt($ch, CURLOPT_URL, $url);



			curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);



			$output=curl_exec($ch);



			curl_close($ch);

		

		

		

		

		

		

		

		

		

		

		

		



?>

<!-- Facebook Pixel Code ---> 

<script>

!function(f,b,e,v,n,t,s)

{if(f.fbq)return;n=f.fbq=function(){n.callMethod?

n.callMethod.apply(n,arguments):n.queue.push(arguments)};

if(!f._fbq)f._fbq=n;n.push=n;n.loaded=!0;n.version='2.0';

n.queue=[];t=b.createElement(e);t.async=!0;

t.src=v;s=b.getElementsByTagName(e)[0];

s.parentNode.insertBefore(t,s)}(window,document,'script',

'https://connect.facebook.net/en_US/fbevents.js');

fbq('init', '1554583294596306'); 

fbq('track', 'PageView');

</script>

<noscript>

<img height="1" width="1" 

src="https://www.facebook.com/tr?id=1554583294596306&ev=PageView

&noscript=1"/>

</noscript>

<!-- End Facebook Pixel Code -->

<!DOCTYPE html>



<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->



<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->



<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->



<!--[if gt IE 8]><!--> <html class="no-js"> <!--<![endif]-->



<head>



        <meta charset="utf-8">



        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">



         <meta name="viewport" content="width=device-width">



	<title> <?php echo $usr_cmpny;?> - Order Successful</title>



	<style type="text/css">



		html {



			background: #f9f9f9;



		}



		body {



			background: #fff;



			color: #333;



			font-family: sans-serif;



			margin: 2em auto;



			padding: 1em 2em;



			-webkit-border-radius: 3px;



			border-radius: 3px;



			border: 1px solid #dfdfdf;



			max-width: 700px;



		}



		h1 {



			border-bottom: 1px solid #dadada;



			clear: both;



			color:#9ACB2B; 



			font:bold 24px "Lucida Sans Unicode", "Lucida Grande", sans-serif;



			margin: 30px 0 0 0;



			padding: 0;



			padding-bottom: 7px;



			text-align:center



		}



	



.btn,a.btn {



	-moz-box-shadow:inset 0px 1px 0px 0px #fab3ad;



	-webkit-box-shadow:inset 0px 1px 0px 0px #fab3ad;



	box-shadow:inset 0px 1px 0px 0px #fab3ad;



	background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #fa665a), color-stop(1, #d34639) );



	background:-moz-linear-gradient( center top, #fa665a 5%, #d34639 100% );



	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#fa665a', endColorstr='#d34639');



	background-color:#fa665a;



	-moz-border-radius:4px;



	-webkit-border-radius:4px;



	border-radius:4px;



	border:1px solid #d83526;



	display:inline-block;



	color:#ffffff;



	font-family:arial;



	font-size:15px;



	font-weight:bold;



	padding:6px 24px;



	text-decoration:none;



	text-shadow:1px 1px 0px #98231a;



}.btn:hover,a.btn:hover {



	background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #d34639), color-stop(1, #fa665a) );



	background:-moz-linear-gradient( center top, #d34639 5%, #fa665a 100% );



	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#d34639', endColorstr='#fa665a');



	background-color:#d34639;



	color:#FFF!important;



}.btn:active {



	position:relative;



	top:1px;



}







		#success {



			margin-top: 50px;



		}



		#success p {



			font-size: 14px;



			line-height: 1.5;



			margin: 25px 0 20px;



			text-align:center;



		}



		#success code {



			font-family: Consolas, Monaco, monospace;



		}



		ul li {



			margin-bottom: 10px;



			font-size: 14px ;



		}



		a {



			color: #1C5A95;



			text-decoration: none;



			font:bold 14px Arial, Helvetica, sans-serif;



		}



		a:hover {



			color:#F00;



			text-decoration:underline;



		}







		.button {



			font-family: sans-serif;



			text-decoration: none;



			font-size: 14px !important;



			line-height: 16px;



			padding: 6px 12px;



			cursor: pointer;



			border: 1px solid #bbb;



			color: #464646;



			-webkit-border-radius: 15px;



			border-radius: 15px;



			-moz-box-sizing: content-box;



			-webkit-box-sizing: content-box;



			box-sizing: content-box;



			background-color: #f5f5f5;



			background-image: -ms-linear-gradient(top, #ffffff, #f2f2f2);



			background-image: -moz-linear-gradient(top, #ffffff, #f2f2f2);



			background-image: -o-linear-gradient(top, #ffffff, #f2f2f2);



			background-image: -webkit-gradient(linear, left top, left bottom, from(#ffffff), to(#f2f2f2));



			background-image: -webkit-linear-gradient(top, #ffffff, #f2f2f2);



			background-image: linear-gradient(top, #ffffff, #f2f2f2);



		}







		.button:hover {



			color: #000;



			border-color: #666;



		}







		.button:active {



			background-image: -ms-linear-gradient(top, #f2f2f2, #ffffff);



			background-image: -moz-linear-gradient(top, #f2f2f2, #ffffff);



			background-image: -o-linear-gradient(top, #f2f2f2, #ffffff);



			background-image: -webkit-gradient(linear, left top, left bottom, from(#f2f2f2), to(#ffffff));



			background-image: -webkit-linear-gradient(top, #f2f2f2, #ffffff);



			background-image: linear-gradient(top, #f2f2f2, #ffffff);



		}



		strong{ color: #fff}







			</style>



</head>



<body id="success">



<h1><img src="images/sjjonline-logo.png" alt="" style="margin:0 0 20px 0"><br>



Order STATUS&ndash; SUCCESSFUL</h1>



<p>Thank you for shopping with us.<br />



Please note the below details for your future reference.</p>



        <table width="78%" border="0" align="center" cellpadding="3" cellspacing="1">



          <tr>



            <td width="39%" bgcolor="#4686C4" ><strong>Order reference</strong></td>



            <td width="61%" bgcolor="#efefef" ><?php echo $prdt.$ordcode;?></td>



          </tr>



          <?php



		  /*



          <tr>



            <td bgcolor="#4686C4" ><strong>Payment</strong></td>



            <td bgcolor="#efefef" ><?php echo number_format($totcrtprc,2,".",",");?></td>



          </tr>*/



		  ?>



          <tr>



            <td bgcolor="#4686C4" ><strong>Transaction time</strong></td>



            <td bgcolor="#efefef" ><?php echo $orddate;?> GMT </td>



          </tr>



        </table>



        <br>



        <br>



    <div align="center"><h2>Return to</h2>



<a href="http://www.mamathatulluri.com/home" class="btn"><?php echo $u_prjct_mnurl;?></a>



    <p>If you have any queries about your order please contact our <a href="/contact-us" target="_blank" >customer care</a><br />



      Thank you. </p>    



    </div>  

<br>

  <iframe src="http://tracking.deal-genie.com/aff_l?offer_id=1604&adv_sub=ordcode&amount=Amount" scrolling="no" frameborder="0" width="1" height="1"></iframe>



</body>



</html>



<?php

		}

	}

	?>

	<script type="text/javascript">   



function Redirect() 



{  

 location.href = "../my-orders.php";

} 



document.write(""); 



setTimeout('Redirect()', 4000);   



</script>

	

<?php

}







else{







	?>







		<script language="javascript" type="text/javascript">





 

			location.href = "../cancel.php";







		</script>







	<?php







}







?>