<?php
error_reporting(0);  
      
include_once "includes/inc_membr_session.php";//checking for session	
include_once 'includes/inc_nocache.php'; // Clearing the cache information
 include_once 'includes/inc_connection.php';//Make connection with the database  
 include_once "includes/inc_folder_path.php"; //  folder path confige
//include_once "includes/inc_fnct_img_resize.php"; //image resize 
//include_once "includes/inc_img_size.php"; //image size fix	
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

<style>
.add-221 p {
  margin-bottom: 0px;
}

.add-221 p strong {
  font-weight: 500;
}
</style>
<div class="ps-categogy ps-categogy--separate">
  <div class="container">
    <ul class="ps-breadcrumb">
      <li class="ps-breadcrumb__item"><a href="<?php echo $rtpth; ?>home">Home</a></li>
      <li class="ps-breadcrumb__item active" aria-current="page">Order Details</li>
    </ul>
    <h1 class="ps-categogy__name">Order Details</h1>
  </div>
  <div class="">
    <!-- Demo header-->
    <section class="py-5 header">
      <div class="container py-4">
        <div class="row">
          <div class="col-md-12 my-db-content">
            <!-- Tabs content -->
            <div class="tab-content">
              <?php
							 $mbmr_id = $_SESSION['sesmbrid'];
								$id = $_REQUEST['orderid'];
								$order_qry = "SELECT crtordm_id, crtordm_code, crtordm_fstname, crtordm_lstname, crtordm_badrs, crtordm_badrs2, blcty.ctym_name as bctynm,blcnty.cntym_name as bcntynm, crtordm_bzip,blcntry.cntrym_name as bcntrynm, blcntry.cntrym_id as bcntryid, crtordm_bdayphone, crtordm_emailid,crtordm_sfstname, crtordm_slstname, crtordm_sadrs, crtordm_sadrs2, shpcty.ctym_name as sctynm, shpcnty.cntym_name as scntynm, shpcnty.cntym_id as scntyid, crtordm_szip, shpcntry.cntrym_name as scntrynm, crtordm_sdayphone, crtordm_semailid, crtordm_qty, crtordm_amt, crtordm_wt, crtordm_pmode, crtordm_prcssts, crtordm_cartsts, crtordm_paysts, crtordm_rmks, crtordm_shpchrgm_id, crtordm_shpchrgamt, crtordm_cpnm_val, crtordm_mbrm_id, crtordm_ordtyp, date_format(crtordm_crtdon,'%d-%m-%Y %h:%i:%s') as crtordm_crtdon, blcty.ctym_sts as bctysts, shpcty.ctym_sts as sctysts, blcnty.cntym_sts as bcntysts, shpcnty.cntym_sts as scntysts, blcntnt.cntntm_name as bcntntm_name, shpcntnt.cntntm_name as scntntm_name, crtordm_cpnm_id, crtordm_pmode, crtordm_pmode, ordstsd_ordstsm_id
								from crtord_mst crtord
								left join cntry_mst blcntry on blcntry.cntrym_id=crtord.crtordm_bmbrcntrym_id
								left join cnty_mst blcnty on blcnty.cntym_id = crtord.crtordm_bmbrcntym_id
								left join cty_mst blcty on blcty.ctym_id = crtord.crtordm_bmbrctym_id
								left join cty_mst shpcty on shpcty.ctym_id = crtord.crtordm_smbrctym_id
								left join cnty_mst shpcnty on shpcnty.cntym_id = crtord.crtordm_smbrcntym_id
								left join cntry_mst shpcntry on shpcntry.cntrym_id= crtord.crtordm_smbrcntrym_id
								left join cntnt_mst blcntnt on blcntry.cntrym_cntntm_id= blcntnt.cntntm_id
								left join cntnt_mst shpcntnt on shpcntry.cntrym_cntntm_id= shpcntnt.cntntm_id
								left join cpn_mst on cpn_mst.cpnm_id = crtordm_cpnm_id
								left join ordsts_dtl on ordsts_dtl.ordstsd_crtordm_id = crtordm_id
									where crtordm_id='$id'";
									$order_mst = mysqli_query($conn,$order_qry);
									$num_rows = mysqli_num_rows($order_mst);
									$order_dtl = mysqli_fetch_assoc($order_mst);
									$code = $order_dtl['crtordm_code'];
										$date = $order_dtl['crtordm_crtdon'];
										$paysts = $order_dtl['crtordm_paysts'];
										if($paysts == 'n'){
												$psts = "No";
										}
										if($paysts == 'y'){
												$psts = "Yes";
										}
										$sqry_crtord_sts = "SELECT ordstsd_ordstsm_id from ordsts_dtl where ordstsd_crtordm_id = $id order by ordstsd_id desc limit 1";
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
										?>
              <div class="p-4 mb-4">
                <div class="ps-wishlist">
                  <div class="container">
                    <div class="row justify-content-center">
                      <div class="col-lg-6 col-md-6 col-12">
                        <div class="add-holder22 bg-white text-center ">
                          <h3>Order Id: <?php echo $code; ?></h3>
                          <h4><u>Order Info</u></h4>
                          <div class="mt-3">
                            <p class="mb-0"><strong>Order Id: </strong><?php echo $code; ?></p>
                            <p class="mb-0"><strong>Order On: </strong><?php echo $date; ?></p>
                            <p class="mb-0"><strong>Payment Status: </strong> <?php echo $psts; ?></p>
                            <p class="mb-0"><strong>Payment Status: </strong><?php echo $type; ?></p>
                            <p class="mb-0"><u>Order will be delivered by 7 Business days.</u></p>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <div class=" bg-white p-4">
                <div class="ps-wishlist">
                  <div class="container">
                    <div class="row">
                      <div class="col-lg-6 col-md-6 col-12">
                        <div class="add-holder22 log-reg-forms add-221">
                          <h4>Billing Address</h4>
                          <p><strong>Name:
                            </strong><?php echo $order_dtl['crtordm_fstname']." ".$order_dtl['crtordm_lstname'];?></p>
                          <p><strong>Phone No: </strong><?php echo $order_dtl['crtordm_bdayphone'];?></p>
                          <p><strong>Email Id: </strong><?php echo $order_dtl['crtordm_emailid'];?></p>
                          <p><strong>Address: </strong><?php echo $order_dtl['crtordm_badrs'];?></p>
                          <p><strong>City: </strong><?php echo $order_dtl['bctynm'];?></p>
                          <p><strong>State: </strong><?php echo $order_dtl['bcntynm'];?></p>
                          <p><strong>Country: </strong><?php echo $order_dtl['bcntrynm'];?></p>
                          <p><strong>Postal Code: </strong><?php echo $order_dtl['crtordm_bzip'];?></p>

                        </div>
                      </div>
                      <div class="col-lg-6 col-md-6 col-12">
                        <div class="add-holder22 log-reg-forms add-221">
                          <h4>Shipping Address</h4>
                          <p><strong>Name:
                            </strong><?php echo $order_dtl['crtordm_sfstname'].' '.$order_dtl['crtordm_slstname'];?></p>
                          <p><strong>Phone No: </strong><?php
																	if($order_dtl['crtordm_sdayphone'] =='')
																	{
																			echo $order_dtl['crtordm_bdayphone'];
																	}
																	else
																	{
																			echo $order_dtl['crtordm_sdayphone'];
																	}
																	?></p>
                          <!-- <p><strong>Email Id: </strong><?php echo $rowsord_mst['crtordm_semailid'];?></p> -->
													<p><strong>Email Id: </strong><?php echo $order_dtl['crtordm_emailid'];?></p>
                          <p><strong>Address: </strong><?php echo $order_dtl['crtordm_sadrs'];?></p>
                          <p><strong>City: </strong><?php echo $order_dtl['sctynm'];?></p>
                          <p><strong>State: </strong><?php echo $order_dtl['scntynm'];?></p>
                          <p><strong>Country: </strong><?php echo $order_dtl['scntrynm'];?></p>
                          <p><strong>Postal Code: </strong><?php echo $order_dtl['crtordm_szip'];?></p>
                        </div>
                      </div>
                    </div>
                    <br>
                    <div class="ps-shopping">
                      <div class="container">
                        <h3 class="tab-cont-hd-title mb-3">Item List</h3>
                        <div class="ps-shopping__content">
                          <div class="row">
                            <div class="col-12">
                              <div class="ps-shopping__table">
                                <table class="table ps-table ps-table--product">
                                  <thead>
                                    <tr>
                                      <th class="ps-product__thumbnail">Sl. No.</th>
                                      <th class="ps-product__thumbnail">Product</th>
                                      <th class="ps-product__name">Code/Name</th>
                                      <th class="ps-product__meta">Unit Price</th>
                                      <?php
																				if($state=='Telangana'){?>
                                      <th class="ps-product__meta">CGST (%)</th>
                                      <th class="ps-product__meta">SGST (%)</th>
                                      <?php	}
																			else{?>
                                      <th class="ps-product__meta">IGST (%)</th>
                                      <?php
																			}?>


                                      <th class="ps-product__quantity">Quantity</th>
                                      <th class="ps-product__subtotal">Total Price(INR)</th>
                                    </tr>
                                  </thead>
                                  <tbody>
                                    <?php
																		$pototqty = $rowsord_mst['crtordm_qty'];
																		$pototprc = $rowsord_mst['crtordm_amt'];
														$sqrycrtord_dtl =	"SELECT  crtordd_id, crtordd_qty,crtordd_prc,prodm_id,prodm_name, crtordd_prc as unprcval,prodm_id,prodm_sku,prodm_sleprc,prodm_ofrprc ,prodm_name,crtordm_shpchrgm_id,prodimgd_simg,prodimgd_title,crtordd_igst,crtordd_cgst,crtordd_sgst,prodm_tyrrmsz
																		from crtord_dtl 
																		inner join crtord_mst on crtordd_crtordm_id = crtordm_id
																		inner join prod_mst on prod_mst.prodm_id = crtord_dtl.crtordd_prodm_id 
																	left join prodimg_dtl on prodimgd_prodm_id = prodm_id
																	 where crtordd_crtordm_id=$id group by crtordd_id";
																		echo $sqrycrtord_dtl;
																		error_reporting(0);
																		$srscrtord_dtl = mysqli_query($conn,$sqrycrtord_dtl);
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
																				$img =	$rowspo_mst['prodimgd_simg'];
																				if($img != "")
																				{	
																					/* $smlImgPth = $gprodsimg_usrpth . $smlImgNm . '.jpg'; */
																				$imgpth = $rtpth.$gprodsimg_usrpth.$img. '.jpg';
																				}else{
																					$imgpth  =$rtpth.'images/ashoka-no-image.jpg';
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
																				$totlprdprc = ($totlprdprc+$totprc);
																				// $gst = 1+($gstval/100);
																				// $sgst = 1+($sgstval/100);
																				// $cgst = 1+($cgstval/100);
																				//$prdprc  = $db_prc/$gst;
																				$prdprc  = $db_prc;
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
																				if($state =='Telangana')
																				{
																					$gstdiv =  $prodtax/2;
																					$cgst = number_format($gstdiv,2,'.',',');
																					$sgst = number_format( $gstdiv,2,'.',',');
																					// $gstper = ($gstval/2);
																				}
																				?>
                                    <tr class="mb-2">
                                      <td class="ps-product__remove"> <a href="#"><?php echo $cntord;?></a></td>
                                      <td class="ps-product__thumbnail">
                                        <a class="ps-product__image" href="#">
                                          <figure><img src="<?php echo $imgpth; ?>" width="100px" height="100px" alt=""></figure>
                                        </a>
                                      </td>
                                      <td class="ps-product__name"> <a href="#">
                                          Name : <?php echo $rowspo_mst['prodm_name']; ?> </br>
                                       Code : <?php echo $rowspo_mst['prodm_sku']; ?>
																			 Size : <?php echo $rowspo_mst['prodm_tyrrmsz']; ?>
																				 </a></td>

                                      <td class="ps-product__meta"> <span class="ps-product__price sale"> <?php
																					$prdwoustgst = $prdprc - $prodtax;
																					$prodprcwqty = $prdwoustgst * $db_qty;
																					echo number_format($prdwoustgst,2,'.',',');
																					?></span>
                                      </td>
                                      <!-- tax -->
                                      <?php
																				if($state=='Telangana')
																				{
																					$gst_per = $tax/2;
																					?>
                                      <td class="ps-product__quantity"><?php echo $cgst. " (".$gst_per."%)"; ?></td>
                                      <td class="ps-product__quantity"><?php echo 	$sgst. " (".$gst_per."%)";
																					$totprodtax = $prodtax * $db_qty;
																					$tottax += $totprodtax;
																					$totprodtax	=	$totprodtax + $prodtax;
																					?></td>
                                      <?php
																				}
																				else
																				{ ?>
                                      <td class="ps-product__quantity"><?php
																					echo number_format($prodtax,2,'.',','). " (".$tax."%)";
																					$totprodtax = $prodtax * $db_qty;
																					$tottax += $totprodtax;
																					$totprodtax	=	$totprodtax + $prodtax;
																					?></td>
                                      <?php
																				}
																				?>
                                      <td class="ps-product__quantity"><?php
																					echo $db_qty;
																					$totqty	=	$totqty + $db_qty;
																					
																					?></td>
                                      <td class="ps-product__subtotal"><?php
																					echo number_format($totprc,2,".",",");
																				$totlprc = ($totlprc+$totprc);
																					$prodprcwgst += $prodprcwqty; 
																					?></td>
                                    </tr>
                                    <?php } } ?>
                                  </tbody>
                                </table>
                              </div>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>

              <div class="p-4 mb-4">
                <div class="ps-wishlist">
                  <div class="container">
                    <div class="row justify-content-center">
                      <div class="col-lg-6 col-md-6 col-12">
                        <div class="add-holder22 bg-white text-center ">

                          <div class="mt-3">
                            <p class="mb-0"><strong>Total <?php echo $totqty;?> Item(s) :
                              </strong><?php echo number_format($prodprcwgst,2,'.',',');?></p>
                            <!-- <p class="mb-0"><strong>Total Tax: </strong><?php echo number_format($tottax,2,'.',','); ?>
                            </p> -->
                            <?php
																$cupid  = $order_dtl['crtordm_cpnm_id'];
																$cupnm  = $order_dtl['cpnm_name'];
																if($cupid!=0)
																{
																	
																	$cupval  = $order_dtl['crtordm_cpnm_val'];
																	$totlprc -= $cupval;
																	echo "<b>Coupon(Applied)$cupnm : -$cupval </b>";
																}
																?>
                            <?php 
															$db_shpprc = $order_dtl['crtordm_shpchrgamt'];
																if($db_shpprc != ''){
																?>
                            <p class="mb-0"><strong>Total Shipping Charges: </strong>
                              <?php
																if($totlprc != 0)
																{
																	$totlprc +=  $db_shpprc;
																	echo $db_shpprc;
																}
																else
																{
																	$shpprc = 0;
																	$totlprc +=  $db_shpprc;
																	echo  $db_shpprc;
																}
															
																?>
                            </p>
                            <?php } ?>
                            <p class="mb-0"><u><strong>Total Amount:
                                </strong><?php echo number_format($totlprc,2,'.',',') ?></u></p>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <a href="<?php echo $rtpth; ?>order-list" class="ps-btn ps-btn--primary clr-btn">Back</a>
            </div>
          </div>
        </div>
      </div>
    </section>
  </div>
</div>
</div>
<?php include_once('footer.php'); ?>