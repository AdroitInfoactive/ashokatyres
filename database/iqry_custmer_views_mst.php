<?php	
include_once '../includes/inc_config.php'; //Making paging validation
include_once $inc_nocache; //Clearing the cache information
include_once $adm_session; //checking for session
include_once $inc_cnctn; //Making database Connection
include_once $inc_usr_fnctn; //checking for session 
include_once $inc_pgng_fnctns; //Making paging validation
include_once $inc_fldr_pth; //Making paging validation
if(isset($_POST['btnbnrsbmt']) && (trim($_POST['btnbnrsbmt']) != "") && isset($_POST['txtname']) && (trim($_POST['txtname']) != "") && isset($_POST['txtprior']) && (trim($_POST['txtprior']) != ""))
{
	$name = glb_func_chkvl($_POST['txtname']);
	$desc = addslashes(trim($_POST['txtdesc']));
	$prior = glb_func_chkvl($_POST['txtprior']);
	$bnrimg = glb_func_chkvl($_POST['flebnrimg']);
	$link = glb_func_chkvl($_POST['txtlnk']);
	$sts = glb_func_chkvl($_POST['lststs']);
	$curdt = date('Y-m-d h-i-s');
	$sqrycust_views_mst = "SELECT custmer_name from cust_views_mst where custmer_name ='$name'";
	$srscust_views_mst = mysqli_query($conn,$sqrycust_views_mst);
	$rows = mysqli_num_rows($srscust_views_mst);
	if($rows < 1)
	{
		if(isset($_FILES['flebnrimg']['tmp_name']) && ($_FILES['flebnrimg']['tmp_name']!=""))
		{
			$bnrimgval = funcUpldImg('flebnrimg','bnrimg');
			if($bnrimgval != "")
			{
				$bnrimgary = explode(":",$bnrimgval,2);
				$bnrdest = $bnrimgary[0];
				$bnrsource = $bnrimgary[1];
			}
		}
		$iqrycust_views_mst="INSERT into cust_views_mst(custmer_name, custmer_desc, custmer_lnk, custmer_prty, custmer_sts, custmer_imgnm, custmer_crtdon, custmer_crtdby) values ('$name', '$desc', '$link', '$prior', '$sts', '$bnrdest', '$curdt', '$ses_admin')";
		$irscust_views_mst= mysqli_query($conn,$iqrycust_views_mst) or die(mysqli_error());
		if($irscust_views_mst==true)
		{
			if(($bnrsource!='none') && ($bnrsource!='') && ($bnrdest != ""))
			{ 			
				move_uploaded_file($bnrsource,$gbnr_fldnm.$bnrdest);					
			}
			$gmsg = "Record saved successfully";
		}
		else
		{
			$gmsg = "Record not saved";
		}
	}
	else
	{		
		$gmsg = "Duplicate name. Record not saved";
	}
}
?>