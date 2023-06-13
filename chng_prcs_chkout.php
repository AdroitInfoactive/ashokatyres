<?php
session_start();
include_once 'includes/inc_config.php';
include_once 'includes/inc_connection.php';
include_once "includes/inc_usr_functions.php";
// include_once $inc_cnctn; //Making database Connection
// include_once $inc_usr_fnctn;
// ------------------------- To get related vehicle brands-------------------
if (isset($_REQUEST['chrgs']) && (trim($_REQUEST['chrgs']) != "") && isset($_REQUEST['totcrtprc']) && (trim($_REQUEST['totcrtprc']) != "")) {
  // creating Drop Down for Vehicle Brand 
  $result = "";
  $chkd = glb_func_chkvl($_REQUEST['chkd']);
  $chrgs = glb_func_chkvl($_REQUEST['chrgs']);
  $totcrtprc = glb_func_chkvl($_REQUEST['totcrtprc']);
  $cpnm_cde = glb_func_chkvl($_REQUEST['cpnid']);
  $cpncunt1 = glb_func_chkvl($_REQUEST['cpncunt']);
 $totcpndiscamt = glb_func_chkvl($_REQUEST['cpndisamt']);
 $cpndis = 'y';
if($totcpndiscamt > 0 && $totcpndiscamt!=''){
 $total_prc= ($totcrtprc+$chrgs)-$totcpndiscamt;
}
else{
  $total_prc= ($totcrtprc+$chrgs);
}

?>

  <ul class="list-group list-group-flush">
    <li class="list-group-item d-flex justify-content-between align-items-center border-0 px-0 pb-0">
      Cart Value
      <span>₹<?php if ($totcrtprc > 0) {
                echo $totcrtprc;
              } else {
                echo '0.00';
              }; ?></span>
    </li>
    <?php
    if($chkd != "fs")
    { ?>
      <li class="list-group-item d-flex justify-content-between align-items-center px-0">
        <?php
        if($chkd == "d")
        {
          echo "Devilery Charges";
        }
        if($chkd == "df")
        {
          echo "Fitting Charges";
        }
        ?>
        <span>₹<?php echo $chrgs; ?></span>
        <input type="hidden" name="chrgs" id="chrgs" value="<?php echo $chrgs; ?>" />
      </li>
      <?php
    }
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
     <?php  if($cpndis == 'n')
        {
          echo "<p style='color:red;'<strong>Coupon Not Applicable</strong></p>";
             } ?>
    <li class="list-group-item d-flex justify-content-between align-items-center px-0">
      Total Cart Value
      <span>₹<?php if ($totcrtprc > 0) {
               // echo $totcrtprcwtchrg =  $totcrtprc + $chrgs;
                echo $total_prc;
              }
              else {
                echo '0.00';
              }; ?></span>
    </li>
    <li class="list-group-item d-flex justify-content-between align-items-center border-0 px-0 mb-3">
      <div>
        <input type="hidden" name="ntTogPrc" id="ntTogPrc" value="<?php echo $totcrtprc; ?>" />
        <strong>The total amount of</strong>
        <strong>
          <p class="mb-0">(including GST)</p>
        </strong>
      </div>
      <span><strong>₹<?php 
              // if ($totcrtprcwtchrg > 0) {
              //          // echo $totcrtprcwtchrg;
              //          echo $total_prc;
              //         } 
              if( $total_prc>0){
                echo $total_prc;
              }
                      else {
                        echo '0.00';
                      }; ?></strong></span>
    </li>
  </ul>
<?php
} ?>