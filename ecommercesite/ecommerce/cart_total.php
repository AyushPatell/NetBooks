<?php
	include 'includes/session.php';

	if(isset($_SESSION['user'])){
		$conn = $pdo->open();

		$stmt = $conn->prepare("SELECT * FROM cart_master cm LEFT JOIN book_master bm on cm.book_id=bm.book_id WHERE user_id=:user_id");
		$stmt->execute(['user_id'=>$_SESSION['user']]);

		$total = 0;
		foreach($stmt as $row){
			$subtotal = $row['book_price'] * $row['order_quantity'];
			$total += $subtotal;
		}

		$pdo->close();

		echo json_encode($total);
	}
?>