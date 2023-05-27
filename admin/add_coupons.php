<?php
include_once '../includes/inc_config.php'; //Making paging validation	
include_once $inc_nocache; //Clearing the cache information
include_once $adm_session; //checking for session
include_once $inc_cnctn; //Making database Connection
include_once $inc_usr_fnctn; //checking for session	
include_once $inc_pgng_fnctns; //Making paging validation
include_once $inc_fldr_pth; //Making paging validation
/***********************************************************
Programm : add_coupons.php	
Package : 
Purpose : For add Coupon details
Created By :Lokesh palagani
Created On :	22-02-2022
Modified By : 
Modified On : 
Purpose : 
Company : Adroit
************************************************************/
/*****header link********/
$pagemncat = "Setup";
$pagecat = "Coupons";
$pagenm = "Coupons";
/*****header link********/
global $gmsg;	
if(isset($_POST['btncpnsbmt']) && (trim($_POST['btncpnsbmt']) != "") && isset($_POST['txtcpncde']) && (trim($_POST['txtcpncde']) != "") && isset($_POST['txtname']) && (trim($_POST['txtname']) != "") && isset($_POST['txtprior']) && (trim($_POST['txtprior']) != ""))
{
	include_once "../database/iqry_cpn_mst.php";
}
$rd_crntpgnm = "view_all_coupons.php";
$clspn_val = "4";
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
		if(code != "")
		{
			var url = "chkduplicate.php?cpncode="+code;
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
  function get_cat()
  {
  	var prodmncatid = $("#lstprodmcat").val();
  	$.ajax({
  		type: "POST",
  		url: "../includes/inc_getStsk.php",
  		data:'prodmncatid='+prodmncatid,
  		success: function(data){
  			 //alert(data)
  			$("#hdncat").html(data);
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
  			//alert(data)
  			$("#hdnsubcat").html(data);
  		}
  	});
  }
  function get_net_amt_flds()
  {
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
	function dispdiv(){
		// debugger;
		val = document.getElementById("lstuse").value;
		if(val == 's' ){
			var url = "chkduplicate.php?value="+val;
			xmlHttp	= GetXmlHttpObject(mbmrdtlschanged);
			xmlHttp.open("GET", url , true);
			xmlHttp.send(null);
		}else{
			document.getElementById("mbmrdtls").style.display="none";
		}
	}
	function mbmrdtlschanged()
	{ 
		if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete")
		{ 	
			var temp=xmlHttp.responseText;
			//alert(temp);
			document.getElementById("usrdtl").innerHTML = temp;
			document.getElementById("mbmrdtls").style.display="block";
				
		}
	}
</script>
<?php include_once $inc_adm_hdr; ?>
<section class="content">
	<div class="content-header">
		<div class="container-fluid">
			<div class="row mb-2">
				<div class="col-sm-6">
					<h1 class="m-0 text-dark">Add Coupons</h1>
				</div><!-- /.col -->
				<div class="col-sm-6">
					<ol class="breadcrumb float-sm-right">
						<li class="breadcrumb-item"><a href="#">Home</a></li>
						<li class="breadcrumb-item active">Add Coupons</li>
					</ol>
				</div><!-- /.col -->
			</div><!-- /.row -->
		</div><!-- /.container-fluid -->
	</div>
	<!-- Default box -->
	<div class="card">
		<?php
		if($gmsg != "")
		{
			echo "<center><div class='col-12'>
			<font face='Arial' size='2' color = 'red'>$gmsg</font>
			</div></center>";
		}
		if(isset($_REQUEST['sts']) && (trim($_REQUEST['sts']) == "y"))
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
			<form name="frmaddcpns" id="frmaddcpns" method="post" action="<?php $_SERVER['PHP_SELF'];?>" enctype="multipart/form-data" onSubmit="return performCheck('frmaddcpns', rules, 'inline');">
				<div class="col-md-12">
					<div class="row justify-content-center align-items-center">
						<div class="col-md-12">
							<div class="row mb-2 mt-2">
								<div class="col-sm-3">
									<label>Coupon Code *</label>
								</div>
								<div class="col-sm-9">
									<input name="txtcpncde" type="text" id="txtcpncde" size="45" maxlength="40" onBlur="funcChkDupcde()" class="form-control">
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
									<input name="txtname" type="text" id="txtname" size="45" maxlength="40" class="form-control">
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
										<!-- <option value="1">Category</option> -->
										<option value="2">Tyre Brand</option>
										<!-- <option value="3">Shipping</option> -->
									</select>
									<span id="errorsDiv_lstcpnapp"></span>
								</div>
							</div>
						</div>
						<div class="col-md-12" id="hdnflds">
						</div>
						<!-- <div class="col-md-12">
							<div class="row mb-2 mt-2">
								<div class="col-sm-3">
									<label>Applicable Type *</label>
								</div>
								<div class="col-sm-9">
									<select name="lstcpnapptyp" id="lstcpnapptyp" class="form-control">
										<option value="">-- Select --</option>
										<option value="1">Product Price</option>
										<option value="2">Net Price</option>
										<option value="3">Shipping Price</option>
									</select>
									<span id="errorsDiv_lstcpnapptyp"></span>
								</div>
							</div>
						</div> -->
						<div class="col-md-12">
							<div class="row mb-2 mt-2">
								<div class="col-sm-3">
									<label>Net Amount Base</label>
								</div>
								<div class="col-sm-9">
									<select name="lstntamt" id="lstntamt" onchange="get_net_amt_flds()" class="form-control">
										<option value="n">No</option>
										<option value="y">Yes</option>
									</select>
								</div>
							</div>
						</div>
						<div class="col-md-12" id="hdnnetamt">
						</div>
						<!-- <div class="col-md-12">
							<div class="row mb-2 mt-2">
								<div class="col-sm-3">
									<label>User Type</label>
								</div>
								<div class="col-sm-9">
									<select name="lstusrtyp" id="lstusrtyp" onchange="get_usr_emails()" class="form-control">
										<option value="0">All</option>
										<option value="1">Retailer</option>
										<option value="2">Wholesaler</option>
									</select>
								</div>
							</div>
						</div> -->
						<div class="col-md-12" id="hdnusreml">
						</div>
						<div class="col-md-12">
							<div class="row mb-2 mt-2">
								<div class="col-sm-3">
									<label>Member</label>
								</div>
								<div class="col-sm-9">
									<select name="lstuse" id="lstuse" class="form-control" onChange="dispdiv()">
										<option value="">--Select--</option>
										<option value="s" >Single User</option>
										<option value="au" >All User</option>
                						<option value="nu" >New User</option>
									</select>
								</div>
							</div>
						</div>
						<div class="col-md-12" style="display:none" id="mbmrdtls" name="mbmrdtls">
							<div class="row mb-2 mt-2">
								<div class="col-sm-3">
									<label>user Id</label>
								</div>
								<div class="col-sm-9">
									<select name="usrdtl" id="usrdtl" class="form-control">
									
									</select>
								</div>
							</div>
						</div>
						<!-- <div class="col-md-12">
							<div class="row mb-2 mt-2">
								<div class="col-sm-3">
									<label>No.of times Usage Limit</label>
								</div>
								<div class="col-sm-9">
									<input name="txtusglmt" type="text" id="txtusglmt" class="form-control">
								</div>
							</div>
						</div> -->
						<div class="col-md-12">
							<div class="row mb-2 mt-2">
								<div class="col-sm-3">
									<label>Discount Type *</label>
								</div>
								<div class="col-sm-9">
									<select name="lstdisctyp" id="lstdisctyp" onchange="get_rltd_txtflds();" class="form-control">
										<option value="">--Select--</option>
										<option value="a">Amount</option>
										<option value="p">Percentage</option>
									</select>
									<span id="errorsDiv_lstdisctyp"></span>
								</div>
							</div>
						</div>
						<div class="col-md-12" id="hdndiscamt">
						</div>
						<div class="col-md-12">
							<div class="row mb-2 mt-2">
								<div class="col-sm-3">
									<label>Expiry Date</label>
								</div>
								<div class="col-sm-9">
									<input id="expdt" name="expdt" type="text" value="" placeholder="yyyy-mm-dd" class="element">
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
									<textarea name="txtdesc" cols="60" rows="3" id="txtdesc" class="form-control"></textarea>
								</div>
							</div>
						</div>
						
						<div class="col-md-12">
							<div class="row mb-2 mt-2">
								<div class="col-sm-3">
									<label>Rank *</label>
								</div>
								<div class="col-sm-9"> 
									<input type="text" name="txtprior" id="txtprior" class="form-control" size="4" maxlength="3">
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
										<option value="a" selected>Active</option>
										<option value="i">Inactive</option>
									</select>
								</div>
							</div>
						</div>
						<p class="text-center">
							<input type="Submit" class="btn btn-primary" name="btncpnsbmt" id="btncpnsbmt" value="Submit">
							&nbsp;&nbsp;&nbsp;
							<input type="reset" class="btn btn-primary" name="btnordstsreset" value="Clear" id="btnordstsreset">
							&nbsp;&nbsp;&nbsp;
							<input type="button" name="btnBack" value="Back" class="btn btn-primary" onClick="location.href='<?php echo $rd_crntpgnm ;?>'">
						</p>
					</div>
				</div>
			</form>
		</div>
		<!-- /.card-body -->
	</div>
	<!-- /.card -->
</section>
<?php include_once "../includes/inc_adm_footer.php";?>
<script language="javascript" type="text/javascript">
	CKEDITOR.replace('txtdesc');
</script>