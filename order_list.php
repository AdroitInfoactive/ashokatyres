<?php
           
			include_once "includes/inc_membr_session.php";//checking for session	
			include_once 'includes/inc_nocache.php'; // Clearing the cache information
            include_once 'includes/inc_connection.php';//Make connection with the database  	
            include_once "includes/inc_config.php";	//path config file
		    include_once "includes/inc_usr_functions.php";//Including user session value
	global $gmsg,$email;		
	

	 $membrid   = $_SESSION['sesmbrid'];	

	


$page_title = "Order List";
$page_seo_title = "Oder List";
$db_seokywrd = "";
$db_seodesc = "";
$current_page = "oder-list";
$body_class = "oder-list";
include('header.php');
?>
 <?php 
    $mbmr_id = $_SESSION['sesmbrid'];
    $order_qry = "SELECT crtordm_id, crtordm_code, crtordm_sesid, crtordm_fstname, crtordm_lstname, crtordm_badrs, crtordm_badrs2, crtordm_bcmpny, crtordm_bmbrctym_id, crtordm_bmbrcntym_id, crtordm_bzip, crtordm_bmbrcntrym_id, crtordm_bdayphone, crtordm_emailid, crtordm_sfstname, crtordm_slstname, crtordm_sadrs, crtordm_sadrs2, crtordm_scmpny, crtordm_smbrctym_id, crtordm_smbrcntym_id, crtordm_szip, crtordm_smbrcntrym_id, crtordm_sdayphone, crtordm_semailid, crtordm_qty, crtordm_shp_typ, crtordm_amt, crtordm_hsncde, crtordm_igst, crtordm_sgst, crtordm_cgst, crtordm_disamt, crtordm_wt, crtordm_pmode, crtordm_prcssts, crtordm_cartsts, crtordm_paysts, crtordm_rmks, crtordm_pgdtl, crtordm_shpchrgm_id, crtordm_shpchrgamt, crtordm_codamt, crtordm_cpnm_id, crtordm_cpnm_typ, crtordm_cpnm_val, crtordm_mbrm_id, crtordm_ordtyp,crtordm_crtdon,ordstsd_ordstsm_id FROM crtord_mst
    inner join ordsts_dtl on ordstsd_crtordm_id = crtordm_id
    WHERE crtordm_mbrm_id = $mbmr_id group by crtordm_id order by crtordm_id desc";
    $order_mst = mysqli_query($conn,$order_qry);
    $num_rows = mysqli_num_rows($order_mst);
    while($order_dtl = mysqli_fetch_assoc($order_mst))
    {
        $data_array[] = $order_dtl;
    }
    ?>

<div class="page-content bg-white"> 
  <!-- Banner  -->
  <div class="dlab-bnr-inr short-banner style-1 overlay-black-middle"
        style="background-image: url(<?php echo $rtpth;?>images/banner/bnr1.jpg);">
    <div class="container">
      <div class="dlab-bnr-inr-entry">
        <h1 class="text-white"><?php echo $page_title  ?></h1>
        <div class="d-flex justify-content-center align-items-center">
          <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
              <li class="breadcrumb-item"><a href="<?php echo $rtpth;?>">Home</a></li>
              <li class="breadcrumb-item active" aria-current="page"><?php echo $page_title  ?></li>
            </ol>
          </nav>
        </div>
      </div>
    </div>
  </div>
  <!-- Banner End --> 
  
  <!-- Demo header-->
  <section class="py-4 header ac-pages-style">
    <div class="container py-4">
      <div class="row">
        <div class="col-md-3"> 
          <!-- Tabs nav -->
        <?php  include('acc_leftlinks.php'); ?>
        </div>
        <div class="col-md-9"> 
          <!-- Tabs content -->
         
         
        
              <div class="table-responsive">
                <table class="table table-bordered">
                  <thead>
                    <tr>
                    <th class="ps-product__thumbnail">Order Id</th>
                  <th class="ps-product__thumbnail">Order Date</th>
                  <th class="ps-product__thumbnail">Payment Status</th>
                  <th class="ps-product__thumbnail">No.Items</th>
                  <th class="ps-product__thumbnail">Total Amount</th>
                  <th class="ps-product__thumbnail">Order Status</th>
                  <th class="ps-product__thumbnail">Action</th>
                    </tr>
                  </thead>
                  <tbody>
                <?php
                foreach ($data_array as $ord_dtl)
                {
                  $id = $ord_dtl['crtordm_id'];
                  $code = $ord_dtl['crtordm_code'];
                  $date = $ord_dtl['crtordm_crtdon'];
                  $paysts = $ord_dtl['crtordm_paysts'];
                  if($paysts == 'n')
                  {
                    $psts = "No";
                  }
                  if($paysts == 'y')
                  {
                    $psts = "Yes";
                  }
                  $ordqnty = $ord_dtl['crtordm_qty'];
                  $ordamt = $ord_dtl['crtordm_amt'];
                  $ordsts = $ord_dtl['ordstsd_ordstsm_id'];
                  $ordsts_qry = "SELECT ordstsm_id, ordstsm_name, ordstsm_desc, ordstsm_sts, ordstsm_prty FROM ordsts_mst WHERE ordstsm_id = $ordsts";
                  $ordersts_mst = mysqli_query($conn,$ordsts_qry);
                  $ordersts_dtl = mysqli_fetch_assoc($ordersts_mst);
                  $ordstsid = $ordersts_dtl['ordstsm_id'];
                  $type = $ordersts_dtl['ordstsm_name'];
                  if ($ordstsid == '2')
                  {
                    $sts_cls = "ps-product__status-cancel";
                  }
                  else
                  {
                    $sts_cls = "ps-product__status";
                  }
                  ?>
                  <tr class="mb-2">
                    <td class="ps-product__name"><?php echo $code; ?></a></td>
                    <td class="ps-product__name"><?php echo $date; ?></a></td>
                    <td class="ps-product__name"><?php echo $psts; ?></a></td>
                    <td class="ps-product__name"><?php echo $ordqnty; ?></a></td>
                    <td class="ps-product__name"><?php echo $ordamt; ?></a></td>
                    <td class="<?php echo $sts_cls; ?>"><span><?php echo $type; ?></span></td>
                    <td><a class="ps-btn ps-btn--warning p-2" href="<?php echo $rtpth; ?>order-details/<?php echo $id; ?>">View</a></td>
                  </tr>
                  <?php
                }
                ?>
              </tbody>
                </table>
              </div>
            </div>
         
       
      </div>
    </div>
  </section>
  

  
</div>

<?php include_once('footer.php'); ?>
<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.3.1/js/bootstrap.bundle.min.js"></script>