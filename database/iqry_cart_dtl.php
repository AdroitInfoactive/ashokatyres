<?php
//session_start();
include_once "includes/inc_usr_sessions.php";	 //Including user session value
include_once "includes/inc_membr_session.php"; //checking for session
include_once "includes/inc_connection.php";
include_once "includes/inc_usr_functions.php";
include_once "includes/inc_config.php";
?>
<!-- <style type="text/css">
body {
background-color: #000000;
margin-left: 0px;
margin-top: 0px;
margin-right: 0px;
margin-bottom: 0px;
}
</style> -->

<?php

if (isset($_SESSION['cartcode']) && (trim($_SESSION['cartcode']) != "")) {
	$usrmsg = "<table width=\"1003\" height=\"100%\" border=\"0\" align=\"center\" cellpadding=\"20\" cellspacing=\"1\" bgcolor=\"#000000\">
<tr>
<td><table border=\"0\" align=\"center\" cellpadding=\"14\" cellspacing=\"0\">
	<tr>
	<td valign=\"middle\"><img src=\"images/loading.gif\" width=\"32\" height=\"32\" /></td>
	<td align=\"center\" valign=\"middle\" bgcolor=\"#F7F7F7\" class=\"confirmtitles\">Order is in process, please wait... </td>
	</tr>
</table></td>
</tr>
</table>";
	$crtsesval 	= session_id();
	date_default_timezone_set('Asia/Kolkata');
	//$dt         = date('Y-m-d h:i:s');
	$dt         = date('Y-m-d');
	$newdate	= date("d-m-Y h:i:s");
	$rmrks		= htmlentities($_POST['txtmsg'], ENT_QUOTES);
	$paysts		= "n";
	$cartsts	= "r";
	$ccrdid 	= 'NULL';
	$rdflag		= 0;
	if ($paymode == "b") {
		$rdflag		= 2; // Redirection to payment gateway
	} else {
		$rdflag		= 1; // Redirection to payment gateway
	}
	$xlcrdtflag = 1; // Xl Credit Insertion
	$crncyid	= $_SESSION['sescrncy'];
	$shpchrgprc	  =  $gselshpchrg;
	$shipprc = 0;

	$sqrycrtmbr_dtl_adrs  = "select * from 
						vw_mbr_mst_dtl_bil 
						where 
						mbrm_id = '$membrid' 
						and (mbrd_dfltbil='y' or 
						mbrd_dfltshp='y') limit 2";
	//echo $sqrycrtmbr_dtl_adrs; exit;
	$srscrtmbr_dtl   = mysqli_query($conn, $sqrycrtmbr_dtl_adrs);
	while ($srowscrtmbr_dtl = mysqli_fetch_assoc($srscrtmbr_dtl)) {
		if ($srowscrtmbr_dtl['mbrd_dfltbil'] == 'y') {
			$bfname 	  = $srowscrtmbr_dtl['mbrd_fstname'];
			$blname		  = $srowscrtmbr_dtl['mbrd_lstname'];
			$badrs	 	  = $srowscrtmbr_dtl['mbrd_badrs'];
			$badrs2   	  = $srowscrtmbr_dtl['mbrd_badrs2'];
			$bcmpny   	  = $srowscrtmbr_dtl['mbrd_cmpny'];
			$bcty	 	  = $srowscrtmbr_dtl['mbrd_bctym_id'];
			$bcounty  	  = $srowscrtmbr_dtl['mbrd_bmbrcntym_id'];
			$bzip	 	  = $srowscrtmbr_dtl['mbrd_bzip'];
			$bcountry 	  = $srowscrtmbr_dtl['mbrd_bmbrcntrym_id'];
			$bemail	 	  = $srowscrtmbr_dtl['mbrm_emailid'];
			$bph		  = $srowscrtmbr_dtl['mbrd_bdayphone'];
			$bctyname	  = $srowscrtmbr_dtl['ctym_name'];
			$bcntyname	  = $srowscrtmbr_dtl['cntym_name'];
			$bcntryname	  = $srowscrtmbr_dtl['cntrym_iso'];
		}
		if ($srowscrtmbr_dtl['mbrd_dfltshp'] == 'y') {
			$sfname 	  = $srowscrtmbr_dtl['mbrd_fstname'];
			$slname		  = $srowscrtmbr_dtl['mbrd_lstname'];
			$sadrs	  	  = $srowscrtmbr_dtl['mbrd_badrs'];
			$sadrs2   	  = $srowscrtmbr_dtl['mbrd_badrs2'];
			$scmpny   	  = $srowscrtmbr_dtl['mbrd_cmpny'];
			$scty	  	  = $srowscrtmbr_dtl['mbrd_bctym_id'];
			$scounty  	  = $srowscrtmbr_dtl['mbrd_bmbrcntym_id'];
			$szip	  	  = $srowscrtmbr_dtl['mbrd_bzip'];
			$scountry 	  = $srowscrtmbr_dtl['mbrd_bmbrcntrym_id'];
			$semail	  	  = $srowscrtmbr_dtl['mbrm_emailid'];
			$sph	  	  = $srowscrtmbr_dtl['mbrd_bdayphone'];
			$sctyname	  = $srowscrtmbr_dtl['ctym_name'];
			$scntyname	  = $srowscrtmbr_dtl['cntym_name'];
			$scntryname	  = $srowscrtmbr_dtl['cntrym_iso'];
		}
	}
	$crtwt		= "";
	$totqty		= $_SESSION['totqty'];
	$totamt     = $_POST['ntTogPrc'];
	$shipprcAry     = explode("-", $_POST['hdnshpngchrgesid']);
	$shpchrgtyp        = $_POST['hdnmnshpprc'];
	//echo  "Shipping".$shpchrgtyp;exit;
	$shipprc        = $_POST['hdnshpngchrgesid'];
	//$shpchrgtyp        = $shipprcAry[0];
	//$totamt		= $_SESSION['totamt'];	
	//$grsamt		= $totamt + $shipprc;
	$paygrsamt		= $totamt;
	$disc = $_POST['txtdisamt'];
	$cpnid = $_POST['hdncpncde'];
	$cpnscat = $_POST['hdncpnscat'];
	$cpnval = $_POST['hdncpnval'];
	$gst = $_POST['txtgst'];
	$hsn = $_POST['txthsncde'];
	$pygtwy = $_POST['chkpay'];
	$chkshop = $_POST['chrgs'];
	$strloc = $_POST['strloc'];
	$paymode	= $pygtwy;
	$ccrdid     = "e";
	//$paygrsamt 	  = ($grsamt * 100);		
	$sqrycrtord_mst = "SELECT crtordm_id, crtordm_code from crtord_mst order by crtordm_crtdon desc limit 1";
	$srscrtord_mst  = mysqli_query($conn, $sqrycrtord_mst);
	$cntord_code	= mysqli_num_rows($srscrtord_mst);
	if ($cntord_code > 0) {
		$srowcrtord_mst = mysqli_fetch_assoc($srscrtord_mst);
		$oldcrtord_code = $srowcrtord_mst['crtordm_code'];
		$oldcrtord_code1 = strrchr($oldcrtord_code, '-');
		$oldcrtord_code = substr($oldcrtord_code1, 1);
		$newcrtord_code = (int)$oldcrtord_code + 1;
	} else {
		$newcrtord_code = 1;
	}
	$codval = 0;
	// if($paymode =='a'){
	// 	$codval = $_POST['hdncodprc'];;	
	// 	$paygrsamt = ($paygrsamt+$codval);
	// }
	//$shpchrgtyp = 0;
	$paymode = 'o';
	$dt = date('Y-m-d h:i:s');
	$orddt = "ASH-" . date('my') . "-";
	$newcrtord_code = $orddt . $newcrtord_code;
	$usrcpnval = 0;
	$iqrycrtordmst = "INSERT into crtord_mst(
					crtordm_code,crtordm_sesid,crtordm_fstname,crtordm_lstname,
					crtordm_badrs,crtordm_badrs2,crtordm_bcmpny,crtordm_bmbrctym_id,crtordm_bmbrcntym_id,
					crtordm_bzip,crtordm_bmbrcntrym_id,crtordm_bdayphone,crtordm_emailid,
					crtordm_sfstname,crtordm_slstname,crtordm_sadrs,crtordm_sadrs2,crtordm_scmpny,
					crtordm_smbrctym_id,crtordm_smbrcntym_id,crtordm_szip,crtordm_smbrcntrym_id,
					crtordm_sdayphone,crtordm_semailid,crtordm_qty,crtordm_amt,crtordm_disamt,
					crtordm_hsncde,crtordm_igst,		   
					crtordm_prcssts,crtordm_cartsts,crtordm_pmode,
					crtordm_paysts,crtordm_rmks,crtordm_mbrm_id,
					crtordm_shpchrgm_id,crtordm_shpchrgamt,
					crtordm_cpnm_id,crtordm_cpnm_typ,crtordm_cpnm_val,
					crtordm_codamt,crtordm_deltype,crtordm_fitloc,crtordm_crtdon,crtordm_crtdby) values(						
					'$newcrtord_code','$crtsesval','$bfname','$blname',
					'$badrs','$badrs2','$bcmpny','$bcty', '$bcounty',
					'$bzip','$bcountry','$bph','$bemail',
					'$sfname','$slname','$sadrs','$sadrs2','$scmpny',
					'$scty','$scounty','$szip','$scountry',
					'$sph','$bemail','$totqty','$paygrsamt','$disc','$hsn','$gst',
					'r','$cartsts','$paymode',
					'$paysts','$rmrks','$membrid','$shipprc','$chkshop',
					'$cpnid','$cpnscat','$cpnval',
					'$codval','','$strloc','$dt','$membremail')";
	//echo $iqrycrtordmst; exit;																	   
	$irscrtordmst		= mysqli_query($conn, $iqrycrtordmst) or die(mysqli_error($conn));
	if ($irscrtordmst == true) {
		$ordmstid 		= mysqli_insert_id($conn);
		$cartval    	= $_SESSION['cartcode'];
		$prodidval  	= $_SESSION['prodid'];
		$prodqtyval 	= $_SESSION['prodqty'];
		$ses_crncynm	= $_SESSION['sescrncy'];
		if (($cartval != "") && ($prodidval != "") && ($prodqtyval != "")) {
			$codearr	=	explode(",", $prodidval);
			$qtyarr		=	explode(",", $prodqtyval);
			//print_r($qtyarr);exit;
			$newArray	=	$codearr;
			$items = explode(',', $cartval);
			$totqty    = 0;
			$totxlcredits = 0;
			$totcartprc = 0;
			foreach ($items as $items_id => $items_val) {
				$totuntprc = 0;
				$totbilprc = 0;
				$cartcodeid  = ""; //For Storing the cart value id
				$cartcodeval = ""; //For Storing the cart code value
				$cartcodeid  = $items_id;
				$cartcodeval = $items_val; //  Stores the cart detail value
				$arr_cartcodeval  = explode("-", $cartcodeval);
				$cart_prodid	  = trim($arr_cartcodeval[0], ' '); // Stores the product id 
				$cart_prodprc	  = trim($arr_cartcodeval[1], ' '); // Stores the product colour
				$cart_szid	  = trim($arr_cartcodeval[2], ' '); // Stores the product colour
				$untqty 		  = trim($qtyarr[$cartcodeid], ' '); // Stores the unit quantities
				$cart_ordsts	  = "a";
				$sqryprod_dtl1 = "SELECT 	prodm_id,prodm_sku,prodm_code,prodm_sleprc,prodm_ofrprc
			from 	prod_mst 	where 	prodm_id='$cart_prodid' ";
				/* and prodprcm_id ='$cart_prodprc'	inner join prodprc_mst on prodprcm_prodm_id = prodm_id 	
			inner join prodscat_mst on prodm_prodscatid = prodscatm_id */
				$srsprod_dtl1  = mysqli_query($conn, $sqryprod_dtl1);
				$srowprod_dtl1 = mysqli_fetch_assoc($srsprod_dtl1);
				$qty_val 		= $srowprod_dtl1['untm_qty'];
				/* 	$igst 		= $srowprod_dtl1['prodscatm_igst'];
			$cgst 		= $srowprod_dtl1['prodscatm_cgst'];
			$sgst		= $srowprod_dtl1['prodscatm_sgst']; */

				if ($srowprod_dtl1['prodm_ofrprc'] > 0) {
					$produntprc = $srowprod_dtl1['prodm_ofrprc'];
				} else {
					$produntprc = $srowprod_dtl1['prodm_sleprc'];
				}

				/* 
			$sqryprodsz_dtl = "select 
			prodprcm_id,prodprcm_vrtn_id
			from 
			prodprc_mst 
			INNER JOIN  prodsz_vrtns_mst ON prodszvrtnm_id = prodprcm_vrtn_id										 
			where 
			prodprcm_id='$cart_prodprc'
			and
			prodprcm_prodm_id = '$cart_prodid'";
			
			//echo $sqryprodsz_dtl;
			$srsprodsz_dtl  = mysqli_query($conn,$sqryprodsz_dtl);				
			$srowprodsz_dtl  = mysqli_fetch_assoc($srsprodsz_dtl); */
				//$sz_id 		= $srowprodsz_dtl['prodprcm_id'];
				//$totuntprc    = ($untqty * $produntprc); 
				//$produntprc ;exit;
				$iqrycrtord_dtl  = "insert into crtord_dtl(
			crtordd_sesid,crtordd_prodm_id,
			crtordd_prc,crtordd_qty,crtordd_sgst,crtordd_cgst,crtordd_igst,
			crtordd_sizem_id,crtordd_prodprcd_id,crtordd_sts,crtordd_crtordm_id,crtordd_crtdon,
			crtordd_untm_qty,crtordd_crtdby)values(
			'$crtsesval','$cart_prodid','$produntprc','$untqty','$sgst','$cgst','$igst','$cart_szid',
			'$cart_prodprc','$cart_ordsts','$ordmstid','$dt',
			'$qty_val','$membremail')";
				//	echo $iqrycrtord_dtl ;exit;
				$irscrtord_dtl	= mysqli_query($conn, $iqrycrtord_dtl)  or die(mysqli_error($conn));
				//-----------------------------------------------update--------------------------------------------------------------//
				/* 	$sqlprcdtl = "select prodprcd_id,prodprcd_qty 
			from
			prodprc_dtl
			where prodprcd_id = '$sz_id'";
			///echo $sqlprcdtl; exit;
			$resprcdtl = mysqli_query($conn,$sqlprcdtl);
			$rwsprcdtl = mysqli_fetch_array($resprcdtl);
			$prdqnty = $rwsprcdtl['prodprcd_qty'];
			$updtqty = $prdqnty-$untqty;

			if($prdqnty == 0){
			$updtqty = 0;
			}else{
			$updtqty = $updtqty;
			}
			$uqryprcdtl = "update prodprc_dtl set
			prodprcd_qty = $updtqty
			where prodprcd_id = '$sz_id'";
			$resprcdtl = mysqli_query($conn,$uqryprcdtl); */
				//  echo $uqryprcdtl; exit;
				//-----------------------------------------------update--------------------------------------------------------------//				
			}		// End of For each		
		}
		if ($irscrtord_dtl == true) {
			//	echo "-------------------------"."hello"; exit;
			$sqryordsts_mst = "SELECT ordstsm_id from ordsts_mst where ordstsm_sts='a' order by ordstsm_prty asc limit 1";
			$irsordsts_mst  = mysqli_query($conn, $sqryordsts_mst);
			$srowordsts_mst = mysqli_fetch_assoc($irsordsts_mst);
			$newid = $srowordsts_mst['ordstsm_id'];
			$iqryordsts_dtl = "insert into ordsts_dtl(
						ordstsd_ordstsm_id,ordstsd_crtordm_id,ordstsd_dttm,
						ordstsd_crtdon,ordstsd_crtdby) values(
					'$newid','$ordmstid','$dt',
					'$dt','$membremail')";
			//echo $iqryordsts_dtl; exit;
			$irsordsts_dtl		  = mysqli_query($conn, $iqryordsts_dtl);
			unset($_SESSION['cartcode']);
			unset($_SESSION['prodid']);
			unset($_SESSION['prodqty']);
			unset($_SESSION['cart']);
			unset($_SESSION['prodgft']);
			unset($_SESSION['sescrncy']);
			$_SESSION['cartcode']	= '';
			$_SESSION['prodid']	= '';
			$_SESSION['prodqty']	= '';
			$_SESSION['prodprc']	= '';
			$_SESSION['cart']		= '';
			// session_destroy();

			$sqrycrtord_mst = "SELECT
						crtordm_id,crtordm_code,crtordm_fstname,crtordm_lstname, 
						crtordm_badrs,crtordm_badrs2,crtordm_bcmpny,blcnty.cntym_name as bcntynm, blcty.ctym_name as bctynm,
						crtordm_bzip,blcntry.cntrym_name as bcntrynm,crtordm_bdayphone,
						crtordm_emailid,crtordm_sfstname,crtordm_slstname,crtordm_sadrs,
						crtordm_sadrs2,crtordm_scmpny,
						shpcnty.cntym_name as scntynm,shpcty.ctym_name as sctynm,
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
						
						
						left join cnty_mst blcnty on blcnty.cntym_id = crtord.crtordm_bmbrcntym_id 
						left join cnty_mst shpcnty on shpcnty.cntym_id = crtord.crtordm_smbrcntym_id
						
						left join cntry_mst blcntry on blcntry.cntrym_id= blcnty.cntym_cntrym_id 
						left join cntry_mst shpcntry on shpcntry.cntrym_id= shpcnty.cntym_cntrym_id	
						left join shpng_mst on crtord.crtordm_shpchrgm_id = shpngm_id	
							left join cpn_mst on cpn_mst.cpnm_id = crtordm_cpnm_id 
						 left join cty_mst blcty on blcty.ctym_id = crtord.crtordm_bmbrctym_id
						 left join cty_mst shpcty on shpcty.ctym_id = crtord.crtordm_smbrctym_id 
					
					where 
						crtordm_id = '$ordmstid'";



			//echo $sqrycrtord_mst; exit;
			$srscrtord_mst = mysqli_query($conn, $sqrycrtord_mst);
			$cntord_rec	   = mysqli_num_rows($srscrtord_mst);
			// echo "hai";exit;
			if ($cntord_rec > 0) {
				$srowcrtord_mst = mysqli_fetch_assoc($srscrtord_mst);
				$crtord_id	= $srowcrtord_mst['crtordm_id'];
				$bfname  	= $srowcrtord_mst['crtordm_fstname'];
				$blname	  	= $srowcrtord_mst['crtordm_lstname'];
				$bemail 	= $srowcrtord_mst['crtordm_emailid'];
				$ordcode 	= $srowcrtord_mst['crtordm_code'];
				$ordmid	 	= base64_encode($srowcrtord_mst['crtordm_id']);
				$orddate 	= $srowcrtord_mst['crtordm_crtdon_dt'] . " " . $srowcrtord_mst['crtordm_crtdon_tm'];
				// $shipname 	= $srowcrtord_mst['shpchrgm_name'];	 
				$shpprc  	= $srowcrtord_mst['crtordm_shpchrgamt'];
				$sfname   	= $srowcrtord_mst['crtordm_sfstname'];
				$slname	  	= $srowcrtord_mst['crtordm_slstname'];
				$sadrs	  	= $srowcrtord_mst['crtordm_sadrs'];
				$sgst   	= $srowcrtord_mst['crtordm_sadrs2'];
				$scom   	= $srowcrtord_mst['crtordm_scmpny'];
				$scty 	  	= $srowcrtord_mst['sctynm'];
				$scounty  	= $srowcrtord_mst['scntynm'];
				$state 	= $srowcrtord_mst['scntynm'];
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
				$paysts = $srowcrtord_mst['crtordm_paysts'];
										if($paysts == 'n'){
												$psts = "No";
										}
										if($paysts == 'y'){
												$psts = "Yes";
										}
										$sqry_crtord_sts = "SELECT ordstsd_ordstsm_id from ordsts_dtl where ordstsd_crtordm_id = $ordmstid order by ordstsd_id desc limit 1";
										$ordsts_dtl = mysqli_query($conn, $sqry_crtord_sts);
										$srs_ordsts_dtl = mysqli_fetch_assoc($ordsts_dtl);
										$ordsts = $srs_ordsts_dtl['ordstsd_ordstsm_id'];
										$ordqnty = $order_dtl['crtordm_qty'];
										$ordamt = $order_dtl['crtordm_amt'];
										//$ordsts = $order_dtl['ordstsd_ordstsm_id'];
										$state=$order_dtl['scntynm'];
										$ordsts_qry = "SELECT ordstsm_id, ordstsm_name, ordstsm_desc, ordstsm_sts, ordstsm_prty FROM ordsts_mst WHERE ordstsm_id = $ordsts ";
										$ordersts_mst = mysqli_query($conn,$ordsts_qry);
										$ordersts_dtl = mysqli_fetch_assoc($ordersts_mst);
										$type = $ordersts_dtl['ordstsm_name'];
										
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
				$hdimg    = "http://" . $u_prjct_mnurl . "/" . $site_logo; //Return the URL	
				$orddate	= date('l jS F Y', strtotime($orddate));

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
							<p><strong  style='color:color:#332308;'>Payment Status</strong> <span style='color:#e99005'>	$psts</span></p>
							<p><strong  style='color:color:#332308;'>Order Status</strong> $type</p>
							<p><strong  style='color:color:#332308;'>Order will be delivered by 7 Business days.</strong></p>
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
				 where crtordd_crtordm_id = $ordmstid group by crtordd_id";
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
							$imgpth = $rtpth . $gprodsimg_usrpth . $img . '.jpg';
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

			//	echo $msgbody;exit;
			


				$to       = $bemail;
				$from     = $u_prjct_email;
				$subject  = " $usr_cmpny order " . $ordcode . " has been Placed";
				$headers  = "From: " . $from . "\r\n";
				$headers .= "CC: " . $from . "\r\n";
				$headers .= "MIME-Version: 1.0\r\n";
				$headers .= "Content-Type: text/html; charset=ISO-8859-1\r\n";

				// echo $msgbody; exit;
				mail($to, $subject, $msgbody, $headers);
			}
?>


			<?php

			$Rzaction = $rtpth . "razorpay/pay.php";

			?>
			<form method="POST" name="frmpymntRzrpy" id="frmpymntRzrpy" action="<?php echo $Rzaction ?>">
				<input type="hidden" name="hdntxnid" value="<?php echo $ordcode; ?>" />
				<input type="hidden" name="hdnodrid" value="<?php echo $ordmstid; ?>" />
				<input type="hidden" name="hdnordcode" value="<?php echo $newcrtord_code; ?>" />
				<input type="hidden" name="hdnamount" id="hdnamount" value="<?php echo number_format($paygrsamt, 2, '.', ','); ?>" />
				<input type="hidden" name="hdnproductinfo" id="hdnproductinfo" value="" size="64" />
				<input type="hidden" name="hdnfirstname" id="hdnfirstname" value="<?php echo $bfname; ?>" />
				<input type="hidden" name="hdnemail" id="hdnemail" value="<?php echo $bemail; ?>" />
				<input type="hidden" name="hdnphone" id="hdnphone" value="<?php echo $bph; ?>" />
			</form>


			<script language="javascript" type="text/javascript">
				document.getElementById('frmpymntRzrpy').action = "<?php echo $Rzaction; ?>";
				document.getElementById('frmpymntRzrpy').submit();
			</script>
	<?php
		}
	} else {
		$msg = "Some error in your cart. Please contact customer care";
	}
} else {
	?>
	<script language="javascript" type="text/javascript">
		location.href = '<?php echo $_SERVER['HTTP_HOST']; ?>';
	</script>
<?php
}
?>