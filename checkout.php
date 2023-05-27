<?php
error_reporting(0);
include_once 'includes/inc_nocache.php'; // Clearing the cache information
//include_once "includes/inc_membr_session.php";//checking for session
include_once "includes/inc_config.php"; // site and  files confige	
include_once "includes/inc_usr_sessions.php";
include_once 'includes/inc_connection.php'; //Make connection with the database
include_once 'includes/inc_folder_path.php'; //Including Image resize function		
include_once "includes/inc_config.php";
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
   $sqrymbr_mst = "SELECT crtordm_mbrm_id,crtordm_id,crtordm_cpnm_id from crtord_mst where crtordm_mbrm_id = '$regid' and crtordm_cpnm_id = '$cpnm_id'";
  $srsmbr_mst = mysqli_query($conn, $sqrymbr_mst);
  $cntmbr_mst = mysqli_num_rows($srsmbr_mst);
 // echo $cntmbr_mst;
 $sqrycpn_mst = "SELECT cpnm_id,cpnm_cde,cpnm_name,cpnm_mncat, cpnm_cat,cpnm_scat,cpnm_aptyp,cpnm_memtyp,cpnm_disctyp,cpnm_discamt,cpnm_exdt,cpnm_discper, cpnm_sts,cpnm_prty,cpnm_usetyp,cpnm_mbrm_id,cpnm_ntamt, cpnm_ntamttyp,cpnm_applon,cpnm_brnd from cpn_mst where cpnm_cde = '$coupen' and cpnm_exdt >= '$gcurdt' and cpnm_sts = 'a'";
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
                                      if(($cpnm_brnd == $prodbrnd) || ($cpnm_brnd == 0))
                                      {
                                        $cpndis = 'y';
                                        $cpnprdprc = $prc * $cart_qty;
                                        $totalcpnprdprc += $cpnprdprc;
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
                  <div class="row">
                    <div class="col-lg-6 col-md-6">
                      <p>Coupon applied: (<b><?php echo $cpnm_cde; ?></b>)</p>
                    
                      <input type="hidden" id="cpnid" value="<?php echo  $cpnm_cde; ?>" />
                    </div>
                    <div class="col-lg-6 col-md-6">
                      <p class="text-right"><i class="fa fa-rupee"></i>&nbsp;-<?php echo number_format($totcpndiscamt, 2, ".", ","); ?>
                      <input type="hidden" id="cpndisamt" value="<?php echo  $totcpndiscamt; ?>" />
                    </p>
                    </div>
                  </div>
                  <?php
                  $crttotamt = $totuntprc - $totcpndiscamt;
                }?>
                  <!-- ************** coupons ends -->
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
                      <?php $sqrymbr_dtl =   "SELECT mbrd_id,mbrd_fstname,mbrd_lstname, mbrd_badrs,mbrd_badrs2,mbrd_cmpny,ctym_name, mbrd_bzip,mbrd_bdayphone,cntrym_name, mbrd_ctynm,mbrd_bdayphone,mbrd_dfltbil,mbrd_dfltshp,mbrd_mbrm_id,mbrm_phno,mbrd_emailid,cntrym_name,cntym_name,cntntm_name,ctym_sts, cntym_sts,mbrm_emailid,mbrd_bmbrcntrym_id,mbrd_bmbrcntym_id,cntym_name,cntrym_name from vw_mbr_mst_dtl_bil 
where mbrd_mbrm_id=$regid and mbrm_id = $regid order by mbrd_id  desc";
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
                            <input type="radio" name="addchk" value="<?php echo $mbrid; ?>" id="chk<?php echo $mbrid; ?>" <?php if ($billsts == 'y') {
                                                                                                                            echo 'checked';
                                                                                                                          } else {
                                                                                                                            echo '';
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
                <div class="mb-3">
                  <div class="clearfix">
                    <a href="<?php $rtpth ?>home" class="mt-3 view-details-btn btn btn-primary light phone-no shadow-none effect-1 w-100 text-center d-block"><span>Continue
                        Shopping</span></a>
                  </div>
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
                          </li>
                       
                        <li class="list-group-item d-flex justify-content-between align-items-center px-0">
                          Total Cart Value
                          <span>₹<?php if ($totcartprc > 0 && $od != "") {
                                    echo $totcartprc + $od;
                                  } else if ($totcartprc > 0 && $df != "") {
                                    echo $totcartprc + $df;
                                  } else {
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
                          <span><strong>₹<?php if ($totcartprc > 0) {
                                            echo $totcartprc + $chrg;
                                          } else {
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
                      } ?>
                    </div>
                  </div>
                </div>
                <!-- Card -->
                <!-- Card -->
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
    $.ajax({
      type: "POST",
      url: "chng_prcs_chkout.php",
      data: 'chrgs='+chrgs+'&totcrtprc='+totcrtprc+'&chkd='+chkd+'&cpnid='+cpnid+'&cpndisamt='+cpndisamt,
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


<?php include_once('footer.php'); ?>