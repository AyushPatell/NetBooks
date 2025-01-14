<?php 
	include 'includes/session.php';

	if(isset($_POST['id'])){
		$id = $_POST['cartid'];
		
		$conn = $pdo->open();

		$stmt = $conn->prepare("SELECT *, cart_id AS cartid FROM cart_master LEFT JOIN book_master ON book_id=book_id WHERE cart_id=:cartid");
		$stmt->execute(['cartid'=>$id]);
		$row = $stmt->fetch();
		
		$pdo->close();

		echo json_encode($row);
	}
?>