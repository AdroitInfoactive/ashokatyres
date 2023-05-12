<?php
session_start();

include_once '../includes/inc_config.php';       //Making paging validation	
	  include_once '../includes/inc_connection.php';        //Clearing the cache information
	  include_once '../includes/inc_usr_sessions.php';    //checking for session
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
}else
{
 
	?>



		<script language="javascript" type="text/javascript">


 
			location.href = "https://www.mangatrai.com/cancel";



		</script>



	<?php

}


if ($success === true)
{
  $txn_odrid =  $_POST['razorpay_orderid'];    
    
  //$txn_odrid =  1078;

    
   $uqrycrtord_mst = "update 
		                         crtord_mst set crtordm_paysts = 'y'
		                     where
							     crtordm_id = '$txn_odrid'";
          		$resuqrycrtord_mst = mysqli_query($conn,$uqrycrtord_mst);
				if($resuqrycrtord_mst==true){
					
					$uqrycrtordsts_mst = "update 
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

								crtordm_sadrs2,crtordm_scmpny,shpcty.ctym_name as sctynm, shpcnty.cntym_name as                                 scntynm,

								shpcnty.cntym_id as scntyid,

								crtordm_szip,shpcntry.cntrym_name as scntrynm,

								crtordm_sdayphone,crtordm_semailid,crtordm_qty,crtordm_amt,crtordm_wt,

								crtordm_pmode,crtordm_prcssts,crtordm_cartsts,crtordm_paysts,crtordm_rmks,

								crtordm_shpchrgm_id,crtordm_shpchrgamt,crtordm_cpnm_val,crtordm_mbrm_id,

								crtordm_ordtyp,date_format(crtordm_crtdon,'%d-%m-%Y') as crtordm_crtdon_dt,

								date_format(crtordm_crtdon,'%h:%i:%s') as crtordm_crtdon_tm,

								blcty.ctym_sts as bctysts,shpcty.ctym_sts as sctysts,

								blcnty.cntym_sts as bcntysts,shpcnty.cntym_sts as scntysts,

								blcntnt.cntntm_name as bcntntm_name,shpcntnt.cntntm_name as scntntm_name,
								crtordm_codm_id,crtordm_codm_prc,shpchrgm_name,crtordm_disamt,
								crtordm_hsncde,crtordm_igst,
								cpnm_name,crtordm_cpnm_id	

						   from 

								crtord_mst crtord left join cntry_mst blcntry on 

								blcntry.cntrym_id=crtord.crtordm_bmbrcntrym_id 

								left join cnty_mst blcnty on blcnty.cntym_id = crtord.crtordm_bmbrcntym_id 

								left join cty_mst blcty on blcty.ctym_id = crtord.crtordm_bmbrctym_id

								left join cty_mst shpcty on shpcty.ctym_id = crtord.crtordm_smbrctym_id 

								left join cnty_mst shpcnty on shpcnty.cntym_id = crtord.crtordm_smbrcntym_id 

								left join cntry_mst shpcntry on shpcntry.cntrym_id= crtord.crtordm_smbrcntrym_id

								left join cntnt_mst blcntnt on blcntry.cntrym_cntntm_id= blcntnt.cntntm_id 

								left join cntnt_mst shpcntnt on shpcntry.cntrym_cntntm_id= shpcntnt.cntntm_id

								left join shpchrg_mst on crtord.crtordm_shpchrgm_id = shpchrgm_id

								 left join cpn_mst on cpn_mst.cpnm_id = crtordm_cpnm_id	

						   where

								crtordm_id= '$txn_odrid'";

								

				$srscrtord_mst = mysqli_query($conn,$sqrycrtord_mst);
		$cntord_rec	   = mysqli_num_rows($srscrtord_mst);
//	echo $sqrycrtord_mst;exit;
		if($cntord_rec > 0){			
			$srowcrtord_mst = mysqli_fetch_assoc($srscrtord_mst);
			
				$crtord_id	= $srowcrtord_mst['crtordm_id'];											
					$bfname  	= $srowcrtord_mst['crtordm_fstname'];
					$blname	  	= $srowcrtord_mst['crtordm_lstname'];	
					$bemail 	= $srowcrtord_mst['crtordm_emailid'];
					$ordcode 	= $srowcrtord_mst['crtordm_code'];
				   $ordmid	 	= base64_encode($srowcrtord_mst['crtordm_id']);
				   $orddate 	= $srowcrtord_mst['crtordm_crtdon_dt']." ".$srowcrtord_mst['crtordm_crtdon_tm'];
					$shipname 	= $srowcrtord_mst['shpchrgm_name'];	 
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
					//$db_pmode 	= funcPayMod($srowcrtord_mst['crtordm_pmode']);
					$db_pmode 	= $srowcrtord_mst['shpchrgm_name'];
					$dispsy 	= $srowcrtord_mst['crtordm_paysts'];
					$db_ordqty	= $srowcrtord_mst['crtordm_qty'];
					$db_ordamt	= $srowcrtord_mst['crtordm_amt'];
					$db_ordrmks	= $srowcrtord_mst['crtordm_rmks'];
					$db_codamt	= $srowcrtord_mst['crtordm_codm_prc'];
					$hsncde	= $srowcrtord_mst['crtordm_hsncde'];
					$crtgst	= $srowcrtord_mst['crtordm_igst'];
                 $shpmnprc  = $srowcrtord_mst['crtordm_shpchrgamt']; 
      			$codprc  = $srowcrtord_mst['crtordm_codm_prc'];
				$cupid  = $srowcrtord_mst['crtordm_cpnm_id'];
					$cupnm  = $srowcrtord_mst['cpnm_name'];
					$cupval  = $srowcrtord_mst['crtordm_cpnm_val'];
					$cuptyp  = $srowcrtord_mst['crtordm_cpnm_typ'];
					   if(($scounty == "Telangana")||($scountyid == 115)){
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
						$shpcmpltadrs .= ",&nbsp;TAX Number :&nbsp;".$sgst;	
					}
						if($scom != ''){
						$shpcmpltadrs .= ",&nbsp;Company :&nbsp;".$scom;	
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
						$blngcmpltadrs .= ",&nbsp;TAX Number :&nbsp;".$bgst;	
					}
						if($bcom != ''){
						$blngcmpltadrs .= ",&nbsp;Company :&nbsp;".$bcom;	
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
 	$msg = "Hello  $bfname $blname Thank you for your order.Order Number: $ordcode  We'll let you know when your order is 
 	                                           shippedDarpanMangatrai Pearls
                                            Punjagutta, Hyderabad";  
$username = "mangatraijewellers";
$password = "Mrj1905";
$numbers = "$bphno"; // mobile number
$from = 'MRJDAR'; // assigned Sender_ID
$template_id = "1707161529400313011";
$message = urlencode($msg); // Message text required to deliver on mobile number
$messagetype = 1;
$dnd_check = 0;
$request = array('username' => $username,'password' => $password,'from' =>$from,'to' =>$numbers,'msg' =>$message,'type'=>$messagetype,'dnd_check' => $dnd_check,'template_id'=>$template_id);
$url = "https://www.smsstriker.com/API/sms.php";
$ch = curl_init();
curl_setopt($ch, CURLOPT_URL,$url);
curl_setopt($ch, CURLOPT_CUSTOMREQUEST, 'POST');
curl_setopt($ch, CURLOPT_POSTFIELDS, $request);
curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
$result = curl_exec($ch);
curl_close($ch);





		
		
					$hdimg    = "https://".$u_prjct_mnurl."/".$site_logo;//Return the URL	
					$orddate	= date('l jS F Y',strtotime($orddate));															
			$msgbody="<!DOCTYPE HTML PUBLIC '-//W3C//DTD HTML 4.01//EN' 'https://www.w3.org/TR/html4/strict.dtd'>
					<!DOCTYPE HTML PUBLIC '-//W3C//DTD HTML 4.01//EN' 'http://www.w3.org/TR/html4/strict.dtd'>

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
<td><a href='https://".$u_prjct_mnurl."/home' ><img src='https://www.mangatrai.com/images/mangatrai-logo.png' alt='$usr_cmpny' hspace='10' vspace='15' width='200'></a></td>

<td align='right' width='50%'> <a href='https://www.mangatrai.com/list-order' target='_blank' style='color:#e99005; margin-right:10px;'>Your Orders</a> | <a href='https://www.mangatrai.com/' target='_blank' style='color:#e99005; margin-left:10px;'>mangatrai.com</a><br>
<h2 style='margin-top:5px; margin-bottom:5px; font-family:Arial, Helvetica, sans-serif;font-size:18px;  color:#332308;'>Order Information</h2>
<p>$prdt$ordcode</p> </td>
</tr>
</table>
<table style='background-color:#ffffff;padding:0' background='#ffffff' width='605' border='0' align='center' cellpadding='0' cellspacing='0'>
							  <tr>

								<td valign='top' bgcolor='#ffffff' style=' margin-bottom:5px;'>

								  </td>

							  </tr>

							  <tr>

								<td height='2' valign='top' bgcolor='#cccccc' colspan='2'  style='margin-top:0;margin-right:0;margin-bottom:0;margin-left:0;padding-top:0;padding-right:0;padding-bottom:0;padding-left:0;text-align:left;-webkit-text-size-adjust:none;font-size:0;line-height:0;'>&nbsp;</td>

							  </tr>

							  <tr>

								<td height='10' valign='top' bgcolor='#fff' class='spacer'    style='margin-top:0;margin-right:0;margin-bottom:0;margin-left:0;padding-top:0;padding-right:0;padding-bottom:0;padding-left:0;text-align:left;-webkit-text-size-adjust:none;font-size:0;line-height:0;'>&nbsp;</td>

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

							  <tr valign='top' >

								<td align='left'  ><p><strong style='color:color:#332308;'>Order No</strong> $prdt$ordcode</p>


								<p><strong  style='color:color:#332308;'>Order Date</strong> $orddate</p>

								<p><strong  style='color:color:#332308;'>Payment Status</strong> <span style='color:#e99005'>Yes</span></p></td>

								

							  </tr> 

							</table>
							<table width='605' border='1' align='center' cellpadding='5' cellspacing='0' bordercolor='#dfdfdf' style='border:1px solid #dfdfdf; margin-top:15px;' >

									<tr>

									  <td  valign='middle'><p style='color:#e99005'>Product</p></td>

									  <td  valign='middle'><p style='color:#e99005'>Qty</p></td>

									  <td  valign='middle'><p style='color:#e99005'>Price(INR)</p></td>";

									/*  if($nmstrws == 1){

										 $msgbody.=" <td  valign='middle'><p style='color:#e99005'>TAX1</p></td>

    									  <td  valign='middle'><p style='color:#e99005'>TAX2</p></td>"; 

										  }else{

		  							$msgbody.=" <td  valign='middle'><p style='color:#e99005'>TAX</p></td>";

											  }*/

	 						$msgbody.="<td align='right' valign='middle'><p style='color:#e99005'>Total Price(INR)</p>                                </td>

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

													  group by prodm_id,untm_id order by untm_prty desc";

													  select crtordd_id, crtordd_qty,(crtordd_prc) as                                                  crtordd_prc,prodm_id,prodm_name, crtordd_prc as unprcval,

						                          prodm_gst,crtordd_prodprcd_id,crtordd_prodm_id,

												  prodm_code,prodprcd_wght,crtordd_sizem_id from

                                               crtord_dtl 

                                    inner join prod_mst on prod_mst.prodm_id = crtord_dtl.crtordd_prodm_id

                                  inner join prodprc_dtl on prodprc_dtl.prodprcd_prodm_id = prod_mst.prodm_id 

                                  where crtordd_crtordm_id=$cid group by crtordd_id 

													  

													  */

													  $sqrycrtord_dtl =	"select crtordd_id, crtordd_qty,(crtordd_prc) as                                                  crtordd_prc,prodm_id,prodm_name, crtordd_prc as unprcval,

						                          prodm_gst,crtordd_prodprcd_id,crtordd_prodm_id,

												  prodm_code,prodprcd_wght,crtordd_sizem_id from

                                               crtord_dtl 

                                    inner join prod_mst on prod_mst.prodm_id = crtord_dtl.crtordd_prodm_id

                                  inner join prodprc_dtl on prodprc_dtl.prodprcd_prodm_id = prod_mst.prodm_id 

                                  where crtordd_crtordm_id=$txn_odrid group by crtordd_id  

											 	";	

							//			 echo $sqrycrtord_dtl ;exit;

					$srscrtord_dtl = mysqli_query($conn,$sqrycrtord_dtl);

													$cnttorec      = mysqli_num_rows($srscrtord_dtl);

													

													if($cnttorec > 0)

													{	

														$totcrtprc = "";						

														while($rowspo_mst=mysqli_fetch_assoc($srscrtord_dtl))

														{

														    

														    

														    

								$prdm_id	=	$rowspo_mst['crtordd_prodm_id'];

				    

								$untqty	=	$rowspo_mst['crtordd_qty'];

														    

														    

														    

														    

							  $sqlprcdtl = "select prodprcd_id,prodprcd_qnty  

                         from

                      prodprc_dtl

					  where prodprcd_prodm_id = '$prdm_id'";

 

	$resprcdtl = mysqli_query($conn,$sqlprcdtl);

	$rwsprcdtl = mysqli_fetch_array($resprcdtl);

     $prdqnty = $rwsprcdtl['prodprcd_qnty'];

	 $updtqty = $prdqnty-$untqty;

	

	if($prdqnty == 0){

		$updtqty = 0;

		}else{

		$updtqty = $updtqty;

			}

	  $uqryprcdtl = "update prodprc_dtl set

	                             prodprcd_qnty = $updtqty 

					  where prodprcd_prodm_id = '$prdm_id'";

	  $resprcdtl = mysqli_query($conn,$uqryprcdtl);

			  							    

			//	echo 		$uqryprcdtl;exit;								    

														    

														    

														    

														    

														    

														    

														    

									 $prdqty	=	$rowspo_mst['crtordd_qty'];

									 	 $prdprc = 	$rowspo_mst['crtordd_prc'];

									$prdprc = roundPrice($prdprc);

									

									$prdprc23 = roundPrice($prdprc);

										 

									 	  $totprc = ($prdqty * $prdprc);

										  					    

														    

														    

									$db_shpprc = ($rowspo_mst['crtordd_qty']*$rowspo_mst['crtordd_shpprc']);

															$msgbody.="<tr>

															  <td>Name: $rowspo_mst[prodm_code]<br/>

															  Code: $rowspo_mst[prodm_name] <br/>

															  Price(INR):";

															  $msgbody.=$prdprc23;

															  $msgbody.="</td>

															  <td>$rowspo_mst[crtordd_qty]</td>";

															  

  

                                                   $prdtotprc = $rowspo_mst['crtordd_prc'];

												   	 $prdtotprc = roundPrice($prdtotprc);

                    								 $gstval = $crtgst;

														  

														  $gst = 1+($gstval/100);

														 

														   $prdprc  = $prdtotprc/$gst;

															$prdwoustgst = $prdprc; 

															$tax = $prdtotprc - $prdwoustgst;

														$prdprc  =  number_format($prdprc,2,'.',',');

														$tax     = number_format($tax,2,'.',',');

														$clid = 4;

														if($nmstrws == 1){

															$gstdiv =  $tax/2;

															 $cgst =  number_format($gstdiv,2,'.',',');

															 $sgst =  number_format( $gstdiv,2,'.',',');

															$gstper = ($gstval/2)."%";

																													                                                             $clid = 5;

															}

															$igstper  = $gstval."%";	

															

														$taxcnty = 		$srowcrtord_mst['crtordm_igst'];													

														$msgbody.="

														<td valign='right'>$prdtotprc</td>";

													/*	if($nmstrws == 1){

											$msgbody.="<td valign='right'>$cgst<br>$gstper</td>

														<td valign='right'>$sgst<br>$gstper</td>";		

															}else{

										$msgbody.="<td valign='right'>$tax<br>$igstper</td>";		

																

															}*/

								$msgbody.="<td align='right' valign='right'>";

								$totitmprc = ($totprc);

							  	//$totcrtprc +=  $totitmprc+$db_shpprc;



								$untbx_prc 		   = ($rowspo_mst['crtordd_prc'] + $rowspo_mst['crtordd_shpprc']);

							$totlprdprc = $totlprdprc+$totprc;

							

								$msgbody.=   number_format($totprc,2,".",",")."

								</td>";

													$msgbody .="</tr>";							

														}

													}		

													//$grscrtprc = $totcrtprc + $shipprc;

										//$grscrtprc = $totcrtprc + $shpmnprc;

//echo "----------->".$shpmnprc;exit;

													

								  $msgbody.="<tr><td  colspan='3' align='right'>Product Cost:";

								  $msgbody.= "<br>Tax :";

								if($cupid!=0){

										 // $totlprdprc -= $cupval;

							        $msgbody.= "<br><b>Coupon(Applied)-$cupnm : </b>";

                             				 }

											// ECHO $shpmnprc;

							    if($shpmnprc > 0){

									//$totlprdprc = $totlprdprc+$shpmnprc;

     							$msgbody.= "<br><b>SHIPPING CHARGES :</b>";

                                      

									}else{

										$msgbody.= "<br><b>SHIPPING CHARGES :</b>";

										}

									

							   $msgbody.="</td>

								

												  <td align='right' valign='TOP'>".number_format($totlprdprc,2,'.',',');

												  

												   $msgbody .= "<br> ".number_format($taxcnty,2,'.',',');

									               $totlprdprc = $totlprdprc+$taxcnty;

									  

												   if($cupid!=0){

										   

										  $totlprdprc -= $cupval;

							        $msgbody.= "<br>-<b>$cupval </b>"; 

                             				 }

											 

											 

											 if($totprc != 0){

												 

									$totlprdprc +=  $shpmnprc;



     							$msgbody .=  "<br>".number_format($shpmnprc,2,'.',',');



                                      



									}	 

												$msgbody.="</td></tr>";

												

												$msgbody.="<tr>

                  <td  colspan='3' align='right'>Order Amount: </td>";

				  

				  

               $msgbody.="<td align='right' valign='middle'>".number_format($totlprdprc,2,'.',',')."</td>

                </tr>";

				$msgbody.="<tr>

                  <td  colspan='3' align='right'>Payment : </td>

                  <td align='right' valign='middle'>".number_format($totlprdprc,2,'.',',')."</td>

                </tr>";

							$msgbody .=	"</table>

							<table width='605' border='0' align='center' cellpadding='0' cellspacing='0' bgcolor='#ffffff' style='background-color:#ffffff; margin-top:15px;'>

							  

							 

							  <tr>

								<td ><table width='605' border='1' cellspacing='0' cellpadding='5' bordercolor='#dfdfdf' style='border:1px solid #dfdfdf'>

									<tr>

									  <td align='center'><p style='color:#e99005'>Billing Address</p></td>

									  <td align='center'><p style='color:#e99005'>Shipping Address</p></td>

									</tr>

									<tr>

									  <td>$blngcmpltadrs</td>

									  <td>$shpcmpltadrs</td>

									</tr>

								  </table></td>

							  </tr>

							  <tr>

								<td height='10'  bgcolor='#ffffff' class='spacer'    style='margin-top:0;margin-right:0;margin-bottom:0;margin-left:0;padding-top:0;padding-right:0;padding-bottom:0;padding-left:0;text-align:left;-webkit-text-size-adjust:none;font-size:0;line-height:0;'>&nbsp;</td>

							  </tr>

							</table>

							

							

							<table width='605' border='0' align='center' cellpadding='0' cellspacing='0'>

							  <tr>

							    <tr>

								<td height='10'  bgcolor='#ffffff' class='spacer'    style='margin-top:0;margin-right:0;margin-bottom:0;margin-left:0;padding-top:0;padding-right:0;padding-bottom:0;padding-left:0;text-align:left;-webkit-text-size-adjust:none;font-size:0;line-height:0;'>&nbsp;</td>

							  </tr>

								<td><p>Thank You order with $usr_cmpny.</p>

								  


We hope to see you soon again<br>
<a href='mailto:$u_prjct_mnurlhttp' style='color:#e99005; text-decoration:none'>$usr_cmpny</a>.<br>



								  </p></td>

							  </tr>

							</table></td>

						</tr>

					  </table>

			

					</div>

					</body>

					</html>";
			//	echo $msgbody; exit;				
					$to       = $bemail;
					$from     = $u_prjct_email;
				//	$subject  = "Your order $usr_cmpny " .$ordcode." Payment Confirm";
							//$subject  = "Your order $usr_cmpny " .$ordcode." Payment Confirm";
					$subject  = "Your order " .$ordcode." has been Placed - $usr_cmpny "; 
				
				
					$headers  = "From: " . $from . "\r\n";
					$headers .= "CC: ".$from ."\r\n";
					$headers .= "MIME-Version: 1.0\r\n";
					$headers .= "Content-Type: text/html; charset=ISO-8859-1\r\n";
					mail($to,$subject,$msgbody,$headers);					
				
	



		
		
		
		
		
		
		
		
		

?>

<!DOCTYPE html>

<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->

<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->

<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->

<!--[if gt IE 8]><!--> <html class="no-js"> <!--<![endif]-->

<head>

        

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
<meta name="facebook-domain-verification" content="n0fw9kc15gisbqhuyrsy4xrxd1s20u" />
<!-- Event snippet for Purchase (Sales Thank You) conversion page --> 
<script> gtag('event', 'conversion', { 'send_to': 'AW-817947705/l1FuCN-19pECELnIg4YD', 'value': 6600.0, 'currency': 'INR', 'transaction_id': '' }); </script>

<!-- Global site tag (gtag.js) - Google Ads: 817947705 -->
<script async src="https://www.googletagmanager.com/gtag/js?id=AW-817947705"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'AW-817947705');
</script>

<!-- Google Tag Manager -->
<script>(function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start':
new Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0],
j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.async=true;j.src=
'https://www.googletagmanager.com/gtm.js?id='+i+dl;f.parentNode.insertBefore(j,f);
})(window,document,'script','dataLayer','GTM-WC6VPW6');</script>
<!-- End Google Tag Manager -->

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
fbq('init', '436540573780757'); 
fbq('track', 'PageView');
</script>
<noscript>
<img height="1" width="1" 
src="https://www.facebook.com/tr?id=436540573780757&ev=PageView
&noscript=1"/>
</noscript>
<!-- End Facebook Pixel Code -->
</head>

<body id="success">

<!-- Google Tag Manager (noscript) -->
<noscript><iframe src="https://www.googletagmanager.com/ns.html?id=GTM-WC6VPW6"
height="0" width="0" style="display:none;visibility:hidden"></iframe></noscript>
<!-- End Google Tag Manager (noscript) -->

<h1><img src="images/mangatrai-logo.png" alt="" style="margin:0 0 20px 0"><br>

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

    <div align="center">

	<p>Kindly check your email for order details, In case you do not find the mail, please check the junk / spam folder and mark as not spam.</p>

<a href="https://www.mangatrai.com/list-order" class="btn"><?php echo $u_prjct_mnurl;?></a>

    <p>If you have any queries about your order please contact our <a href="<?php echo $rtpth?>contact-us" target="_blank" >customer care</a><br />

      Thank you. </p>    

    </div>  
<br>

</body>

</html>

<?php
		}
	}
	?>
	
	
	<!-- Global site tag (gtag.js) - Google Analytics -->
<script async src="https://www.googletagmanager.com/gtag/js?id=UA-29344067-1"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());
 
  gtag('config', 'UA-29344067-1');
</script>
 
<script type="text/javascript">   

function Redirect() 

{  
// location.href = "list-order";
} 

document.write(""); 

//setTimeout('Redirect()', 4000);   

</script>
<?php
}
else
{
 
	?>



		<script language="javascript" type="text/javascript">


 
			location.href = "https://www.mangatrai.com/cancel";



		</script>



	<?php

}

//echo $html;
