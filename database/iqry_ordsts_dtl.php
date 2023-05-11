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
		if ((($stsid == '3') || ($odrstsnm == "Delivered"))) {
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
       <head>
        <meta charset='utf-8'>
        <meta http-equiv='X-UA-Compatible' content='IE=edge'>
        <meta name='viewport' content='width=device-width, initial-scale=1.0'>
        <meta name='format-detection' content='telephone=no'>
        <meta name='apple-mobile-web-app-capable' content='yes'>
        <link href='img/favicon.png' rel='apple-touch-icon-precomposed'>
        <link href='img/favicon.png' rel='shortcut icon' type='image/png'>
        <meta name='author' content=''>
        <meta name='keywords' content=''>
        <meta name='description' content=''>
        <title>Liamsons</title>
        </head>

        <body>
    <div class='email-holder' style='max-width: 800px; background-color: #f2f2f2;margin: auto;width: 100%;'>
        <div class='logo-holder' style='background-color: rgba(72, 147, 89, 0.1);'>
            <img src='img/logo/liamsons-logo.png'
                style='max-width: 200px;margin: auto;display: block;padding: 10px;' alt=''>
        </div>
        <div class='liamsons-title' style='text-align:center;border-bottom: 1px solid #b3b3b3;'>
            <h3
                style='text-align: center;letter-spacing: 1px;font-size: 1.2rem;text-transform: uppercase;margin-bottom: 10px;'>
                Liamsons Business Private Limited</h3>
            <p style='text-transform: uppercase;margin-top: 0;'>Tax Invoice</p>
        </div>
        <div class='table-holder' style='padding-left: 10px;padding-right:10px;border-bottom: 1px solid #b3b3b3;'>

        <table style='width:100%'>
        <tr style='display: flex;align-items:flex-start;'>
        <td width='50%'>
        <p
        style='margin-bottom: 10px;font-size: 1.1rem;font-weight: 600;letter-spacing: 1px;color: #489359;'>
        Order No: $ordcode</p>
        <p style='margin-bottom: 4px;font-size: 1rem;letter-spacing: 0.6px;'><strong>Order Date Time:</strong>
                $orddate
        </p>
        <p style='margin-bottom: 4px;font-size: 1rem;letter-spacing: 0.6px;'><strong>Order Status:</strong>
       <b style='color:#489359'> $odrstsnm</b>
          </p>
    
        </td>
        <td width='50%'>
        <p
        style='margin-bottom: 10px;font-size: 1.1rem;font-weight: 600;letter-spacing: 1px;color: #489359;'>
        Delivered From</p>
        <p style='margin-bottom: 4px;font-size: 1rem;letter-spacing: 0.6px;'>LIAMSONS BUSINESS PRIVATE
        LIMITED
        </p>
        <p style='margin: 0;font-size: 1rem;letter-spacing: 0.6px;'>Mob-7981077230<br>
        2-2-215/14/29,STREET NO 1, TIRUMALA, ENCLAVE, MACHABOLLARAM, HYDERABAD,<br> HYDERABAD<br>
        Telangana-36
        <br> 500010
        </p>
        <p><strong>GST No:</strong> 36AAFCL1483Q1ZX </p>
        </td>
        </tr>
    
    
        <tr style='display: flex;align-items:flex-start;'>
        <td width='50%'>
    
        <p
        style='margin-bottom: 10px;font-size: 1.1rem;font-weight: 600;letter-spacing: 1px;color: #489359;'>
        Customer Shipping Address </p>
                        <p style='margin-bottom: 4px;font-size: 1rem;letter-spacing: 0.6px;'>$shpcmpltadrs
                        </p>
     </td>
        <td width='50%'>
        <p
        style='margin-bottom: 10px;font-size: 1.1rem;font-weight: 600;letter-spacing: 1px;color: #489359;'>
        Customer Billing Address</p>
        <p style='margin-bottom: 4px;font-size: 1rem;letter-spacing: 0.6px;'>$blngcmpltadrs
        </p>
    
        </td>
        </tr>

        </table>
         </div>
        <div style='background-color: #489359;color: #fff;padding: 15px 10px;'>
        <h3 style='margin:0;letter-spacing: 1px;'>Products</h3>
        </div>
        <div class='table-holder' style='padding-left: 10px;padding-right:10px;border-bottom: 1px solid #b3b3b3;'>
        <table style='width:100%' style='border: 1px solid black; border-collapse: collapse;'>
        <tr style='border-bottom: 1px solid #b3b3b3'>
        <td width='6%' style='padding: 10px 5px;font-weight: 600;font-size: 15px;letter-spacing: 0.6px;'>Sl No.
        </td>
    
        <td width='25%' style='padding: 10px 5px;font-weight: 600;font-size: 15px;letter-spacing: 0.6px;'>Code/Name
        </td>
        <td width='10%' style='padding: 10px 5px;font-weight: 600;font-size: 15px;letter-spacing: 0.6px;text-align:center;'>Unit Price (&#x20B9;)
        </td>";
		if($state=='Telangana')
		{	
			$msgbody.="<td width='10%' style='padding: 10px 5px;font-weight: 600;font-size: 15px;letter-spacing: 0.6px;text-align:center;'>CGST (%)</td>
			<td width='10%' style='padding: 10px 5px;font-weight: 600;font-size: 15px;letter-spacing: 0.6px;text-align:center;'>SGST (%)</td>";
		
		}
		else{ 
		$msgbody.="	<td width='10%' style='padding: 10px 5px;font-weight: 600;font-size: 15px;letter-spacing: 0.6px;text-align:center;'>IGST (%)</td>";
		
		}
	
		$msgbody.="<td width='15%' style='padding: 10px 5px;font-weight: 600;font-size: 15px;letter-spacing: 0.6px;text-align:end;'>Price + Tax</td>
        <td width='10%' style='padding: 10px 5px;font-weight: 600;font-size: 15px;letter-spacing: 0.6px;text-align:end;'>Qty</td>
            <td width='30%' style='padding: 10px 5px;font-weight: 600;font-size: 15px;letter-spacing: 0.6px;text-align:end;'>Total Amount(&#x20B9;)
        </td>
        </tr>";

					$sqrycrtord_dtl = "SELECT crtordd_id, crtordd_qty,crtordd_prc,prodm_id,prodm_name, crtordd_prc as unprcval,prodszvrtnm_vrtn_nms,prodszvrtnm_id,prodprcm_id,prodprcm_sku,prodprcm_sleprc,prodprcm_ofrprc ,prodm_name,crtordm_shpchrgm_id,crtordd_igst,crtordd_sgst,crtordd_cgst
        from crtord_dtl 
        inner join crtord_mst on crtordd_crtordm_id = crtordm_id
        left join prod_mst on prod_mst.prodm_id = crtord_dtl.crtordd_prodm_id 
        inner join prodsz_vrtns_mst on prodszvrtnm_id = crtordd_sizem_id 
        inner join prodprc_mst on crtordd_prodprcd_id = prodprcm_id where crtordd_crtordm_id = $orderid group by crtordd_id";
					//echo $sqrycrtord_dtl;
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
							//  echo"here".$gstval;
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
								$gstper = ($gstval / 2) . "%";
							}
							$igstper = $gstval . "%";
							$prodm_name = $rowspo_mst['prodm_name'];
							$prodprcm_sku = $rowspo_mst['prodprcm_sku'];
							$prodszvrtnm_vrtn_nms = $rowspo_mst['prodszvrtnm_vrtn_nms'];

							$msgbody .= "
	 <tr style='border-bottom: 1px solid #b3b3b3'>
	  <td style='padding: 6px 5px;font-size: 15px;letter-spacing: 0.6px;'>$cntord</td>";
							if ($prodszvrtnm_vrtn_nms != '') {
								$msgbody .= " <td style='padding: 6px 5px;font-size: 15px;letter-spacing: 0.6px;'>
        
           Name: $prodm_name </br>
           Code: $prodprcm_sku </br>
           Size:$prodszvrtnm_vrtn_nms
           </td>";
							} else {
								$msgbody .= " <td style='padding: 6px 5px;font-size: 15px;letter-spacing: 0.6px;'>
            Name: $prodm_name </br>
            Code: $prodprcm_sku </br>
            </td>";
							}

							$msgbody .= "<td style='padding: 6px 5px;font-size: 15px;letter-spacing: 0.6px;text-align:end;'>";
							$totalprdprc += $prdprc;
							$prdwoustgst = $prdprc;
							$prdprc = number_format($prdwoustgst, 2, '.', ',');

							$msgbody .= " $prdprc </td>";
							if ($nmstrws == 1) {
								$totalcgst += $cgstval;
								$totalsgst += $sgstval;
								 $msgbody.="<td style='padding: 6px 5px;font-size: 15px;letter-spacing: 0.6px;text-align:end;'>$cgst<br>($gstper)
					  <td style='padding: 6px 5px;font-size: 15px;letter-spacing: 0.6px;text-align:end;'>$sgst<br>($gstper)";
						}
						else{
						$totaltax += $prodtax;
						$prodtax=number_format($prodtax,2,'.',',');
						$msgbody.="<td style='padding: 6px 5px;font-size: 15px;letter-spacing: 0.6px;text-align:end;'>$prodtax<br>($igstper)</td>";
						
							}
							$Tot_price += $db_prc;
							$msgbody .= " <td style='padding: 6px 5px;font-size: 15px;letter-spacing: 0.6px;text-align:end;'>$db_prc</td>
         <td style='padding: 6px 5px;font-size: 15px;letter-spacing: 0.6px;text-align:end;'>";
							$db_qty;
							$totqty = $totqty + $db_qty;

							$msgbody .= " $db_qty</td>
         
		<td style='padding: 6px 5px;font-size: 15px;letter-spacing: 0.6px;text-align:end;'>";

							$prc = number_format($totprc, 2, '.', ',');
							$totlprc = ($totlprc + $totprc);

							$msgbody .= "$prc </td>
    </tr>";

						}
					}
					$msgbody .= "<tr><td style='padding: 6px 5px;font-size: 15px;letter-spacing: 0.6px;text-align:center;'colspan='2'></td>
                  ";
					$totalprdprc = number_format($totalprdprc, 2, '.', ',');
					$totaltax = number_format($totaltax, 2, '.', ',');
					$Tot_price = number_format($Tot_price, 2, '.', ',');
					$msgbody .= "<td style='padding: 6px 5px;font-size: 15px;letter-spacing: 0.6px;text-align:end;'><strong>$totalprdprc</strong></td>";
					if ($nmstrws == 1) {
						$msgbody .= "<td style='padding: 6px 5px;font-size: 15px;letter-spacing: 0.6px;text-align:end;'><strong>$totalcgst</strong></td>";
						$msgbody .= "<td style='padding: 6px 5px;font-size: 15px;letter-spacing: 0.6px;text-align:end;'><strong>$totalsgst</strong></td>";
					} else {
						$msgbody .= "<td style='padding: 6px 5px;font-size: 15px;letter-spacing: 0.6px;text-align:end;'><strong>$totaltax</strong></td>";
					}
					$msgbody .= "<td style='padding: 6px 5px;font-size: 15px;letter-spacing: 0.6px; text-align:end;'><strong>$Tot_price</strong></td>";
					$prodcost = number_format($ntitmprc, 2, '.', ',');
					$msgbody .= "<td style='padding: 6px 5px;font-size: 15px;letter-spacing: 0.6px;text-align:end;'><strong>$totqty</strong></td>";




					$totlprc1 = number_format($totlprc, 2, '.', ',');
					$msgbody .= "
 
  <td style='padding: 10px 5px;font-weight: 600;font-size: 15px;letter-spacing: 0.6px;text-align:end;'>Product Cost: $totlprc1
  ";
					$totlprc = $totlprc + $taxcnty;
					$cupid = $rowsord_mst['crtordm_cpnm_id'];
					$cupnm = $rowsord_mst['cpnm_name'];
					if ($cupid != 0) {
						$cupval = $rowsord_mst['crtordm_cpnm_val'];
						$totlprc -= $cupval;
						$msgbody .= "Coupon(Applied)$cupnm : -$cupval ";
					}
					if ($totlprc != 0) {
						$totlprc += $db_shpprc;
						$msgbody .= "<br>Shipping Charges : $db_shpprc";
					} else {
						$shpprc = 0;
						$totlprc += $db_shpprc;
						//	echo '<br><strong>Shipping Charges Not Appilcable for More than 3000 Purchase: $shpprc</strong>';
						$msgbody .= "<br>Shipping Charges : $db_shpprc";
					}
					$msgbody .= "<br>Order Amount : ";
					if ($regid == '') {
						$regid = $crtmbrid;
					}
					if ($crtdiscamt != 0) {
						$netTotal = $totlprc;
						$disPrc = $crtdiscamt;
						$ntTogPrc = $netTotal - $disPrc;
						$ntTogPrc = number_format($ntTogPrc, 2, '.', ',');
						$msgbody .= "Net Total You get a 10% Discount for First time Purchase order :$ntTogPrc";
					} else {
						$totlprc = number_format($totlprc, 2, '.', ',');
						$msgbody .= "$totlprc";
					}
					$msgbody .= "</td></tr></table>";
					$msgbody .= "</div> <div>
   <img src='https://liamsons.com/v4/images/email-banner.jpg' width='100%' alt=''>
   <p style='text-align: center;font-size: 13px;letter-spacing: 1px;color: #333;'>This is a computer generated
	   invoice and does not require a signature</p>
   
   <p style='text-align: center;font-size: 13px;letter-spacing: 1px;color: #333;margin: 0;'>CORPORATE OFFICE:
	   Liamsons Business Private Limited</p>
   <p style='text-align: center;font-size: 13px;letter-spacing: 1px;color: #333;margin: 0;'> 2-2-215/14/29,
	   Tirumala enclave, Street No- 1, Near Royal enclave, Macha Bollaram Locality, <br>Alwal Mandal,
	   Medchal-Malkajgiri Dist-500010.</p>
   
   <p style='text-align: center;font-size: 13px;letter-spacing: 1px;color: #333;margin: 0;'>Phone 1: <a
		   href='tel:9030707961'>903-070-7961</a>, Phone 2: <a href='tel:7981077230'>798-107-7230</a> </p>
   <p style='text-align: center;font-size: 13px;letter-spacing: 1px;color: #333;margin: 0;'>Email 1: <a
		   href='mailto:support@liamsons.com'>support@liamsons.com </a>, Email 2: <a
		   href='tel:sales@liamsons.com'>sales@liamsons.com</a> </p>
	</div> 
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
				$msgbody = "
				<!DOCTYPE html>
				<html lang='en'>

				<head>
				<meta charset='utf-8'>
				<meta http-equiv='X-UA-Compatible' content='IE=edge'>
				<meta name='viewport' content='width=device-width, initial-scale=1.0'>
				<meta name='format-detection' content='telephone=no'>
				<meta name='apple-mobile-web-app-capable' content='yes'>
				<link href='img/favicon.png' rel='apple-touch-icon-precomposed'>
				<link href='img/favicon.png' rel='shortcut icon' type='image/png'>
				<meta name='author' content=''>
				<meta name='keywords' content=''>
				<meta name='description' content=''>
				<title>Liamsons | Medical Supplies Online</title>
				<link rel='preconnect' href='https://fonts.googleapis.com'>
				<link rel='preconnect' href='https://fonts.gstatic.com' crossorigin>
				<link href='https://fonts.googleapis.com/css2?family=Jost:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap' rel='stylesheet'>


				</head>

				<body>
				<div class='email-holder' style='max-width: 800px; background-color: #f2f2f2;margin: auto;width: 100%;'>
					<div class='logo-holder' style='background-color: rgba(72, 147, 89, 0.1);'>
							<img src='https://liamsons.com/v4/img/logo/liamsons-logo.png' style='max-width: 200px;margin: auto;display: block;padding: 10px;' alt=''>
					</div>
					<div class='liamsons-title' style='text-align:center;border-bottom: 1px solid #b3b3b3;'>
							<p style='text-align: center;letter-spacing: 1px;font-size: 1.2rem;text-transform: uppercase;margin-bottom: 10px;font-family: 'Jost', sans-serif;font-weight: 500;'>
									Liamsons Business Private Limited</p>
							<p style='text-transform: uppercase;margin-top: 0;letter-spacing: 1px;font-family: 'Jost', sans-serif;font-weight: 500;text-decoration: underline;'>
									Order Status</p>

					</div>
					<div class='table-holder' style='padding-left: 10px;padding-right:10px;padding-bottom: 10px;'>
							<table style=' width:100% '>
									<tr style='display: flex;align-items:flex-start;justify-content: center;text-align: center; justify-content: center;'>
											<td width='50%' style='border: 1px solid #000; border-radius: 5px;padding: 10px;margin-top: 10px;'>
													<p style='margin-bottom: 10px;font-size: 1rem;letter-spacing: 0.6px; '> Dear <b>" . $bfname . "</b>, <br/><br/></p>
													<p style='margin: 0;font-size: 1rem;letter-spacing: 0.6px; '>Thank you for your order $ordcode <br> $db_ordstsnm on " . $stsdate . "</p>
											</td>
											
									</tr>
							</table>
					</div>



					<img src='https://liamsons.com/v4/images/email-banner.jpg ' width='100% ' alt=' '>
					

					<p style='text-align: center;font-size: 13px;letter-spacing: 1px;color: #333;margin: 0; '>CORPORATE OFFICE: Liamsons Business Private Limited</p>
					<p style='text-align: center;font-size: 13px;letter-spacing: 1px;color: #333;margin: 0; '> 2-2-215/14/29, Tirumala enclave, Street No- 1, Near Royal enclave, Macha Bollaram Locality, <br>Alwal Mandal, Medchal-Malkajgiri Dist-500010.</p>

					<p style='text-align: center;font-size: 13px;letter-spacing: 1px;color: #333;margin: 0; '>Phone 1: <a href='tel:9030707961 '>903-070-7961</a>, Phone 2: <a href='tel:7981077230 '>798-107-7230</a> </p>
					<p style='text-align: center;font-size: 13px;letter-spacing: 1px;color: #333;margin: 0; padding-bottom: 15px;'>
							Email 1: <a href='mailto:support@liamsons.com '>support@liamsons.com </a>, Email 2: <a href='tel:sales@liamsons.com '>sales@liamsons.com</a> </p>

				</div>

				</body>

				</html>";
				// echo $msgbody;
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