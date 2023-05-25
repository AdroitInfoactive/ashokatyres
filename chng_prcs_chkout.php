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
      Total Cart Value
      <span>₹<?php if ($totcrtprc > 0) {
                echo $totcrtprcwtchrg =  $totcrtprc + $chrgs;
              }else {
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
      <span><strong>₹<?php if ($totcrtprcwtchrg > 0) {
                        echo $totcrtprcwtchrg;
                      } else {
                        echo '0.00';
                      }; ?></strong></span>
    </li>
  </ul>
<?php
} ?>