<?php
	include 'includes/session.php';

	$id = $_POST['id'];

	$conn = $pdo->open();

	$output = array('list'=>'');

	$stmt = $conn->prepare("SELECT * FROM order_master LEFT JOIN book_master ON book_id=book_id LEFT JOIN order_master ON order_id=order_id WHERE order_id=:id");
	$stmt->execute(['id'=>$id]);

	$total = 0;
	foreach($stmt as $row){
		$output['transaction'] = $row['pay_id'];
		$output['date'] = date('M d, Y', strtotime($row['order_date']));
		$subtotal = $row['order_price']*$row['order_quantity'];
		$total += $subtotal;
		$output['list'] .= "
			<tr class='prepend_items'>
				<td>".$row['name']."</td>
				<td>&#36; ".number_format($row['order_price'], 2)."</td>
				<td>".$row['quantity']."</td>
				<td>&#36; ".number_format($subtotal, 2)."</td>
			</tr>
		";
	}
	
	$output['total'] = '<b>&#36; '.number_format($total, 2).'<b>';
	$pdo->close();
	echo json_encode($output);

?>