<?php
//session_start();
include_once "includes/inc_usr_sessions.php";	 //Including user session value
include_once "includes/inc_membr_session.php";//checking for session
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
include_once "includes/inc_membr_session.php";//checking for session	
if(isset($_SESSION['cartcode']) && (trim($_SESSION['cartcode']) != ""))
{
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
$rmrks		= htmlentities($_POST['txtmsg'],ENT_QUOTES);
$paysts		= "n";
$cartsts	= "r";	
$ccrdid 	= 'NULL';
$rdflag		= 0;
if($paymode == "b")
{
$rdflag		= 2; // Redirection to payment gateway
}
else{
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
//	echo $sqrycrtmbr_dtl_adrs; exit;
$srscrtmbr_dtl   = mysqli_query($conn,$sqrycrtmbr_dtl_adrs);
while($srowscrtmbr_dtl = mysqli_fetch_assoc($srscrtmbr_dtl))
{
if($srowscrtmbr_dtl['mbrd_dfltbil'] == 'y')
{
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
if($srowscrtmbr_dtl['mbrd_dfltshp'] == 'y')
{
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
$totamt     = $_POST['hdngnetcartprc'];
$shipprcAry     = explode("-",$_POST['hdnshpngchrgesid']);
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
$chkshop = $_POST['chkshop'];
$paymode	= $pygtwy;	
$ccrdid     = "e";				
//$paygrsamt 	  = ($grsamt * 100);		
$sqrycrtord_mst = "SELECT crtordm_id, crtordm_code from crtord_mst order by crtordm_crtdon desc limit 1"; 
$srscrtord_mst  = mysqli_query($conn,$sqrycrtord_mst);
$cntord_code	= mysqli_num_rows($srscrtord_mst);
if($cntord_code > 0)
{
$srowcrtord_mst = mysqli_fetch_assoc($srscrtord_mst);
$oldcrtord_code = $srowcrtord_mst['crtordm_code'];
$oldcrtord_code1 = strrchr($oldcrtord_code, '-');
$oldcrtord_code = substr($oldcrtord_code1, 1);
$newcrtord_code = (int)$oldcrtord_code + 1;
}
else
{
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
$orddt = "ASH-".date('my')."-";
$newcrtord_code = $orddt.$newcrtord_code;
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
					crtordm_codamt,crtordm_crtdon,crtordm_crtdby) values(						
					'$newcrtord_code','$crtsesval','$bfname','$blname',
					'$badrs','$badrs2','$bcmpny','$bcty', '$bcounty',
					'$bzip','$bcountry','$bph','$bemail',
					'$sfname','$slname','$sadrs','$sadrs2','$scmpny',
					'$scty','$scounty','$szip','$scountry',
					'$sph','$semail','$totqty','$paygrsamt','$disc','$hsn','$gst',
					'r','$cartsts','$paymode',
					'$paysts','$rmrks','$membrid','$shipprc','$chkshop',
					'$cpnid','$cpnscat','$cpnval',
					'$codval','$dt','$membremail')";
	//echo $iqrycrtordmst; exit;																	   
$irscrtordmst		= mysqli_query($conn,$iqrycrtordmst) or die(mysqli_error());		
if($irscrtordmst == true)
{	
	$ordmstid 		= mysqli_insert_id($conn);	 
	$cartval    	= $_SESSION['cartcode'];
	$prodidval  	= $_SESSION['prodid'];			 
	$prodqtyval 	= $_SESSION['prodqty'];
	$ses_crncynm	= $_SESSION['sescrncy'];					
	if(($cartval != "") && ($prodidval != "") && ($prodqtyval != ""))
	{
		$codearr	=	explode(",",$prodidval);
		$qtyarr		=	explode(",",$prodqtyval);	
		//print_r($qtyarr);exit;
		$newArray	=	$codearr;
		$items = explode(',',$cartval);				
		$totqty    = 0;
		$totxlcredits = 0;
		$totcartprc = 0;
		foreach ($items as $items_id=>$items_val)
		{					
			$totuntprc = 0;
			$totbilprc = 0;											
			$cartcodeid  = ""; //For Storing the cart value id
			$cartcodeval = ""; //For Storing the cart code value
			$cartcodeid  = $items_id;
			$cartcodeval = $items_val; //  Stores the cart detail value
			$arr_cartcodeval  = explode("-",$cartcodeval);
			$cart_prodid	  = trim($arr_cartcodeval[0],' '); // Stores the product id 
			$cart_prodprc	  = trim($arr_cartcodeval[1],' '); // Stores the product colour
			$cart_szid	  = trim($arr_cartcodeval[2],' '); // Stores the product colour
			$untqty 		  = trim($qtyarr[$cartcodeid],' '); // Stores the unit quantities
			$cart_ordsts	  = "a";
			$sqryprod_dtl1 = "SELECT  
			prodm_id,prodm_hsncde,prodm_sku,prodprcm_sleprc,prodprcm_ofrprc,prodscatm_igst
			from 
			prod_mst 
			inner join prodprc_mst on prodprcm_prodm_id = prodm_id 	
			inner join prodscat_mst on prodm_prodscatid = prodscatm_id									 
			where 
			prodm_id='$cart_prodid' and
			prodprcm_id ='$cart_prodprc'";
			$srsprod_dtl1  = mysqli_query($conn,$sqryprod_dtl1);				
			$srowprod_dtl1 = mysqli_fetch_assoc($srsprod_dtl1);
			$qty_val 		= $srowprod_dtl1['untm_qty'];
			$igst 		= $srowprod_dtl1['prodscatm_igst'];
			$cgst 		= $srowprod_dtl1['prodscatm_cgst'];
			$sgst		= $srowprod_dtl1['prodscatm_sgst'];
			
			if($srowprod_dtl1['prodprcm_ofrprc'] > 0)
			{					
				$produntprc = $srowprod_dtl1['prodprcm_ofrprc'];
			}
			else
			{
				$produntprc = $srowprod_dtl1['prodprcm_sleprc'];
			}
		

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
			$srowprodsz_dtl  = mysqli_fetch_assoc($srsprodsz_dtl);
			$sz_id 		= $srowprodsz_dtl['prodprcm_id'];
			//$totuntprc    = ($untqty * $produntprc); 
			//$produntprc ;exit;
			$iqrycrtord_dtl  ="insert into crtord_dtl(
			crtordd_sesid,crtordd_prodm_id,
			crtordd_prc,crtordd_qty,crtordd_sgst,crtordd_cgst,crtordd_igst,
			crtordd_sizem_id,crtordd_prodprcd_id,crtordd_sts,crtordd_crtordm_id,crtordd_crtdon,
			crtordd_untm_qty,crtordd_crtdby)values(
			'$crtsesval','$cart_prodid','$produntprc','$untqty','$sgst','$cgst','$igst','$cart_szid',
			'$cart_prodprc','$cart_ordsts','$ordmstid','$dt',
			'$qty_val','$membremail')";
			//echo $iqrycrtord_dtl ;exit;
			$irscrtord_dtl	= mysqli_query($conn,$iqrycrtord_dtl)  or die(mysqli_error($conn));
			//-----------------------------------------------update--------------------------------------------------------------//
			$sqlprcdtl = "select prodprcd_id,prodprcd_qty 
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
			$resprcdtl = mysqli_query($conn,$uqryprcdtl);
			//  echo $uqryprcdtl; exit;
			//-----------------------------------------------update--------------------------------------------------------------//				
		}		// End of For each		
	}				
	if($irscrtord_dtl==true)
	{
		//	echo "-------------------------"."hello"; exit;
		$sqryordsts_mst="select ordstsm_id from ordsts_mst where ordstsm_sts='a' order by ordstsm_prty desc limit 1";
		$irsordsts_mst  = mysqli_query($conn,$sqryordsts_mst);
		$srowordsts_mst = mysqli_fetch_assoc($irsordsts_mst);
		$newid=$srowordsts_mst['ordstsm_id'];
		$iqryordsts_dtl="insert into ordsts_dtl(
						ordstsd_ordstsm_id,ordstsd_crtordm_id,ordstsd_dttm,
						ordstsd_crtdon,ordstsd_crtdby) values(
					'$newid','$ordmstid','$dt',
					'$dt','$membremail')";
					//echo $iqryordsts_dtl; exit;
		$irsordsts_dtl		  = mysqli_query($conn,$iqryordsts_dtl);
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
		$sqrycrtord_mst = "select
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
			$shpchrges_qry = "SELECT shpngm_id,shpngm_prc from shpng_mst where shpngm_sts = 'a' and shpngm_id = '$shpmnid'";
			$shpngchrges_mst = mysqli_query($conn,$shpchrges_qry);
			$num_rows = mysqli_num_rows($shpngchrges_mst);
			if($num_rows > 0 )
			{
				$shpngchrges_dtl = mysqli_fetch_assoc($shpngchrges_mst);
				$shpmnprc = $shpngchrges_dtl['shpngm_prc'];
			} 
			if(($state == "Telangana"))
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
		<img src='https://liamsons.com/v4/img/logo/liamsons-logo.png' style='max-width: 200px;margin: auto;display: block;padding: 10px;' alt=''>
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
       <b style='color:#489359'> Placed</b>
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
        <td width='5%' style='padding: 10px 5px;font-weight: 600;font-size: 15px;letter-spacing: 0.6px;'>Sl No.
        </td>
    
        <td width='20%' style='padding: 10px 5px;font-weight: 600;font-size: 15px;letter-spacing: 0.6px;'>Code/Name
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

		
		$msgbody.="<td width='10%' style='padding: 10px 5px;font-weight: 600;font-size: 15px;letter-spacing: 0.6px;text-align:end;'>Price + Tax</td>
        <td width='10%' style='padding: 10px 5px;font-weight: 600;font-size: 15px;letter-spacing: 0.6px;text-align:end;'>Qty</td>
            <td width='40%' style='padding: 10px 5px;font-weight: 600;font-size: 15px;letter-spacing: 0.6px;text-align:end;'>Total Amount(&#x20B9;)
        </td>
        </tr>";

        $sqrycrtord_dtl =	"SELECT crtordd_id, crtordd_qty,crtordd_prc,prodm_id,prodm_name, crtordd_prc as unprcval,prodszvrtnm_vrtn_nms,prodszvrtnm_id,prodprcm_id,prodprcm_sku,prodprcm_sleprc,prodprcm_ofrprc ,prodm_name,crtordm_shpchrgm_id,crtordd_igst,crtordd_sgst,crtordd_cgst
        from crtord_dtl 
        inner join crtord_mst on crtordd_crtordm_id = crtordm_id
        left join prod_mst on prod_mst.prodm_id = crtord_dtl.crtordd_prodm_id 
        inner join prodsz_vrtns_mst on prodszvrtnm_id = crtordd_sizem_id 
        inner join prodprc_mst on crtordd_prodprcd_id = prodprcm_id where crtordd_crtordm_id = $ordmstid group by crtordd_id";
    //echo $sqrycrtord_dtl;
   $srscrtord_dtl = mysqli_query($conn, $sqrycrtord_dtl);
   $cnttorec = mysqli_num_rows($srscrtord_dtl);
   $totqty = "";
   $totlprc = "";
   $cntord = 0;
   if($cnttorec > 0)
   {
     while($rowspo_mst=mysqli_fetch_assoc($srscrtord_dtl))
     {
       $cntord += 1;
       $db_qty = $rowspo_mst['crtordd_qty'];
       //$crtordm_prctyp = 'u';
       if($crtordm_prctyp == 'u')
       {
         $db_prc = funcDlrprc($rowspo_mst['crtordd_prc'],$conn);
         $dbunt_prc = funcDlrprc($rowspo_mst['unprcval'],$conn);
       }
       else
       {
         $db_prc = $rowspo_mst['crtordd_prc'];
         $dbunt_prc = $rowspo_mst['unprcval'];
       }
       //$szid =	$rowspo_mst['szid'];
       $crtprdid =	$rowspo_mst['crtordd_prodm_id'];
       $prcid = $rowspo_mst['crtordd_prodprcd_id'];
       $totprc = ($db_qty * $db_prc);
       $db_shpprcid = $rowspo_mst['crtordm_shpchrgm_id'];
       $shpngqry = "SELECT shpngm_id,shpngm_prc from  shpng_mst WHERE shpngm_id = $db_shpprcid and shpngm_sts = 'a' ";
       $shpng_mst = mysqli_query($conn,$shpngqry);
       $shpng_dtl = mysqli_fetch_assoc($shpng_mst);
       $db_shpprc = $shpng_dtl['shpngm_prc'];
       $igstval = $rowspo_mst['crtordd_igst'];
       $sgstval = $rowspo_mst['crtordd_sgst'];
       $cgstval = $rowspo_mst['crtordd_cgst'];
    
       $dmeonamt = 100 + $igstval;
       $prodtax = ($db_prc / $dmeonamt) * $igstval;
       $gstval = $igstval;
      //  echo"here".$gstval;
       $totlprdprc = ($totlprdprc+$totprc);
       // $gst = 1+($gstval/100);
       // $sgst = 1+($sgstval/100);
       // $cgst = 1+($cgstval/100);
       //$prdprc  = $db_prc/$gst;
       $prdprc  = $db_prc-$prodtax;
       $sgstprdprc = $db_prc/$sgst;
       $cgstprdprc = $db_prc/$cgst;
       $prdwoustgst = $prdprc; 
       $prdwoustsgst = $sgstprdprc; 
       $prdwoustcgst = $cgstprdprc; 
       // $tax = $db_prc - $prdwoustgst;
       // $sgsttax = $db_prc - $prdwoustsgst;
       // $cgsttax = $db_prc - $prdwoustcgst;
       $igstper =$gstper;
       $substr = substr($gstnm,0,2);
       if($nmstrws == 1)
       {
		
         $gstdiv =  $prodtax/2;
         $cgst = number_format($gstdiv,2,'.',',');
         $sgst = number_format( $gstdiv,2,'.',',');
         $gstper = ($gstval/2)."%";
       }
       $igstper  = $gstval."%"; 
		    $prodm_name= $rowspo_mst['prodm_name'];
		    $prodprcm_sku=$rowspo_mst['prodprcm_sku'];
	  	$prodszvrtnm_vrtn_nms=$rowspo_mst['prodszvrtnm_vrtn_nms'];
		  $msgbody .= "<tr style='border-bottom: 1px solid #b3b3b3'>
		  <td style='padding: 6px 5px;font-size: 15px;letter-spacing: 0.6px;'>$cntord</td>
		  <td style='padding: 6px 5px;font-size: 15px;letter-spacing: 0.6px;'>
		  Name: $prodm_name </br>
		  Code: $prodprcm_sku </br>";
		  if ($prodszvrtnm_vrtn_nms != '')
		  {
			  $msgbody .= "Size:$prodszvrtnm_vrtn_nms";
		  }
		  
		  $msgbody .= "</td>";
		  $msgbody .= "<td style='padding: 6px 5px;font-size: 15px;letter-spacing: 0.6px;text-align:end;'>";
    
            $totalprdprc +=	$prdprc;
           $prdwoustgst = $prdprc;
           $prdprc= number_format($prdwoustgst,2,'.',',');
           
        $msgbody.=" $prdprc </td>";
        if($nmstrws == 1){
          $totalcgst += $cgst;
          $totalsgst += $sgst;
        $msgbody.="<td style='padding: 6px 5px;font-size: 15px;letter-spacing: 0.6px;text-align:end;'>$cgst<br>($gstper)
		<td style='padding: 6px 5px;font-size: 15px;letter-spacing: 0.6px;text-align:end;'>$sgst<br>($gstper)";
      }
        else{
        $totaltax += $prodtax;
        $prodtax=number_format($prodtax,2,'.',',');
        $msgbody.="<td style='padding: 6px 5px;font-size: 15px;letter-spacing: 0.6px;text-align:end;'>$prodtax<br>($igstper)</td>";
      
          }
          $Tot_price+=$db_prc;
	 $msgbody.=" 
         <td style='padding: 6px 5px;font-size: 15px;letter-spacing: 0.6px;text-align:end;'>$db_prc</td>
         <td style='padding: 6px 5px;font-size: 15px;letter-spacing: 0.6px;text-align:end;'>";  
          $db_qty;
           $totqty	=	$totqty + $db_qty;
         
        $msgbody.=" $db_qty</td>
         
		<td style='padding: 6px 5px;font-size: 15px;letter-spacing: 0.6px;text-align:end;'>";
         
           $prc=number_format($totprc,2,'.',',');
           $totlprc = ($totlprc+$totprc);
        
        $msgbody.="$prc </td>
    </tr>";
       
     }
   }
   $msgbody.="<tr><td style='padding: 6px 5px;font-size: 15px;letter-spacing: 0.6px;text-align:center;'colspan='2'></td>
                  ";
                  $totalprdprc =  number_format($totalprdprc,2,'.',',');
                  $totaltax = number_format($totaltax,2,'.',',');
                  $Tot_price = number_format($Tot_price,2,'.',',');
                  $msgbody.="<td style='padding: 6px 5px;font-size: 15px;letter-spacing: 0.6px;text-align:end;'><strong>$totalprdprc</strong></td>";
                  if($nmstrws == 1){
                    $msgbody.="<td style='padding: 6px 5px;font-size: 15px;letter-spacing: 0.6px;text-align:end;'><strong>$totalcgst</strong></td>";
                    $msgbody.="<td style='padding: 6px 5px;font-size: 15px;letter-spacing: 0.6px;text-align:end;'><strong>$totalsgst</strong></td>";
                  }else{
                    $msgbody.="<td style='padding: 6px 5px;font-size: 15px;letter-spacing: 0.6px;text-align:end;'><strong>$totaltax</strong></td>";
                  }
                  $msgbody.="<td style='padding: 6px 5px;font-size: 15px;letter-spacing: 0.6px; text-align:end;'><strong>$Tot_price</strong></td>";
                  $prodcost = number_format($ntitmprc,2,'.',',');
                    $msgbody.="<td style='padding: 6px 5px;font-size: 15px;letter-spacing: 0.6px;text-align:end;'><strong>$totqty</strong></td>";
                    
                   
  
  
                    $totlprc1 = number_format($totlprc,2,'.',',');
  $msgbody.="
 
  <td style='padding: 10px 5px;font-weight: 500;font-size: 12px;letter-spacing: 0.5px;text-align:end;'>Product Cost: $totlprc1
  ";
  $totlprc = $totlprc+$taxcnty;
  $cupid  = $rowsord_mst['crtordm_cpnm_id'];
  $cupnm  = $rowsord_mst['cpnm_name'];
  if($cupid!=0)
  {
    $cupval  = $rowsord_mst['crtordm_cpnm_val'];
    $totlprc -= $cupval;
    $msgbody.="Coupon(Applied)$cupnm : -$cupval ";
  }
  if($totlprc != 0)
  {
    $totlprc +=  $db_shpprc;
    $msgbody.="<br>Shipping Charges : $db_shpprc";
  }
  else
  {
    $shpprc = 0;
    $totlprc +=  $db_shpprc;
    //	echo '<br><strong>Shipping Charges Not Appilcable for More than 3000 Purchase: $shpprc</strong>';
    $msgbody.="<br>Shipping Charges : $db_shpprc";
  }
  $msgbody.="<br>Order Amount : ";
  if($regid =='')
  {
    $regid = $crtmbrid;
  }
  if($crtdiscamt != 0)
  {
    $netTotal = $totlprc;
    $disPrc = $crtdiscamt;
    $ntTogPrc = $netTotal-$disPrc;
    $ntTogPrc=number_format($ntTogPrc,2,'.',',');
    $msgbody.="Net Total You get a 10% Discount for First time Purchase order :$ntTogPrc";
  }
  else
  {
    $totlprc=number_format($totlprc,2,'.',',');
    $msgbody.="$totlprc";
  }
  $msgbody.="</td></tr></table>";
  $msgbody.="</div> <div>
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


						
		$to       = $bemail;
		$from     = $u_prjct_email;
		$subject  = " $usr_cmpny order " .$ordcode." has been Placed";
		$headers  = "From: " . $from . "\r\n";
		$headers .= "CC: ".$from ."\r\n";
		$headers .= "MIME-Version: 1.0\r\n";
		$headers .= "Content-Type: text/html; charset=ISO-8859-1\r\n";
		
		// echo $msgbody; exit;
		mail($to,$subject,$msgbody,$headers);	
}				
?>

	
			      <?php
						
						$Rzaction = $rtpth."razorpay/pay.php";
						
						?>
	<form method="POST" name="frmpymntRzrpy" id="frmpymntRzrpy" action="<?php echo $Rzaction ?>">
		<input type="hidden" name="hdntxnid" value="<?php echo $ordcode;?>"/>
		<input type="hidden" name="hdnodrid" value="<?php echo $ordmstid;?>"/>
		<input type="hidden" name="hdnordcode" value="<?php echo $newcrtord_code; ?>"/>
		<input type="hidden" name="hdnamount" id="hdnamount" value="<?php echo number_format($paygrsamt,2,'.',','); ?>"/>
		<input type="hidden" name="hdnproductinfo" id="hdnproductinfo" value="" size="64"/>
		<input type="hidden" name="hdnfirstname" id="hdnfirstname" value="<?php echo $bfname;?>"/>
		<input type="hidden" name="hdnemail" id="hdnemail" value="<?php echo $bemail;?>"/>
		<input type="hidden" name="hdnphone" id="hdnphone" value="<?php echo $bph;?>"/>
	</form>

	
	<script language="javascript" type="text/javascript">
		document.getElementById('frmpymntRzrpy').action = "<?php echo $Rzaction;?>";
		document.getElementById('frmpymntRzrpy').submit();
	</script>
	<?php
    }
}   
else{
$msg = "Some error in your cart. Please contact customer care";
}
}
else{
?>
<script language="javascript" type="text/javascript">
	location.href = '<?php echo $_SERVER['HTTP_HOST'];?>';
</script>	
<?php
}
?>		