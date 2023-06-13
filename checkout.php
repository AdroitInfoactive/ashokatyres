<?php
error_reporting(0);
include_once "includes/inc_membr_session.php";//checking for session	
			include_once 'includes/inc_nocache.php'; // Clearing the cache information
            include_once 'includes/inc_connection.php';//Make connection with the database  	
            include_once "includes/inc_config.php";	//path config file
		    include_once "includes/inc_usr_functions.php";//Including user session value

include_once 'includes/inc_nocache.php'; // Clearing the cache information
//include_once "includes/inc_membr_session.php";//checking for session
include_once "includes/inc_config.php"; // site and  files confige	

include_once 'includes/inc_folder_path.php'; //Including Image resize function		

include_once "includes/inc_usr_functions.php";
/**********************Checking And Assigning Request Values *************************/
if (isset($_REQUEST['action']) && (trim($_REQUEST['action']) != "")) {
  $action   = glb_func_chkvl($_REQUEST['action']);   // Stores the action to be taken (add,update,delete)
}
/**********************Checking And Assigning *************************/
$ses_cart     = "";
$ses_cartcode = "";     // Stores the cartcode
$ses_prodqty  = "";    // Stores the session quantities
$ses_prodid   = "";   //store the product session
$pgrval     =  $_SESSION['sesloc'];
$sts = $_REQUEST['addr_sts'];
// unset($_SESSION['coupen']);
/**********************Assigning Values to Sessions *************************/
if (isset($_SESSION['cart']) && (trim($_SESSION['cart'] != ""))) {
  $ses_cart = $_SESSION['cart']; // Stores the cart detail
}
if (isset($_SESSION['cartcode']) && (trim($_SESSION['cartcode'] != ""))) {
  $ses_cartcode = $_SESSION['cartcode']; // Stores the cartcode
}
if (isset($_SESSION['prodqty']) && (trim($_SESSION['prodqty'] != ""))) {
  $ses_prodqty  = $_SESSION['prodqty'];    // Stores the session quantities
}
if (isset($_SESSION['prodid']) && (trim($_SESSION['prodid'] != ""))) {
  $ses_prodid   = $_SESSION['prodid']; // Stores the session productid
}
if (isset($_SESSION['seschkcart']) && (trim($_SESSION['seschkcart'] != ""))) {
  $ses_cartchk = $_SESSION['seschkcart']; // Stores the cartcode
}
if (isset($_SESSION['prodprc']) && (trim($_SESSION['prodprc']) != "")) {
  $ses_prodprc = $_SESSION['prodprc'];
}
$regid    = $_SESSION['sesmbrid'];
$coupen = $_SESSION['coupen'];
/*		if(!isset($_SESSION['cartcode']) || (trim($_SESSION['cartcode']) == ""))
{
header("Location:".$rtpth."index.php");
exit();	
}*/
if (isset($_POST['btnSbmt']) && (trim($_POST['btnSbmt']) != "")) {
  //var_dump($_POST);exit;
  include_once "database/iqry_cart_dtl.php";
}
if ($sts == "u")
{
 $msid = $_POST['hdnmsid'];
 $uqrymbr_dtl = "UPDATE mbr_dtl set mbrd_dfltshp='y' where mbrd_mbrm_id=$regid and mbrd_id=$msid";
  //mbrd_mbrm_id=$msid and
  $ursmbr_dtl = mysqli_query($conn, $uqrymbr_dtl) or die(mysqli_error($conn));
  $uqrymbr_dtl1 = "UPDATE mbr_dtl set mbrd_dfltshp='n' where mbrd_mbrm_id=$regid and mbrd_id!=$msid";
  //mbrd_mbrm_id=$msid and
  $ursmbr_dtl1 = mysqli_query($conn, $uqrymbr_dtl1) or die(mysqli_error($conn));
  ?>
      <script language="javascript" type="text/javascript">
        location.href = "<?php echo $rtpth.'checkout.php'?>";
      </script>
      <?php
}
if (isset($_POST['btnnewadrsadd']) && (trim($_POST['btnnewadrsadd']) != "") && isset($_POST['hnsname1']) && (trim($_POST['hnsname1']) != "") && isset($_POST['hnsemail']) && (trim($_POST['hnsemail']) != "") && isset($_POST['txtaddr']) && (trim($_POST['txtaddr']) != "") && isset($_POST['txtpin']) && (trim($_POST['txtpin']) != "") && isset($_POST['txtphno']) && (trim($_POST['txtphno']) != "") && isset($_POST['lststate']) && (trim($_POST['lststate']) != "") && isset($_POST['txtcty']) && (trim($_POST['txtcty']) != ""))
{
  include_once "database/iqry_mbr_dtl.php";
}
$page_title = "Checkout";
$page_seo_title = "Checkout";
$db_seokywrd = "";
$db_seodesc = "";
$current_page = "about-us";
$body_class = "about-us-page";
include('header.php');
?>
<div class="page-content bg-white">
  <!-- Banner  -->
  <div class="dlab-bnr-inr short-banner style-1 overlay-black-middle" style="background-image: url(images/banner/bnr1.jpg);">
    <div class="container">
      <div class="dlab-bnr-inr-entry">
        <h1 class="text-white">Checkout</h1>
        <div class="d-flex justify-content-center align-items-center">
          <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active" aria-current="page">Checkout</li>
            </ol>
          </nav>
        </div>
      </div>
    </div>
  </div>

  <!-- Banner End -->
  <div class="row" id="carjax1">
    <form name="frmadrs" id="frmadrs" method="post" action="<?php $_SERVER['SCRIPT_NAME']; ?>">
      <input type="hidden" value="<?php echo $regid; ?>" id="mbrid">

      <!-- coupons start -->

    <?php 
    /************************COUPON USED BY USER***********************/
if (isset($coupen) && (trim($coupen) != ""))
{

  //------------------------------- Coupn Order Base ----------------------------------------//
  $cpnflg = 0;
  $cpncnd = $_SESSION['cartcode'];
  $catprd = explode('-', $cpncnd);
  $mnctgtprodid = $catprd[0]; // Stores the product id 
  $mnctgid = $catprd[1]; // 
  //-------------------------------------5-7-2019------------------------------------------//

 $curdt = date('Y-m-d');
 $sqrycpn_mst = "SELECT cpnm_id,cpnm_cde,cpnm_name,cpnm_mncat, cpnm_cat,cpnm_scat,cpnm_aptyp,cpnm_memtyp,cpnm_disctyp,cpnm_discamt,cpnm_exdt,cpnm_discper, cpnm_sts,cpnm_prty,cpnm_usetyp,cpnm_mbrm_id,cpnm_ntamt, cpnm_ntamttyp,cpnm_applon,cpnm_brnd from cpn_mst where cpnm_cde = '$coupen' and cpnm_exdt >= '$curdt' and cpnm_sts = 'a'";
  $srscpn_mst = mysqli_query($conn, $sqrycpn_mst);
  $cntrec_cpn = mysqli_num_rows($srscpn_mst);
  if ($cntrec_cpn > 0)
  {
    $srowcpn_mst = mysqli_fetch_assoc($srscpn_mst);
    $cpnm_id = $srowcpn_mst['cpnm_id']; // Expiry type of the campaign 
    $cpnm_cde = $srowcpn_mst['cpnm_cde']; // Expiry type of the campaign 
    $cpnm_mncat = $srowcpn_mst['cpnm_mncat']; // Expiry type of the campaign 
    $cpnm_cat = $srowcpn_mst['cpnm_cat']; // Expiry type of the campaign 
    $cpnm_scat = $srowcpn_mst['cpnm_scat']; // Expiry type of the campaign 
    $cpnm_disctyp = $srowcpn_mst['cpnm_disctyp']; // Expiry type of the campaign 
    $cpnm_amt = $srowcpn_mst['cpnm_discamt']; // Expiry type of the campaign 
    $cpnm_per = $srowcpn_mst['cpnm_discper']; // Member for whom the voucher is available
    $cpnm_exdt = $srowcpn_mst['cpnm_exdt']; // Member for whom the voucher is available
    $cpnm_sts = $srowcpn_mst['cpnm_sts']; // Member for whom the voucher is available
    $cpnm_prty = $srowcpn_mst['cpnm_prty']; // Member for whom the voucher is available
    $cpnm_memtyp = $srowcpn_mst['cpnm_usetyp'];
    $cpnm_usr_id = $srowcpn_mst['cpnm_mbrm_id'];
 $cpnm_apply_on = $srowcpn_mst['cpnm_applon'];
    $cpnm_brnd = $srowcpn_mst['cpnm_brnd'];
    $cpnm_apply_type = $srowcpn_mst['cpnm_aptyp'];
    $cupnm = $cpnm_cde;
    $curdt = date('Y-m-d');
    $cur_strtime = strtotime($cpnm_exdt);
    $cpnm_ntamt = $srowcpn_mst['cpnm_ntamt']; // Expiry type of the campaign  	
    $cpnm_ntamttyp = $srowcpn_mst['cpnm_ntamttyp']; // Expiry type of the campaign 
  }
  else
  {
    $cpnmsg = "CUPON NOT VALID";
  }
 $sqrymbr_mst = "SELECT crtordm_mbrm_id,crtordm_id,crtordm_cpnm_id from crtord_mst where crtordm_mbrm_id = '$regid' and crtordm_cpnm_id = '$cpnm_id'";
  $srsmbr_mst = mysqli_query($conn, $sqrymbr_mst);
  $cntmbr_mst = mysqli_num_rows($srsmbr_mst);
 // echo $cntmbr_mst;
}
if ($cpnmsg != '')
{
  $cupnm = "";
  $cpnm_scat = 0;
  unset($_SESSION['coupen']);
}?>
      <section class="my-cart-values">
        <div class="container">
          <!--Section: Block Content-->
          <section>
            <!--Grid row-->
            <div class="row">
              <!--Grid column-->
              <div class="col-lg-8">
                <?php if (isset($_SESSION['cartcode']) &&  (trim($_SESSION['cartcode']) != "")) { ?>
                  <!-- Card -->
                  <div class="mb-3">
                    <?php
                    $cartval      = $_SESSION['cartcode'];
                    $prodidval    = $_SESSION['prodid'];
                    $prodqtyval   = $_SESSION['prodqty'];
                    if (($cartval != "") && ($prodidval != "") && ($prodqtyval != "")) {
                      $codearr  =  explode(",", $prodidval);
                      $qtyarr    =  explode(",", $prodqtyval);
                      $newArray  =  $codearr;
                    ?>
                      <div class="pt-4 wish-list">
                        <div class="ps-shopping__table">
                          <table class="table ps-table ps-table--product">
                            <thead>
                              <tr>
                                <!-- <th class="ps-product__remove">S.No</th> -->
                                <th class="ps-product__thumbnail">Product</th>
                                <th class="ps-product__name">Product name</th>
                                <!--  <th class="ps-product__meta">price</th>
		<th class="ps-product__meta">Tax</th> -->
                                <th class="ps-product__meta">Unit Price</th>
                                <th class="ps-product__quantity">Quantity</th>
                                <th class="ps-product__subtotal">Subtotal</th>
                              </tr>
                            </thead>
                            <!-- <table> -->
                            <tbody>
                              <?php
                              $items       = explode(',', $cartval);
                              $totqty        = 0;
                              $totxlcredits   = 0;
                              $totcartprc   = 0;
                              $totgrpprc    = 0;
                              $totdiscount   = 0;
                              $itmcnt = 0;
                              $cntinc = 1;
                              $totWt     = 0;
                              $cnt = 0;
                              foreach ($items as $items_id => $items_val) {
                                $totuntprc = 0;
                                $totbilprc = 0;
                                $cartcodeid  = ""; //For Storing the cart value id
                                $cartcodeval = ""; //For Storing the cart code value
                                $cartcodeid  = $items_id;
                                $cartcodeval = $items_val; //  Stores the cart detail value
                                $arr_cartcodeval  = explode("-", $cartcodeval);
                                $cart_prodid    = $arr_cartcodeval[0]; // Stores the product id 
                                $cart_prcid    = $arr_cartcodeval[1]; // Stores the product id 
                                $cart_szid    = $arr_cartcodeval[3];
                                $untqty       = $qtyarr[$cartcodeid]; // Stores the unit quantities					
                                if ($cart_prodid != "") {
                                  $sqryprod_dtl =    "SELECT  prodm_id, prodm_sku, prodm_code, prodm_name, prodm_size, prodm_ptrn, prodm_cstprc,prodm_sleprc,  prodm_ofrprc, prodm_dsc, prodm_sdsc, prodm_st, prodm_sky, prodm_sotl,  prodm_sodsc, prodm_sttle, prodm_stdsc, prodm_sts, prodm_rnk,vehtypm_id, vehtypm_name,prodd_id,vehtypm_desc, vehtypm_seotitle, vehtypm_seodesc, vehtypm_seokywrd, vehtypm_seohonetitle,
vehtypm_seohonedesc, vehtypm_seohtwotitle, vehtypm_seohtwodesc, vehtypm_sts,vehtypm_prty,vehbrndm_id, vehbrndm_name, vehbrndm_desc, vehbrndm_vehtypm_id, vehbrndm_brndimg,vehbrndm_sts, vehbrndm_prty, vehbrndm_seotitle, vehbrndm_seodesc, vehbrndm_seokywrd,  vehbrndm_seohonetitle, vehbrndm_seohonedesc, vehbrndm_seohtwotitle, vehbrndm_seohtwodesc,vehmodlm_id, vehmodlm_name,vehvrntm_id, vehvrntm_name,tyrprflm_id,tyrprflm_name,tyrrmszm_id,tyrrmszm_name,tyrwdthm_id,tyrwdthm_name,tyrbrndm_id,tyrbrndm_name,prodm_cstprc,prodimgd_simg from prod_mst
inner join prod_veh_dtl on prod_veh_dtl.prodd_prodm_id	= prod_mst.prodm_id
LEFT join veh_type_mst on veh_type_mst.vehtypm_id=	prod_veh_dtl.prodd_veh_typ
LEFT join veh_brnd_mst on veh_brnd_mst.vehbrndm_id=prod_veh_dtl.prodd_veh_brnd
LEFT join veh_vrnt_mst on  veh_vrnt_mst.vehvrntm_id=prod_veh_dtl.prodd_veh_vrnt
LEFT join veh_model_mst on veh_model_mst.vehmodlm_id=prod_veh_dtl.prodd_veh_mdl	
inner join tyr_brnd_mst on tyr_brnd_mst.tyrbrndm_id = prod_mst.prodm_tyr_brnd
inner join tyr_wdth_mst on tyr_wdth_mst.tyrwdthm_id = prod_mst.prodm_tyrwdth		
inner join tyr_rimsize_mst on tyr_rimsize_mst.tyrrmszm_id = prod_mst.prodm_tyrrmsz
inner join tyr_prfl_mst on tyr_prfl_mst.tyrprflm_id = prod_mst.prodm_tyrprfl
left join 	   prodimg_dtl on  prodimg_dtl.prodimgd_prodm_id= prod_mst.prodm_id
where 
prodm_id !='' and prodm_sts ='a' and vehtypm_sts='a' and vehbrndm_sts='a' and vehmodlm_sts='a' and vehvrntm_sts='a' and tyrprflm_sts='a' and tyrrmszm_sts='a' and tyrwdthm_sts='a' and tyrbrndm_sts='a'and prodm_id=' $cart_prodid' ";
                                  $srsprod_dtl  = mysqli_query($conn, $sqryprod_dtl);
                                  $srowprod_dtl = mysqli_fetch_assoc($srsprod_dtl);
                                  $cnt += 1;
                                  $crtprodid       = $srowprod_dtl['prodm_id'];
                                  $prodbrnd       = $srowprod_dtl['tyrbrndm_id'];
                                  $crtprodcode   = $srowprod_dtl['prodm_code'];
                                  $crtprodname   = $srowprod_dtl['prodm_name'];
                                  $crtprodtyrbrndnm   = $srowprod_dtl['tyrbrndm_name'];
                                  $crtvechbrndid      = $srowprod_dtl['vehbrndm_id'];
                                  $smlImgNm   = $srowprod_dtl['prodimgd_simg'];
                                  // $smlImgPth 	= $rtpth.$gprodsimg_usrpth.$smlImgNm.'.jpg'; 
                                  $smlImgPth = $gprodsimg_usrpth . $smlImgNm . '.jpg';
                                  if (file_exists($smlImgPth)) {
                                    $smlImgPth = $rtpth . $gprodsimg_usrpth . $smlImgNm . '.jpg';
                                  } else {
                                    $smlImgPth = $rtpth . 'images/ashoka-no-image.jpg';
                                  }
                                  //	$hsncode	 = $srowprod_dtl['prodm_hsn'];													
                                  // new code cart calculation start
                                  $prc   = $srowprod_dtl['prodm_cstprc'];  //cost price
                                  $sl_prc   = $srowprod_dtl['prodm_sleprc']; //sale price
                                  $ofr_prc   = $srowprod_dtl['prodm_ofrprc']; //offer price
                                  if ($prc == '') {
                                    $prc = $sl_prc;
                                    $crt_tot_prc = $untqty * $prc;
                                  }
                                  if ($sl_prc != '' && $prc < $sl_prc) {
                                    $prc = $sl_prc;
                                    $crt_tot_prc = $untqty * $prc;
                                  }
                                  if ($ofr_prc != '' && $ofr_prc < $sl_prc) {
                                    $prc = $ofr_prc;
                                    $crt_tot_prc = $untqty * $prc;
                                  }
                                  // new code cart calculation ends
                                  // coupons start
                                  if($cpnm_id!= '')
                                  {
                                    if($cpnm_apply_on == 1)
                                    {
                                      if(($cpnm_mncat == $mnctid)&&($cpnm_cat == $ctid)&&($cpnm_scat == $sctid ))
                                      {
                                        $cpnprdprc = $prc * $cart_qty;
                                        $totalcpnprdprc += $cpnprdprc;
                                        $cpndis = 'y';
                                      }
                                      else if(($cpnm_mncat == $mnctid)&&($cpnm_cat == $ctid)&&($cpnm_scat == '0'))
                                      {
                                        $cpnprdprc = $prc * $cart_qty;
                                        $totalcpnprdprc += $cpnprdprc;
                                        $cpndis = 'y';
                                      }		 
                                      else if(($cpnm_mncat == $mnctid)&&($cpnm_cat == '0')&&($cpnm_scat == '0'))
                                      {
                                        $cpnprdprc = $prc * $cart_qty;
                                        $totalcpnprdprc += $cpnprdprc;
                                        $cpndis = 'y';
                                      }
                                      else if(($cpnm_mncat == '0')&&($cpnm_cat == '0')&&($cpnm_scat == '0'))
                                      {
                                        $cpnprdprc = $prc * $cart_qty;
                                        $totalcpnprdprc += $cpnprdprc;
                                        $cpndis = 'y';
                                      }
                                      else
                                      {
                                        $cpndis = 'n';
                                      }
                                    }
                                    else if($cpnm_apply_on == 2)
                                    {
                                     $prodbrnd;
                                      if(($cpnm_brnd == $prodbrnd) || ($cpnm_brnd == 0))
                                      {
                                        $cpndis = 'y';
                                  //  $cpnprdprc = $prc * $cart_qty;
                                  //  $totalcpnprdprc +=$cpnprdprc;
                                    $totalcpnprdprc +=$crt_tot_prc;
                                      }
                                      else
                                      {
                                        $cpndis = 'n';
                                      }
                                    }
                                  }
                                  // coupons ends

                                  $od = 150;
                                  $df = 250;
                                  $fs = '';
                                  $totuntprc    = ($untqty * $prc);
                                  $totcartprc   +=  $totuntprc; // Stores total cart price
                                  $totqty += $untqty; // Stores total quantity
                                  $imgnm  =   $srowprod_dtl['prodimgd_simg'];
                                  $imgpth =   $u_gsml_fldnm . $imgnm . '.jpg';
                              ?>
                                  <tr class="mb-2">
                                    <div class="row mb-4">
                                      <td class="ps-product__thumbnail">
                                        <figure><img src="<?php echo  $smlImgPth; ?>" width="100px" height="100px"></figure>
                                      </td>
                                      <td class="ps-product__name"><strong><?php echo $crtprodname; ?></strong></td>
                                      <td class="ps-product__meta">
                                        <span class="ps-product__price sale"> &#8377;<?php echo $prc; ?></span>
                                        <?php if ($strk_prc != "") { ?>
                                          <span class="ps-product__del">&#8377;<?php echo $strk_prc; ?></span>
                                        <?php
                                        } ?>
                                      </td>
                                      <td class="ps-product__quantity"> <?php echo $untqty; ?></td>
                                      <td class="ps-product__subtotal">&#8377;<?php echo $crt_tot_prc; ?></td>
                                     
                                    
                                      <?php
                                      $sqry_loc = "SELECT strlocm_id, strlocm_name from store_loc_mst where strlocm_sts = 'a' order by strlocm_id ASC";
                                      $srslocdtls = mysqli_query($conn, $sqry_loc);
                                      $loc_cnt = mysqli_num_rows($srslocdtls);
                                      $loc_id = array();
                                      $loc_nm = array();
                                      while ($rwslocdtls = mysqli_fetch_assoc($srslocdtls)) {
                                        $loc = $rwslocdtls['strlocm_id'];
                                        $loc_name = $rwslocdtls['strlocm_name'];
                                        $loc_id[] = $loc;
                                        $loc_nm[] = $loc_name;
                                        $sqryclsbls = "SELECT prdinvt_clsbls from product_inventory where prdinvt_prdid = $crtprodid  and prdinvt_lcn = '$loc' order by prdinvt_id DESC limit 1";
                                        $srsclsbls = mysqli_query($conn, $sqryclsbls);
                                        $prod_clscnt = mysqli_num_rows($srsclsbls);
                                        $rwsclsbls = mysqli_fetch_assoc($srsclsbls);
                                        @$prdinvt += $rwsclsbls['prdinvt_clsbls'];
                                        $moq = 1;
                                      }
                                      $clsbls = $prdinvt; ?>

                                    </div>
                                  </tr>
                              <?php  }
                              }  ?>
                            </tbody>
                          </table>
                          <div class="ps-shopping__button mb-4">
                            <a href="<?php echo $rtpth; ?>cart"><button class="ps-btn ps-btn--primary" type="button">Edit / Remove</button></a>
                          </div>
                        </div>
                        <input type="hidden" id="totlprodcnt" value="<?php echo  $cnt; ?>" />
                        <hr class="mb-4">
                      </div>
                    <?php } ?>
                  </div>
                  <?php
                                      // coupons start
                $crttotamt = $totuntprc;
                if ($cpnm_id != '')
                {
                  if ($cpnm_ntamttyp == 'y')
                  {
                    if ($cpnm_ntamt < $totalcpnprdprc)
                    {
                      $ntamttyp = 'y';
                    }
                    else
                    {
                      $ntamttyp = 'n';
                    }
                  }
                  else if ($cpnm_ntamttyp == 'n')
                  {
                    $ntamttyp = 'y';
                  }
                  if ($cpnm_memtyp == 's')
                  {
                    if ($regid == $cpnm_usr_id)
                    {
                      $snglcpn = "y";
                    }
                    else
                    {
                      $snglcpn = "n";
                    }
                  }
                  else if ($cpnm_memtyp == 'nu')
                  {
                    $sqlcrtord_mst = "SELECT crtordm_mbrm_id from crtord_mst where crtordm_mbrm_id = $regid";
                    $rescrtord_mst = mysqli_query($conn, $sqlcrtord_mst);
                    $numorws = mysqli_num_rows($rescrtord_mst);
                    if ($numorws == 0)
                    {
                      $snglcpn = "y";
                    }
                    else
                    {
                      $snglcpn = "n";
                    }
                  }
                  else if ($cpnm_memtyp == 'au')
                  {
                    $snglcpn = "y";
                    
                  }
                  else
                  {
                    $snglcpn = "na";
                  }
                }
                if ($cpndis == 'y' && $ntamttyp == 'y' && $snglcpn == 'y')
                {
                  if ($cpnm_disctyp == 'p')
                  {
                   
                     $disper = $cpnm_per / 100;
                     $per_amt = $totalcpnprdprc * $disper;
                    $cpnm_discamt = $per_amt;
                    $totcpndiscamt += $cpnm_discamt;
                    $cpncunt++;
                  }
                  else
                  {
                    $cpnm_discamt = $cpnm_amt;
                    $totcpndiscamt += $cpnm_discamt;
                    $cpncunt++;
                  }
                }
                else
                {
                  
                }
                if ($cpncunt > 0)
                { ?>
                  <!-- <div class="row">
                    <div class="col-lg-6 col-md-6">
                      <p>Coupon applied: (<b><?php echo $cpnm_cde; ?></b>)</p> -->
                    
                      <input type="hidden" id="cpnid" value="<?php echo  $cpnm_cde; ?>" />
                    <!-- </div>
                    <div class="col-lg-6 col-md-6"> -->
                 <!-- <p class="text-right"><i class="fa fa-rupee"></i>&nbsp;-<?php echo number_format($totcpndiscamt, 2, ".", ","); 
                      ?> -->
                      <input type="hidden" id="cpndisamt" value="<?php echo  $totcpndiscamt; ?>" />
                    </p>
                    <!-- </div>
                  </div> -->
                  <?php
                  $crttotamt = $totuntprc - $totcpndiscamt;
                }?>
                  <!-- ************** coupons ends -->
                  <!-- Card -->
                  <?php if ($regid != '' && isset($regid)) { ?>
                    <!-- Card -->
                    <div class="mb-3">
                      <h5>Choose Delivery Type</h5>
                      <div class="dl-option d-flex mt-4">
                        <div class=" mb-2 mr-2">
                          <input type="radio" name="crtaddrsts" id="crtaddrsts1" value="d" onclick="funChsdeltyp('d')" checked /><label for="addrd"><strong> Online
                              Delivery</strong></label>
                        </div>
                        <div class=" mb-2 mr-2">
                          <input type="radio" name="crtaddrsts" id="crtaddrsts2" value="df" onclick="funChsdeltyp('df')" />
                          <label for="addrdf"><strong>Doorstep Fitting</strong></label>
                        </div>
                        <div class=" mb-2 mr-2 dropdown">
                          <input type="radio" name="crtaddrsts" id="crtaddrsts3" value="fs" onclick="funChsdeltyp('fs')" /> <label for="addrfs"><strong>Fitting At
                              Store</strong></label>
                        </div>
                      </div>
                    </div>
                    <div class="row mult-addr" id="chkdeladd">
                      <div class="pt-4">
                        <h6 id="dchrg1">Devilery Charges :<?php echo $od; ?> /- rs
                          <input type="hidden" name="txtdevlrychrg" id="txtdevlrychrg" value="<?php echo $od; ?>" />

                        </h6>
                        <h6 id="fchrgs1" style="display:none">Fitting Charges :<?php echo $df; ?> /- rs
                          <input type="hidden" name="txtftngchrg" id="txtftngchrg" value="<?php echo $df; ?>" />
                        </h6>

                        <div id="lstvehbrnd"></div>

                        <h5 class="">Expected shipping delivery</h5>
                        <input type="hidden" name="txtftstchrg" id="txtftstchrg" value="0" />
                        <p class="mb-0"> Thu 12.03. -- Mon 16.03.</p>
                      </div>
                      <a class="text-primary" href="#" data-toggle="modal" data-target="#changAddress">Change / Add Address</a>
                    
                    <?php $sqrymbr_dtl =   "SELECT mbrd_id,mbrd_fstname,mbrd_lstname, mbrd_badrs,mbrd_badrs2,mbrd_cmpny,ctym_name, mbrd_bzip,mbrd_bdayphone,cntrym_name, mbrd_ctynm,mbrd_bdayphone,mbrd_dfltbil,mbrd_dfltshp,mbrd_mbrm_id,mbrm_phno,mbrd_emailid,cntrym_name,cntym_name,cntntm_name,ctym_sts, cntym_sts,mbrm_emailid,mbrd_bmbrcntrym_id,mbrd_bmbrcntym_id,cntym_name,cntrym_name from vw_mbr_mst_dtl_bil 
                  where mbrd_mbrm_id=$regid and mbrm_id = $regid  and mbrd_dfltshp = 'y' order by mbrd_id  desc";
                      $srsmbr_mst   =  mysqli_query($conn, $sqrymbr_dtl);
                      $cntrec    = @mysqli_num_rows($srsmbr_mst);
                      if ($cntrec > 0) { ?>
                        <h6>Select Delivery Address</h6>
                      <?php
                      }
                      $cnt = 0;
                      while ($rowsmbr_dtl = mysqli_fetch_assoc($srsmbr_mst)) {
                        $bilsts      = $rowsmbr_dtl['mbrd_dfltbil'];
                        $shpsts      = $rowsmbr_dtl['mbrd_dfltshp'];
                        $mbrmid       = $rowsmbr_dtl['mbrd_mbrm_id'];
                        $mbrid       = $rowsmbr_dtl['mbrd_id'];
                        $mbremail    = $rowsmbr_dtl['mbrd_emailid'];
                        $mbrusername = $rowsmbr_dtl['mbrd_nckname'];
                        $mbrname     = $rowsmbr_dtl['mbrd_fstname'];
                        $mbraddr     = $rowsmbr_dtl['mbrd_badrs'];
                        $mbrphno     = $rowsmbr_dtl['mbrd_bdayphone'];
                        $mbrctynm    = $rowsmbr_dtl['mbrd_ctynm'];
                        $mbrzip      = $rowsmbr_dtl['mbrd_bzip'];
                        $mbrstateid     = $rowsmbr_dtl['mbrd_bmbrcntym_id'];
                        $cntryname     = $rowsmbr_dtl['cntrym_name'];
                        $statename      = $rowsmbr_dtl['cntym_name'];
                        $billsts      = $rowsmbr_dtl['mbrd_dfltbil'];
                      ?>
                        <div class="col-md-12 ">
                          <div class="singl-add">
   <input type="hidden" name="addchk" value="<?php echo $mbrid; ?>" id="chk<?php echo $mbrid; ?>" <?php if ($shpsts == 'y') 
   {
          echo 'checked';
           } else 
           {   echo '';
             } ?> />
                            <label for="chk<?php echo $mbrid; ?>">
                              <strong><?php echo $mbrname;  ?></strong>
                              <?php echo '<br>'; ?><?php echo $mbraddr . ',<br>' . $mbrctynm . ',' . $statename . ',' . $mbrzip; ?>.
                              <?php echo '<br> Mobile No: '; ?> <?php echo $mbrphno ?>
                            </label>
                          </div>
                        </div>
                      <?php } ?>
                    </div>
                    <div class="row mult-addr" id="chkstr" style="display:none">
                      <div class="col-md-6 ">
                        <label for="strloc">
                          <h6>Select Nearest Store</h6>
                        </label>
                        <select class="form-select" id="strloc" name="strloc" aria-label="Default select example">
                          <option value="" selected> Select Store</option>
                          <?php
                          $sqrystr_loc_mst = "SELECT strlocm_id, strlocm_name from store_loc_mst order by strlocm_name";
                          $srsstrloc_mst = mysqli_query($conn, $sqrystr_loc_mst);
                          $cnt_str_loc = mysqli_num_rows($srsstrloc_mst);
                          ?>
                          <?php
                          while ($rowsstr_loc_mst = mysqli_fetch_array($srsstrloc_mst)) { ?>
                            <option value="<?php echo $rowsstr_loc_mst["strlocm_id"]; ?>">
                              <?php echo $rowsstr_loc_mst["strlocm_name"]; ?></option>
                              
                          <?php
                          }
                       
                          ?>
                        </select>
                      </div>
                    </div>
                  <?php } else { ?>
                  <?php } ?>
                  <!-- Card -->
                  <!-- Card -->
                  <div class="mb-3">
                    <div class="pt-2">
                      <h5 class="">We accept</h5>
                      <img class="mr-2" width="45px" src="https://mdbootstrap.com/wp-content/plugins/woocommerce-gateway-stripe/assets/images/visa.svg" alt="Visa">
                      <img class="mr-2" width="45px" src="https://mdbootstrap.com/wp-content/plugins/woocommerce-gateway-stripe/assets/images/amex.svg" alt="American Express">
                      <img class="mr-2" width="45px" src="https://mdbootstrap.com/wp-content/plugins/woocommerce-gateway-stripe/assets/images/mastercard.svg" alt="Mastercard">
                      <img class="mr-2" width="45px" src="https://mdbootstrap.com/wp-content/plugins/woocommerce/includes/gateways/paypal/assets/images/paypal.png" alt="PayPal acceptance mark">
                    </div>
                  </div>
                  <!-- Card -->
                <?php } else { ?>
                  <a href="<?php $rtpth ?>home" class="mt-3 view-details-btn btn btn-primary light phone-no shadow-none effect-1 w-100 text-center d-block"><span>Click
                      Here to Add Products</span></a>
                <?php } ?>
              </div>
              <!--Grid column-->
              <!--Grid column-->
              <div class="col-lg-4">
                <!-- Card -->
                <?php
                 
              
                if($coupen == '' || $cpndis=='n' ){
                  
                
                  ?>
                <div class="mb-3">
               
                <div class="mb-3">
                  <div class="pt-4">
                    
                    <a class="dark-grey-text d-flex justify-content-between" data-bs-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false" aria-controls="collapseExample">
                      Add a discount code (optional)<span><i class="fas fa-chevron-down pt-1"></i></span>
                    </a>
                    <div class="collapse" id="collapseExample">
                      <div class="mt-3">
                        <div class="cp-code md-form md-outline mb-0">
                          <input type="text" id="prdcupn" class="form-control font-weight-light" placeholder="Enter discount code">
                        </div>
                      </div>
                      <div class="col-lg-4 col-md-4 col-12">
                    <button class="ps-btn ps-btn--primary mb-3" type="button" onClick="javascript:frmcupn()">Apply coupon</button>
                    </div>
                    </div>
                  </div>
                </div>
                <?php  }
                 if($cpndis == 'n')
                 {
                   echo "<p style='color:red;'<strong>Coupon Not Applicable</strong></p>";
                 } 
               
                  ?>
                  <div class="pt-4">
                    <h5 class="mb-3 text-primary">The total amount of</h5>
                    <div id="dynmc_prcs">


                      <ul class="list-group list-group-flush">
                        <li class="list-group-item d-flex justify-content-between align-items-center border-0 px-0 pb-0">
                          Cart Value
                          <span>₹<?php if ($totcartprc > 0) {
                                    echo $totcartprc;
                                  } else {
                                    echo '0.00';
                                  }; ?></span>
                        </li>
                        <li class="list-group-item d-flex justify-content-between align-items-center px-0">
                            Devilery Charges
                            <span>₹<?php if ($od > 0) {
                                      echo $chrg = $od;
                                    } else {
                                      echo '0.00';
                                    }; ?></span>
                            <input type="hidden" name="chrgs" id="chrgs" value="<?php echo $chrg; ?>" />
                            <!-- <input type="hidden" name="deltype" id="deltype" value="d" /> -->
                          </li>
                    <?php    
                      if ($cpncunt > 0)
                         { 
                          ?>
                           <li class="list-group-item d-flex justify-content-between align-items-center px-0">
                           <p>Coupon applied: (<b><?php echo $cpnm_cde; ?></b>)</p>
                         <?php  if($cpndis == 'y')
                          {
                        
                            ?>
                            <span style="margin-left:15px; width:26px; height:26px; line-height:26px; text-align:center; border:1px solid #ccc; display:inline-block;"><a href="#" onclick="frmrmvcupn()"> <i class="fa fa-trash"></i></a></span>
                            <?php
                          }?>
                           <span>-  ₹<?php echo number_format($totcpndiscamt, 0, ".", ","); ?>
                        </span></li>
                        <?php }
                          
                        
                        
                        ?>
                       
                        <li class="list-group-item d-flex justify-content-between align-items-center px-0">
                          Total Cart Value
                          <span>₹<?php if ($totcartprc > 0 && $od != "" && $totcpndiscamt !='' ) {
                                    echo  ($totcartprc + $od) - $totcpndiscamt;
                                  }
                                  else if ($totcartprc > 0 && $od != ""){
                                    echo $totcartprc + $od;
                                  } 
                                  else if ($totcartprc > 0 && $df != ""&& $totcpndiscamt !='' ) {
                                    echo ($totcartprc + $df) - $totcpndiscamt;
                                  } 
                                  else if ($totcartprc > 0 && $df != ""){
                                    echo $totcartprc + $df;
                                  } 
                                  else {
                                    echo '0.00';
                                  }; ?></span>
                        </li>
                        <li class="list-group-item d-flex justify-content-between align-items-center border-0 px-0 mb-3">
                          <div>
                            <input type="hidden" name="ntTogPrc" id="ntTogPrc" value="<?php echo $totcartprc; ?>" />
                            <strong>The total amount of</strong>
                            <strong>
                              <p class="mb-0">(including GST)</p>
                            </strong>
                          </div>
                          <span><strong>₹<?php if ($totcartprc > 0 && $totcpndiscamt!='') {
                                            echo ($totcartprc + $chrg)- $totcpndiscamt;
                                          } 
                                          else if($totcartprc > 0 ){
                                          
                                            echo $totcartprc + $chrg;
                                          }
                                          else {
                                            echo '0.00';
                                          }; ?></strong></span>
                        </li>
                      </ul>
                    </div>
                    <div class="clearfix">
                      <!--<a href="#" class="mt-3 view-details-btn btn btn-primary light phone-no shadow-none effect-1 w-100 text-center d-block"><span>Confirm to pay</span></a>-->
                      <?php
                      if (isset($_SESSION['cartcode']) &&  (trim($_SESSION['cartcode']) != "")) {
                        if ($regid != '' && isset($regid)) { ?>
                          <button type="submit" name="btnSbmt" id="btnSbmt" value="Confirm Order" class=" view-details-btn btn btn-primary light phone-no shadow-none effect-1 w-100 text-center d-block p-5" /><span>Confirm
                            Order</span></button>
                        <?php } else { ?> <a href="<?php $rtpth ?>signin" class="mt-3 view-details-btn btn btn-primary light phone-no shadow-none effect-1 w-100 text-center d-block"><span>Login
                              OR Register To Continue</span></a>
                      <?php }
                      }
                      
                      ?>
               <!--------------------------------- Coupon Details ------------------------------------->   
                <input type = "hidden" value="<?php echo $cpnm_id;?>" name="hdncpncde"/>
                <input type = "hidden" value="<?php echo $cpnm_scat;?>" name="hdncpnscat"/>  
                <input type = "hidden" value="<?php echo $cpnm_discamt;?>" name="hdncpnval"/> 
                <!--------------------------------- Coupon Details ------------------------------------->  
                    </div>
                  </div>
                </div>
                <!-- Card -->
                <!-- Card -->
              
                <!-- Card -->
              </div>
              <!--Grid column-->
            </div>
            <!-- Grid row -->
          </section>
          <!--Section: Block Content-->
        </div>
      </section>
    </form>
  </div>
</div>


<script type="text/javascript">
  prdcnt();

  function prdcnt() {
    var totlprdcnt = document.getElementById('totlprodcnt').value;
    //alert(totlprdcnt);
    // document.getElementById('dsplyprodcnt').innerHTML = totlprdcnt;
  }
  function ChngAdr(frmname)
  {
    document.getElementById('frmblg'+frmname).action = "<?php echo $rtpth; ?>checkout.php?addr_sts=u";
    document.getElementById('frmblg'+frmname).submit();
  }

  function funprod(prdid) {
    //alert(prdid);
    var memid = document.getElementById('mbrid').value;
    //alert(memid);
    if (memid == "") {
      mbrlgn();
      return false;
    } else {
      var vehcbrndid = document.getElementById('vechbrndnid' + prdid).value;
      //alert(vehcbrndid);
      var url = "<?php echo $rtpth; ?>manage_wishlist.php?prodid=" + prdid + "&memid=" + memid + "&vehcbrndid=" +
        vehcbrndid;
      //alert(url);
      xmlHttp = GetXmlHttpObject(stchng_UpdtWishList);
      xmlHttp.open("GET", url, true);
      xmlHttp.send(null);
    }
  }

  function stchng_UpdtWishList() {
    if (xmlHttp.readyState == 4 || xmlHttp.readyState == "complete") {
      var temp = xmlHttp.responseText;
      temp = temp.trim();
      if (temp == 'wy') {
        prdadd();
      } else {
        prdalrdy();
      }
    }
  }

  function mbrlgn() {
    $('#wishlistModal').modal('show');
  }

  function prdadd() {
    $('#wishlistprdModal').modal('show');
  }

  function prdalrdy() {
    $('#wishlistalrdyModal').modal('show');
  }
</script>
<script>
  function funChsdeltyp(sts) {
    debugger;
    if (sts == 'df') {
      document.getElementById('chkdeladd').style.display = "block";
      // document.getElementById('chkdeladd1').style.display = "block";
      document.getElementById('chkstr').style.display = "none";
      // document.getElementById('fchrgs').style.display = "block";
      // document.getElementById('dchrg').style.display = "none";
      document.getElementById('fchrgs1').style.display = "block";
      document.getElementById('dchrg1').style.display = "none";
    } else if (sts == 'd') {
      document.getElementById('chkdeladd').style.display = "block";
      // document.getElementById('chkdeladd1').style.display = "block";
      document.getElementById('chkstr').style.display = "none";
      // document.getElementById('fchrgs').style.display = "none";
      // document.getElementById('dchrg').style.display = "block";
      document.getElementById('fchrgs1').style.display = "none";
      document.getElementById('dchrg1').style.display = "block";

    } else {
      document.getElementById('chkdeladd').style.display = "none";
      // document.getElementById('chkdeladd1').style.display = "none";
      document.getElementById('chkstr').style.display = "block";
      // document.getElementById('fchrgs').style.display = "none";
      // document.getElementById('dchrg').style.display = "none";
      document.getElementById('fchrgs1').style.display = "none";
      document.getElementById('dchrg1').style.display = "none";
    }
    var chkd = $('input[name="crtaddrsts"]:checked').val();
    if(chkd == "d")
    {
      var chrgs = document.getElementById('txtdevlrychrg').value;
    }
    if(chkd == "df")
    {
      var chrgs = document.getElementById('txtftngchrg').value;
    }
    if(chkd == "fs")
    {
      var chrgs = document.getElementById('txtftstchrg').value;
    }
  
    var totcrtprc = $("#ntTogPrc").val();
    var cpnid = document.getElementById('cpnid').value;
    var cpndisamt = document.getElementById('cpndisamt').value;
    // var cpncunt = document.getElementById('cpncunt').value;
    $.ajax({
      type: "POST",
      url: "chng_prcs_chkout.php",
      data: 'chrgs='+chrgs+'&totcrtprc='+totcrtprc+'&chkd='+chkd+'&cpnid='+cpnid+'&cpndisamt='+cpndisamt,
      // +'&cpncunt='+cpncunt
      success: function(data) {
        // alert(data)
        $("#dynmc_prcs").html(data);
      }
    });
  }
  function frmcupn()
	{
    debugger
		cupn = document.getElementById("prdcupn").value;
		if (cupn != '')
		{
			var url = "<?php echo $rtpth; ?>manage_cart.php?coupn="+cupn;
			xmlHttp = GetXmlHttpObject(stchng_UpdtCart);
			xmlHttp.open("GET", url, true);
			xmlHttp.send(null);
		}
		else
		{
			alert("Enter Coupon Code")
		}
	}
	function stchng_UpdtCart()
	{
    location.reload();
		//  if (xmlHttp.readyState == 4 || xmlHttp.readyState == "complete")
		// {
		// 	var temp = xmlHttp.responseText;
		// 	alert(temp);
		// } 
	}
	function frmrmvcupn()
	{
		rmvcupn = "r";
		var url = "<?php echo $rtpth; ?>manage_cart.php?rmv=" + rmvcupn;
		xmlHttp = GetXmlHttpObject(stchng_rmvcupn);
		xmlHttp.open("GET", url, true);
		xmlHttp.send(null);
	}
	function stchng_rmvcupn()
	{
		location.reload();
		/* if (xmlHttp.readyState == 4 || xmlHttp.readyState == "complete")
		{
			var temp = xmlHttp.responseText;
		} */
	}

</script>
<div class="modal fade" id="changAddress" tabindex="-1" role="dialog" aria-labelledby="changAddressLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="changAddressLabel">Change / Add Address</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<div class='card bg-light'>
					<div class='card-body'>
						<div class="row">
							<div class="col-12">
								<?php
                $sqlmbr_mst= "SELECT mbrm_id, mbrm_name, mbrm_phno, mbrm_emailid from mbr_mst where mbrm_id = $regid";  
                $resmbr_mst = mysqli_query($conn,$sqlmbr_mst);
                $cntadr = mysqli_num_rows($resmbr_mst);
                $rowmemb_mst = mysqli_fetch_assoc($resmbr_mst);
                $membname = $rowmemb_mst['mbrm_name'];
                $memid = $rowmemb_mst['mbrm_id'];
                $membphno = $rowmemb_mst['mbrm_phno'];
                $membemail = $rowmemb_mst['mbrm_emailid'];
                $sqrymbr_dtl1 = "SELECT mbrd_id,mbrd_fstname,mbrd_lstname, mbrd_badrs,mbrd_badrs2,mbrd_cmpny,ctym_name, mbrd_bzip,mbrd_bdayphone,cntrym_name, mbrd_dfltbil,mbrd_dfltshp,mbrd_mbrm_id, cntrym_name,cntym_name,cntntm_name,ctym_sts, cntym_sts,mbrm_emailid,mbrd_bmbrcntrym_id from vw_mbr_mst_dtl_bil where mbrd_mbrm_id=mbrm_id and mbrm_id = $regid order by mbrd_dfltbil = 'y' desc, mbrd_dfltshp = 'y' desc";
                //	echo $sqrymbr_dtl1;exit;
                $srsmbr_dtl1 = @mysqli_query($conn, $sqrymbr_dtl1);
                $cntrec = @mysqli_num_rows($srsmbr_dtl1);
                $cnt = 0;
                while ($rowsmbr_dtl1 = mysqli_fetch_assoc($srsmbr_dtl1))
                {
                  $bilsts = $rowsmbr_dtl1['mbrd_dfltbil'];
                  $shpsts = $rowsmbr_dtl1['mbrd_dfltshp'];
                 $mbrid = $rowsmbr_dtl1['mbrd_id'];
                  $mbrmstid = $rowsmbr_dtl1['mbrd_mbrm_id'];
                  $mbrd_bmbrcntym_id = $rowsmbr_dtl1['mbrd_bmbrcntrym_id'];
                  //echo $mbrd_bmbrcntym_id;
                  $sqrycntry_mst = "select * from cntry_mst where cntrym_id = '$mbrd_bmbrcntym_id'";
                  $srscntry_mst = mysqli_query($conn, $sqrycntry_mst);
                  $srowscntry_mst = mysqli_fetch_assoc($srscntry_mst);
                  ?>
                  <form name="frmblg<?php echo $mbrid ?>" id="frmblg<?php echo $mbrid ?>" method="POST">
                    <div class="border-bottom mb-3">
                      <!-- <span onclick="funbDeletmemdtl(<?php echo $mbrid; ?>)" class="pull-right"><i class="fas fa-trash-alt"></i></span> -->
                      <p>
                        <input type="radio" onclick="javascript:ChngAdr(<?php echo $mbrid; ?>)" name="chkshp" value="s" id="chkshp" <?php if ($shpsts == 'y' && $chked == '') {
                              echo 'checked';
                            } ?> />
                        <input type="hidden" name="hdnmsid" value="<?php echo $mbrid ?>" id="hdnmsid" />
                        <input type="hidden" name="hdnmstid" value="<?php echo $mbrmstid ?>" id="hdnmstid" />
                        <input type="hidden" name="chkshop" id="chkshop" value="n"/>
                        <strong><?php echo $rowsmbr_dtl1['mbrd_fstname'] . $rowsmbr_dtl1['mbrd_lstname']; ?></strong>
                      </p>
                      <p class="ml-4">
                        <?php echo $rowsmbr_dtl1['mbrd_badrs'] . "," . $rowsmbr_dtl1['ctym_name'] . "," . $rowsmbr_dtl1['cntym_name'] . $dspsastx . "," . $srowscntry_mst['cntrym_name'] . $dspsastx . "," . $rowsmbr_dtl1['mbrd_bzip']; ?></br>
                        <strong>Contact No:</strong><?php echo "  " . $rowsmbr_dtl1['mbrd_bdayphone'] ?>
                      </p>
                    </div>
                  </form>
                  <?php
                }
                include_once("includes/inc_fnct_ajax_validation.php"); ?>
                <form name="frmaddbilngdtl" id="frmaddbilngdtl" action="<?php $_SERVER['PHP_SELF'];?>" method="post" onSubmit="return performCheck('frmaddbilngdtl', addrrules, 'inline');">
                  <input type="hidden" class="form-control ps-form__input" name="hnsname1" value="<?php echo $membname ;?>">
                  <input type="hidden" class="form-control ps-form__input" name="hnsemail" value="<?php echo $membemail;?>">
                  <input type="hidden" class="form-control ps-form__input" name="hnsmembid" value="<?php echo $memid;?>">
                  <div class="ps-form--review chkt-forms">
                    <h2 class="ps-form__title">Add Address</h2>
                    <div class="row">
                      <div class="col-lg-12 co-lmd-12">
                        <div class="ps-form__group">
                          <label class="ps-form__label">Full Name</label>
                          <input class="form-control ps-form__input" type="text" name="txtname" id="txtname" value="<?php echo $membname ;?>">
                        </div>
                      </div>
                    </div>
                    <div class="row">
                      <div class="col-lg-6 col-md-6">
                        <div class="ps-form__group">
                          <label class="ps-form__label">Email *</label>
                          <input class="form-control ps-form__input" type="text" name="txtemail" id="txtemail" value="<?php echo $membemail;?>" disabled style="cursor:not-allowed">
                        </div>
                      </div>
                      <div class="col-lg-6 col-md-6">
                        <div class="ps-form__group">
                          <label class="ps-form__label">Mobile *</label>
                          <input class="form-control ps-form__input" type="text" name="txtphno" id="txtphno" value="<?php echo $membphno;?>">
                        </div>
                      </div>
                    </div>
                    <div class="row">
                      <div class="col-lg-12 col-md-12">
                        <label class="ps-form__label">Address *</label>
                        <div class="ps-form__group">
                          <textarea class="form-control ps-form__textarea" rows="3" name="txtaddr" id="txtaddr"></textarea>
                          <span id="errorsDiv_txtaddr"></span>
                        </div>
                      </div>
                    </div>
                    <div class="row">
                      <div class="col-lg-6 col-md-6">
                        <div class="ps-form__group">
                          <label class="ps-form__label">Country *</label>
                          <!-- <input class="form-control ps-form__input" type="text"> -->
                          <select name="lstcntry" id="lstcntry" class="form-control ps-form__input" onchange="funcPopCnty()">
                            <option value="2" selected> India</option>
                          </select>
                        </div>
                      </div>
                      <div class="col-lg-6 col-md-6">
                        <div class="ps-form__group">
                          <label class="ps-form__label">State *</label>
                          <!-- <input class="form-control ps-form__input" type="text"> -->
                          <select name="lststate" id="lststate" class="form-control ps-form__input">
                            <?php
                            $sqrymbrcnty_mst = "SELECT cntym_id,cntym_name,cntym_sts from cnty_mst where (cntym_sts ='a' or cntym_sts ='u') and cntym_cntrym_id = 2 group by cntym_id order by cntym_name";
                            $srsmbrcnty_mst = mysqli_query($conn,$sqrymbrcnty_mst) or die(mysql_error());
                            $dispstr = "";
                            while($srowmbrcnty_mst = mysqli_fetch_assoc($srsmbrcnty_mst))
                            {
                              $cntymid = $srowmbrcnty_mst['cntym_id'];
                              $cntymnm = $srowmbrcnty_mst['cntym_name'];
                              $cntysts = $srowmbrcnty_mst['cntym_sts'];
                              ?>
                              <option value="<?php echo $cntymid ?>"
                                <?php if($cntymid=='28' ){ echo 'selected';}else{echo '';}?>>
                                <?php echo $cntymnm ?></option>
                              <?php
                            }
                            ?>
                          </select>
                          <span id="errorsDiv_lststate"></span>
                        </div>
                      </div>
                    </div>
                    <div class="row">
                      <div class="col-lg-6 col-md-6">
                        <div class="ps-form__group">
                          <label class="ps-form__label">City *</label>
                          <input class="form-control ps-form__input" type="text" name="txtcty" id="txtcty">
                          <span id="errorsDiv_txtcty"></span>
                        </div>
                      </div>
                      <div class="col-lg-6 col-md-6">
                        <div class="ps-form__group">
                          <label class="ps-form__label">Pin Code *</label>
                          <input class="form-control ps-form__input" type="text" name="txtpin" id="txtpin">
                          <span id="errorsDiv_txtpin"></span>
                        </div>
                      </div>
                    </div>
                    <div class="form-group" style="display:block">
											<!-- <label for="chkbiladrs" class="checkbox-inline"> -->
												<input type="checkbox" name="chkbiladrs" id="chkbiladrs" value="y" checked="">Billing Address
											<!--</label>-->
											<!--<label for="chkshpadrs" class="checkbox-inline">-->
												<input type="checkbox" name="chkshpadrs" id="chkshpadrs" value="y" checked="">Default Shipping Address
											<!--</label>-->
										</div>
                    <div class="row">
                      <div class="col-lg-12 col-md-12">
                        <div class="ps-form__submit">
                          <input name="btnnewadrsadd" type="submit" id="btnnewadrsadd" value="Add" class="ps-btn ps-btn--warning"/>
                          <!-- <button class="ps-btn ps-btn--warning">Add</button>-->
                        </div>
                      </div>
                      <!-- <div class="col-lg-6 col-md-6">
                        <div class="ps-form__submit">
                          <a href="<?php echo $rtpth; ?>home" class="ps-btn do-later-btn">Do it Later</a>
                        </div>
                      </div> -->
                    </div>
                  </div>
                </form>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <!-- <button type="button" class="btn btn-primary">Save changes</button> -->
      </div>
    </div>
  </div>
</div>

<?php include_once('footer.php'); ?>
<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.3.1/js/bootstrap.bundle.min.js"></script>