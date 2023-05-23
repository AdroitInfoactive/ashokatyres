
<script language="javascript" type="text/javascript">
location.href = "../order-list";
</script>
<?php

require('config.php');
require('razorpay-php/Razorpay.php');

session_start();

   global $conn; 
                 
use Razorpay\Api\Api;

$api = new Api($keyId, $keySecret);
if(!empty($_POST['hdntxnid'])){
     
     
     $paymntid = $_POST['hdntxnid'];
     $payamnt = $_POST['hdnamount']; 
	 $l_r = explode('.', $payamnt);
	 	 $payableamt=  $l_r[0];
		 $payableamt=str_replace(',','',$payableamt);
											 	
     $paynm = $_POST['hdnfirstname'];
     $paymnemil = $_POST['hdnemail'];
     $paymphn = $_POST['hdnphone'];
     $payinfo = $_POST['hdnproductinfo'];
     $odrid = $_POST['hdnodrid'];
     $ordcode = $_POST['hdnordcode'];
     
 
 

//
// We create an razorpay order using orders api
// Docs: https://docs.razorpay.com/docs/orders
//
$orderData = [
    'receipt'         => $paymntid,
    'amount'          => $payableamt *100, // 2000 rupees in paise
    'currency'        => 'INR',
    'payment_capture' => 1 // auto capture
];
//print_r($orderData);
$razorpayOrder = $api->order->create($orderData);

$razorpayOrderId = $razorpayOrder['id'];

$_SESSION['razorpay_order_id'] = $razorpayOrderId;

$displayAmount = $amount = $orderData['amount'];

if ($displayCurrency !== 'INR')
{
    $url = "https://api.fixer.io/latest?symbols=$displayCurrency&base=INR";
    $exchange = json_decode(file_get_contents($url), true);

    $displayAmount = $exchange['rates'][$displayCurrency] * $amount / 100;
}

$checkout = 'automatic';

if (isset($_GET['checkout']) and in_array($_GET['checkout'], ['automatic', 'manual'], true))
{
    $checkout = $_GET['checkout'];
}

// "name"              => "Liamsons",
$data = [
    "key"               => $keyId,
    "amount"            => $amount,
    "description"       => "Order ID : ".$ordcode,
    "prefill"           => [
    "name"              => $paynm,
    "email"             => $paymnemil,
    "contact"           => $paymphn,
    ],
    "notes"             => [
    "address"           => $payinfo,
    "merchant_order_id" => $paymntid,
    ],
    
    "order_id"          => $razorpayOrderId,
];
// var_dump($data); exit;
if ($displayCurrency !== 'INR')
{
    $data['display_currency']  = $displayCurrency;
    $data['display_amount']    = $displayAmount;
}

$json = json_encode($data);

require("checkout/manual.php");
}