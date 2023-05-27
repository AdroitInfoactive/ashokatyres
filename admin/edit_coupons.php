<?php
include_once '../includes/inc_config.php'; //Making paging validation	
include_once $inc_nocache; //Clearing the cache information
include_once $adm_session; //checking for session
include_once $inc_cnctn; //Making database Connection
include_once $inc_usr_fnctn; //checking for session	
include_once $inc_pgng_fnctns; //Making paging validation
include_once $inc_fldr_pth; //Making paging validation
/***********************************************************
Programm : edit_coupons.php	
Package : 
Purpose : For Edit coupon details
Created By : Bharath
Created On : 28-02-2022
Modified By : 
Modified On : 
Purpose : 
Company : Adroit
************************************************************/
global $id,$pg,$countstart;
$rd_vwpgnm = "view_detail_coupons.php";
$clspn_val = "4";
/*****header link********/
$pagemncat = "Setup";
$pagecat = "Coupons";
$pagenm = "Coupons";
/*****header link********/
if(isset($_POST['btnecpnsbmt']) && (trim($_POST['btnecpnsbmt']) != "") && isset($_POST['txtcpncde']) && (trim($_POST['txtcpncde']) != "") && isset($_POST['txtname']) && (trim($_POST['txtname']) != "") && isset($_POST['txtprior']) && (trim($_POST['txtprior']) != ""))
{
	include_once "../database/uqry_cpn_mst.php";
}
if(isset($_REQUEST['edit']) && (trim($_REQUEST['edit'])!="") && isset($_REQUEST['pg']) && (trim($_REQUEST['pg'])!="") && isset($_REQUEST['countstart']) && (trim($_REQUEST['countstart'])!=""))
{
	$id = glb_func_chkvl($_REQUEST['edit']);
	$pg = glb_func_chkvl($_REQUEST['pg']);
	$countstart = glb_func_chkvl($_REQUEST['countstart']);
	$srchval = glb_func_chkvl($_REQUEST['val']);
}
elseif(isset($_REQUEST['hdncpnid']) && (trim($_REQUEST['hdncpnid'])!="") && isset($_REQUEST['hdnpage']) && (trim($_REQUEST['hdnpage'])!="") && isset($_REQUEST['hdncnt']) && (trim($_REQUEST['hdncnt'])!=""))
{
	$id = glb_func_chkvl($_REQUEST['hdncpnid']);
	$pg = glb_func_chkvl($_REQUEST['hdnpage']);
	$countstart = glb_func_chkvl($_REQUEST['hdncnt']);
	$srchval = glb_func_chkvl($_REQUEST['val']);
	$chk = glb_func_chkvl($_REQUEST['chk']);
}
$sqrycpn_mst = "SELECT cpnm_id, cpnm_cde, cpnm_name, cpnm_applon, cpnm_cat, cpnm_scat, cpnm_brnd, cpnm_aptyp, cpnm_ntamttyp, cpnm_ntamt, cpnm_memtyp, cpnm_mbrm_id, cpnm_usetyp, cpnm_uselmt, cpnm_disctyp, cpnm_discamt, cpnm_discper, cpnm_exdt, cpnm_desc, cpnm_odr_cntaply, cpnm_odr_apltyp, cpnm_odr_discper, cpnm_prty, if(cpnm_sts = 'a', 'Active','Inactive') as cpnm_sts from cpn_mst where cpnm_id = $id";
$srscpn_mst = mysqli_query($conn,$sqrycpn_mst);
$rowscpn_mst = mysqli_fetch_assoc($srscpn_mst);
$loc= "&val=$srchval";
$pagetitle ="Edit Coupons";
?>
<script src="https://code.jquery.com/jquery-1.12.4.js" integrity="sha256-Qw82+bXyGq6MydymqBxNPYTaUXXq7c8v3CwiYwLLNXU="crossorigin="anonymous"></script>
<script language="javaScript" type="text/javascript" src="js/ckeditor.js"></script>
<script language="javascript" src="../includes/yav.js"></script>
<script language="javascript" src="../includes/yav-config.js"></script>
<link rel="stylesheet" type="text/css" href="../includes/yav-style1.css">
<link rel="stylesheet" href="../ui-lightness/jquery-ui-1.10.3.custom.css">
<script type="text/javascript" src="../js/jquery-ui-timepicker-addon.js"></script>
<script type="text/javascript" src="../js/jquery-ui-sliderAccess.js"></script>
<script language="javascript" type="text/javascript">
 	var rules=new Array();
 	rules[0]='txtcpncde:Code|required|Enter Code';
 	rules[1]='txtname:Name|required|Enter Name';
 	rules[2]='lstcpnapp:Applicale|required|Select Applicable on';
 	rules[3]='lstprodcat:Category|required|Select Category';
 	rules[4]='lstprodscat:Subcategory|required|Select Subcategory';
 	rules[5]='lstprodbrnd:Brand|required|Select Brand';
 	rules[6]='lstcpnapptyp:Applicable Type|required|Select Applicable Type';
 	rules[7]='txtnetamt:Net Amount|required|Enter Net Amount';
 	rules[8]='lstusr:User|required|Select User';
 	rules[9]='lstdisctyp:Discount Type|required|Select Discount Type';
 	rules[10]='txtdiscamt:Discount Amount|required|Enter Discount Amount';
 	rules[11]='txtdiscperc:Discount Percentage|required|Enter Discount Percentage';
 	rules[12]='txtprior:Priority|required|Enter Rank';
	rules[13]='txtprior:Priority|numeric|Enter Only Numbers';
	function setfocus()
	{
		document.getElementById('txtcpncde').focus();
	}
</script>
<?php 
include_once ('script.php');
include_once ('../includes/inc_fnct_ajax_validation.php');	
?>
<script language="javascript" type="text/javascript">
	$(function(){
		$('#expdt').datepicker({minDate: 0 ,changeMonth: true, changeYear: true, dateFormat: "yy-mm-dd",showOn: "button",buttonImage: "images/calendar.gif",buttonImageOnly: true, buttonText:""});
	});
	function funcChkDupcde()
	{
		var code;
		code = document.getElementById('txtcpncde').value;	
		id = <?php echo $id;?>;	
		if(code != "")
		{
			var url = "chkduplicate.php?cpncode="+code+"&cpnid="+id;
			xmlHttp	= GetXmlHttpObject(cdestateChanged);
			xmlHttp.open("GET", url , true);
			xmlHttp.send(null);
		}
		else
		{
			document.getElementById('errorsDiv_txtcpncde').innerHTML = "";
		}
	}
	function cdestateChanged()
	{ 
		if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete")
		{
			var temp=xmlHttp.responseText;
			document.getElementById("errorsDiv_txtcpncde").innerHTML = temp;
			if(temp!=0)
			{
				document.getElementById('txtcpncde').focus();
			}		
		}
	}
	function get_rltd_flds()
  {
  	$("#hidcatflds").html("");
  	$("#hidscatflds").html("");
  	$("#hidbrndflds").html("");
  	$("#hdnflds").html("");
  	var cpnapptyp = $("#lstcpnapp").val();
  	$.ajax({
  		type: "POST",
  		url: "../includes/inc_getStsk.php",
  		data:'cpnapp_typ='+cpnapptyp,
  		success: function(data){
  			// alert(data)
  			$("#hdnflds").html(data);
  		}
  	});
  }
  function get_sub_cat()
  {
  	var prodcatid = $("#lstprodcat").val();
  	$.ajax({
  		type: "POST",
  		url: "../includes/inc_getStsk.php",
  		data:'prodcatid='+prodcatid,
  		success: function(data){
  			// alert(data)
  			$("#hdnsubcat").html(data);
  		}
  	});
  }
  function get_sub_cat1()
  {
  	var prodcatid = $("#lstprodcat").val();
  	$.ajax({
  		type: "POST",
  		url: "../includes/inc_getStsk.php",
  		data:'prodcatid='+prodcatid,
  		success: function(data){
  			// alert(data)
  			$("#hidscatflds").html(data);
  		}
  	});
  }
  function get_net_amt_flds()
  {
  	$("#hidntamt").html("");
  	var ntamt = $("#lstntamt").val();
  	$.ajax({
  		type: "POST",
  		url: "../includes/inc_getStsk.php",
  		data:'ntamt='+ntamt,
  		success: function(data){
  			// alert(data)
  			$("#hdnnetamt").html(data);
  		}
  	});
  }
  function get_usr_emails()
  {
  	$("#hidusreml").html("");
  	var usrtyp = $("#lstusrtyp").val();
  	$.ajax({
  		type: "POST",
  		url: "../includes/inc_getStsk.php",
  		data:'usrtyp='+usrtyp,
  		success: function(data){
  			// alert(data)
  			$("#hdnusreml").html(data);
  		}
  	});
  }
  function get_rltd_txtflds()
  {
  	$("#hiddiscflds").html("");
  	var disctyp = $("#lstdisctyp").val();
  	$.ajax({
  		type: "POST",
  		url: "../includes/inc_getStsk.php",
  		data:'disctyp='+disctyp,
  		success: function(data){
  			// alert(data)
  			$("#hdndiscamt").html(data);
  		}
  	});
  }
</script>
<?php 
include_once $inc_adm_hdr;
include_once $inc_adm_lftlnk;
?>
<section class="content">
	<div class="content-header">
		<div class="container-fluid">
			<div class="row mb-2">
				<div class="col-sm-6">
					<h1 class="m-0 text-dark">Edit Coupons</h1>
				</div><!-- /.col -->
				<div class="col-sm-6">
					<ol class="breadcrumb float-sm-right">
						<li class="breadcrumb-item"><a href="#">Home</a></li>
						<li class="breadcrumb-item active">Edit Coupons</li>
					</ol>
				</div><!-- /.col -->
			</div><!-- /.row -->
		</div><!-- /.container-fluid -->
	</div>
	<form name="frmedtcpnid" id="frmedtcpnid" method="post" action="<?php $_SERVER['PHP_SELF'];?>" enctype="multipart/form-data" onSubmit="return performCheck('frmedtcpnid', rules, 'inline');">
		<input type="hidden" name="hdncpnid" value="<?php echo $id;?>">
		<input type="hidden" name="hdnpage" value="<?php echo $pg;?>">
		<input type="hidden" name="hdnval" value="<?php echo $srchval;?>">
		<input type="hidden" name="hdnchk" value="<?php echo $chk;?>">
		<input type="hidden" name="hdncnt" value="<?php echo $countstart?>">
		<div class="card">
			<div class="card-body">
				<div class="row justify-content-center">
					<div class="col-md-12">
						<div class="row mb-2 mt-2">
							<div class="col-sm-3">
								<label>Coupon Code*</label>
							</div>
							<div class="col-sm-9">
								<input name="txtcpncde" type="text" id="txtcpncde" size="45" maxlength="40" onBlur="funcChkDupcde()" class="form-control" value="<?php echo $rowscpn_mst['cpnm_cde'];?>">
								<span id="errorsDiv_txtcpncde"></span>
							</div>
						</div>
					</div>
					<div class="col-md-12">
						<div class="row mb-2 mt-2">
							<div class="col-sm-3">
								<label>Coupon Name *</label>
							</div>
							<div class="col-sm-9">
								<input name="txtname" type="text" id="txtname" size="45" maxlength="40" class="form-control" value="<?php echo $rowscpn_mst['cpnm_name'];?>">
								<span id="errorsDiv_txtname"></span>
							</div>
						</div>
					</div>
					<div class="col-md-12">
						<div class="row mb-2 mt-2">
							<div class="col-sm-3">
								<label>Applicable on *</label>
							</div>
							<div class="col-sm-9">
								<select name="lstcpnapp" id="lstcpnapp" onchange="get_rltd_flds();" class="form-control">
									<option value="">-- Select --</option>
									<option value="1" <?php if($rowscpn_mst['cpnm_applon'] == 1) echo 'selected'; ?>>Category</option>
									<option value="2" <?php if($rowscpn_mst['cpnm_applon'] == 2) echo 'selected'; ?>>Brand</option>
									<!-- <option value="3">Shipping</option> -->
								</select>
								<span id="errorsDiv_lstcpnapp"></span>
							</div>
						</div>
					</div>
					<?php
					if ($rowscpn_mst['cpnm_applon'] == 1)
					{ ?>
						<div class="col-md-12" id="hidcatflds">
							<div class="row mb-2 mt-2">
								<div class="col-sm-3">
									<label>Category *</label>
								</div>
								<div class="col-sm-9">
									<?php
									$sqryprodcat_mst = "SELECT prodcatm_id,prodcatm_name from prodcat_mst order by prodcatm_name";
									$rsprodcat_mst = mysqli_query($conn,$sqryprodcat_mst);
									$cnt_prodcat = mysqli_num_rows($rsprodcat_mst);	
									?>
									<select name="lstprodcat" id="lstprodcat" onchange="get_sub_cat1();" class="form-control">
										<option value="">--Select Category--</option>
										<option value="0" <?php if($rowscpn_mst['cpnm_cat'] == 0) echo 'selected'; ?>>All</option>
										<?php
										if( $cnt_prodcat > 0)
										{
											while($rowsprodcat_mst=mysqli_fetch_assoc($rsprodcat_mst))
											{
												$catid = $rowsprodcat_mst['prodcatm_id'];
												$catname = $rowsprodcat_mst['prodcatm_name'];
												?>
												<option value="<?php echo $catid;?>" <?php if($rowscpn_mst['cpnm_cat'] == $catid) echo 'selected'; ?>><?php echo $catname;?></option>
												<?php
											}
										}
										?>
									</select>
									<span id="errorsDiv_lstprodcat"></span>
								</div>
							</div>
						</div>
						<div class="col-md-12" id="hidscatflds">
							<div class="row mb-2 mt-2">
								<div class="col-sm-3">
									<label>Sub Category *</label>
								</div>
								<div class="col-sm-9">
									<?php
									$prodcatid = glb_func_chkvl($rowscpn_mst['cpnm_cat']);
									$sqryprodscat_mst = "SELECT prodscatm_id, prodscatm_name from prodscat_mst where prodscatm_sts = 'a' and prodscatm_prodcatm_id = $prodcatid group by prodscatm_id order by prodscatm_prty";
									// echo $sqryprodscat_mst; exit;
									$srsprodscat_mst = mysqli_query($conn,$sqryprodscat_mst) or die(mysqli_error());
									$cnt_prodscat = mysqli_num_rows($srsprodscat_mst);
									?>
									<select name="lstprodscat" id="lstprodscat" class="form-control">
										<option value="">--Select Sub Category--</option>
										<option value="0" <?php if($rowscpn_mst['cpnm_scat'] == 0) echo 'selected'; ?>>All</option>
										<?php
										if($cnt_prodscat > 0)
										{
											while($rowsprodscat_mst=mysqli_fetch_assoc($srsprodscat_mst))
											{
												$scatid = $rowsprodscat_mst['prodscatm_id'];
												$scatname = $rowsprodscat_mst['prodscatm_name'];
												?>
												<option value="<?php echo $scatid;?>" <?php if($rowscpn_mst['cpnm_scat'] == $scatid) echo 'selected'; ?>><?php echo $scatname;?></option>
												<?php
											}
										}
										?>
									</select>
									<span id="errorsDiv_lstprodcat"></span>
								</div>
							</div>
						</div>
						<?php
					}
					elseif ($rowscpn_mst['cpnm_applon'] == 2)
					{ ?>
						<div class="col-md-12" id="hidbrndflds">
							<div class="row mb-2 mt-2">
								<div class="col-sm-3">
									<label>Brand *</label>
								</div>
								<div class="col-sm-9">
									<?php
									$sqryprodbrnd_mst = "SELECT brndm_id, brndm_name from brnd_mst where brndm_sts = 'a' order by brndm_name";
									$rsprodbrnd_mst = mysqli_query($conn,$sqryprodbrnd_mst);
									$cnt_prodbrnd_mst = mysqli_num_rows($rsprodbrnd_mst);
									?>
									<select name="lstprodbrnd" id="lstprodbrnd" class="form-control">
										<option value="">--Select Brand--</option>
										<option value="0" <?php if($rowscpn_mst['cpnm_brnd'] == 0) echo 'selected'; ?>>All</option>
										<?php
										if($cnt_prodbrnd_mst > 0)
										{
											while($rowsprodbrnd_mst=mysqli_fetch_assoc($rsprodbrnd_mst))
											{
												$brndid = $rowsprodbrnd_mst['brndm_id'];
												$brndname = $rowsprodbrnd_mst['brndm_name'];
												?>
												<option value="<?php echo $brndid;?>" <?php if($rowscpn_mst['cpnm_brnd'] == $brndid) echo 'selected'; ?>><?php echo $brndname;?></option>
												<?php
											}
										}
										?>
									</select>
									<span id="errorsDiv_lstprodcat"></span>
								</div>
							</div>
						</div>
						<?php
					}
					?>
					<div class="col-md-12" id="hdnflds">
					</div>
					<div class="col-md-12">
						<div class="row mb-2 mt-2">
							<div class="col-sm-3">
								<label>Applicable Type *</label>
							</div>
							<div class="col-sm-9">
								<select name="lstcpnapptyp" id="lstcpnapptyp" class="form-control">
									<option value="">-- Select --</option>
									<option value="1" <?php if($rowscpn_mst['cpnm_aptyp'] == 1) echo 'selected'; ?>>Product Price</option>
									<option value="2" <?php if($rowscpn_mst['cpnm_aptyp'] == 2) echo 'selected'; ?>>Net Price</option>
									<option value="3" <?php if($rowscpn_mst['cpnm_aptyp'] == 3) echo 'selected'; ?>>Shipping Price</option>
								</select>
								<span id="errorsDiv_lstcpnapp"></span>
							</div>
						</div>
					</div>
					<div class="col-md-12">
						<div class="row mb-2 mt-2">
							<div class="col-sm-3">
								<label>Net Amount Base</label>
							</div>
							<div class="col-sm-9">
								<select name="lstntamt" id="lstntamt" onchange="get_net_amt_flds()" class="form-control">
									<option value="n" <?php if($rowscpn_mst['cpnm_ntamttyp'] == 'n') echo 'selected'; ?>>No</option>
									<option value="y" <?php if($rowscpn_mst['cpnm_ntamttyp'] == 'y') echo 'selected'; ?>>Yes</option>
								</select>
								<span id="errorsDiv_lstcpnapp"></span>
							</div>
						</div>
					</div>
					<?php
					if ($rowscpn_mst['cpnm_ntamttyp'] == 'y')
					{ ?>
						<div class="col-md-12" id="hidntamt">
							<div class="row mb-2 mt-2">
								<div class="col-sm-3">
									<label>Net Amount *</label>
								</div>
								<div class="col-sm-9">
									<input name="txtnetamt" type="text" id="txtnetamt" class="form-control" value="<?php echo $rowscpn_mst['cpnm_ntamt'];?>">
									<span id="errorsDiv_txtnetamt"></span>
								</div>
							</div>
						</div>
						<?php
					}
					?>
					<div class="col-md-12" id="hdnnetamt">
					</div>
					<div class="col-md-12">
						<div class="row mb-2 mt-2">
							<div class="col-sm-3">
								<label>User Type</label>
							</div>
							<div class="col-sm-9">
								<select name="lstusrtyp" id="lstusrtyp" onchange="get_usr_emails()" class="form-control">
									<option value="0" <?php if($rowscpn_mst['cpnm_memtyp'] == 0) echo 'selected'; ?>>All</option>
									<option value="1" <?php if($rowscpn_mst['cpnm_memtyp'] == 1) echo 'selected'; ?>>Retailer</option>
									<option value="2" <?php if($rowscpn_mst['cpnm_memtyp'] == 2) echo 'selected'; ?>>Wholesaler</option>
								</select>
							</div>
						</div>
					</div>
					<?php
					if ($rowscpn_mst['cpnm_memtyp'] != 0 && $rowscpn_mst['cpnm_memtyp'] != "")
					{ ?>
						<div class="col-md-12" id="hidusreml">
							<div class="row mb-2 mt-2">
								<div class="col-sm-3">
									<label>User Email *</label>
								</div>
								<div class="col-sm-9">
									<?php
									$sqryusr_mst = "SELECT mbrm_id, mbrm_emailid from mbr_mst  order by mbrm_emailid asc";
									// where mbrm_typ = $usrtyp
									// echo $sqryusr_mst;
									$srsusr_mst = mysqli_query($conn,$sqryusr_mst);
									$cnt_usr = mysqli_num_rows($srsusr_mst);
									?>
									<select name="lstusr" id="lstusr" class="form-control">
										<option value="">--Select User--</option>
										<option value="0" <?php if($rowscpn_mst['cpnm_mbrm_id'] == 0) echo 'selected'; ?>>All</option>
										<?php
										if( $cnt_usr > 0)
										{
											while($rowsusr_mst=mysqli_fetch_assoc($srsusr_mst))
											{
												$id = $rowsusr_mst['mbrm_id'];
												$email = $rowsusr_mst['mbrm_emailid'];
												?>
												<option value="<?php echo $id;?>" <?php if($rowscpn_mst['cpnm_mbrm_id'] == $id) echo 'selected'; ?>><?php echo $email;?></option>
												<?php
											}
										}
										?>
									</select>
									<span id="errorsDiv_lstusr"></span>
								</div>
							</div>
						</div>
						<?php
					}
					?>
					<div class="col-md-12" id="hdnusreml">
					</div>
					<div class="col-md-12">
						<div class="row mb-2 mt-2">
							<div class="col-sm-3">
								<label>Use</label>
							</div>
							<div class="col-sm-9">
								<select name="lstuse" id="lstuse" class="form-control">
									<option value="1" <?php if($rowscpn_mst['cpnm_usetyp'] == 1) echo 'selected'; ?>>Single time</option>
									<option value="2" <?php if($rowscpn_mst['cpnm_usetyp'] == 2) echo 'selected'; ?>>Every time</option>
								</select>
							</div>
						</div>
					</div>
					<div class="col-md-12">
						<div class="row mb-2 mt-2">
							<div class="col-sm-3">
								<label>No.of times Usage Limit</label>
							</div>
							<div class="col-sm-9">
								<input name="txtusglmt" type="text" id="txtusglmt" class="form-control" value="<?php echo $rowscpn_mst['cpnm_uselmt']?>">
							</div>
						</div>
					</div>
					<div class="col-md-12">
						<div class="row mb-2 mt-2">
							<div class="col-sm-3">
								<label>Discount Type *</label>
							</div>
							<div class="col-sm-9">
								<select name="lstdisctyp" id="lstdisctyp" onchange="get_rltd_txtflds();" class="form-control">
									<option value="">--Select--</option>
									<option value="a" <?php if($rowscpn_mst['cpnm_disctyp'] == 'a') echo 'selected'; ?>>Amount</option>
									<option value="p" <?php if($rowscpn_mst['cpnm_disctyp'] == 'p') echo 'selected'; ?>>Percentage</option>
								</select>
							</div>
						</div>
					</div>
					<?php
					if ($rowscpn_mst['cpnm_disctyp'] != "")
					{
						if ($rowscpn_mst['cpnm_disctyp'] == 'a')
						{ 
							$lbl = "Amount";
							$fldnm = "txtdiscamt";
							$err = "errorsDiv_txtdiscamt";
							$val = $rowscpn_mst['cpnm_discamt'];
						}
						else
						{
							$lbl = "Percentage";
							$fldnm = "txtdiscperc";
							$err = "errorsDiv_txtdiscperc";
							$val = $rowscpn_mst['cpnm_discper'];
						}
						?>
						<div class="col-md-12" id="hiddiscflds">
							<div class="row mb-2 mt-2" id=>
								<div class="col-sm-3">
									<label>Discount <?php echo $lbl; ?> *</label>
								</div>
								<div class="col-sm-9">
									<input name="<?php echo $fldnm; ?>" type="text" id="<?php echo $fldnm; ?>" class="form-control" value="<?php echo $val; ?>">
									<span id="<?php echo $err; ?>"></span>
								</div>
							</div>
						</div>
						<?php
					}
					?>
					<div class="col-md-12" id="hdndiscamt">
					</div>
					<div class="col-md-12">
						<div class="row mb-2 mt-2">
							<div class="col-sm-3">
								<label>Expiry Date</label>
							</div>
							<div class="col-sm-9">
								<input id="expdt" name="expdt" type="text" value="<?php echo $rowscpn_mst['cpnm_exdt']; ?>" placeholder="yyyy-mm-dd" class="element">
           			<span id="errorsDiv_expdt"></span>
							</div>
						</div>
					</div>
					<div class="col-md-12">
						<div class="row mb-2 mt-2">
							<div class="col-sm-3">
								<label>Description</label>
							</div>
							<div class="col-sm-9"> 
								<textarea name="txtdesc" cols="60" rows="3" id="txtdesc" class="form-control"><?php echo stripslashes($rowscpn_mst['cpnm_desc']);?></textarea>
							</div>
						</div>
					</div>
					<div class="col-md-12">
						<div class="row mb-2 mt-2">
							<div class="col-sm-3">
								<label>Rank *</label>
							</div>
							<div class="col-sm-9"> 
								<input type="text" name="txtprior" id="txtprior" class="form-control" size="4" maxlength="3" value="<?php echo $rowscpn_mst['cpnm_prty'];?>">
								<span id="errorsDiv_txtprior"></span>
							</div>
						</div>
					</div>
					<div class="col-md-12">
						<div class="row mb-2 mt-2">
							<div class="col-sm-3">
								<label>Status</label>
							</div>
							<div class="col-sm-9">
								<select name="lststs" id="lststs" class="form-control">
									<option value="a"<?php if($rowscpn_mst['cpnm_sts']=='a') echo 'selected';?>>Active</option>
									<option value="i"<?php if($rowscpn_mst['cpnm_sts']=='i') echo 'selected';?>>Inactive</option>
								</select>
							</div>
						</div>
					</div>
					<p class="text-center">
						<input type="Submit" class="btn btn-primary btn-cst" name="btnecpnsbmt" id="btnecpnsbmt" value="Submit">
						&nbsp;&nbsp;&nbsp;
						<input type="reset" class="btn btn-primary btn-cst" name="btnordstsreset" value="Clear" id="btnordstsreset">
						&nbsp;&nbsp;&nbsp;
						<input type="button" name="btnBack" value="Back" class="btn btn-primary btn-cst" onclick="location.href='<?php echo $rd_vwpgnm;?>?vw=<?php echo $id;?>&pg=<?php echo $pg;?>&countstart=<?php echo $countstart.$loc;?>'">
					</p>
				</div>
			</div>
		</div>
	</form>
</section>
<?php include_once "../includes/inc_adm_footer.php";?>
<script language="javascript" type="text/javascript">
	CKEDITOR.replace('txtdesc');
</script>