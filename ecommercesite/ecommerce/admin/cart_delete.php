<?php
	include 'includes/session.php';

	if(isset($_POST['delete'])){
		$bookid = $_POST['bookid'];
		$cartid = $_POST['cartid'];
		
		$conn = $pdo->open();

		try{
			$stmt = $conn->prepare("DELETE FROM cart_master WHERE book_id=:id");
			$stmt->execute(['id'=>$bookid]);

			$_SESSION['success'] = 'Product deleted from cart';
		}
		catch(PDOException $e){
			$_SESSION['error'] = $e->getMessage();
		}
		
		$pdo->close();

		header('location: cart.php?user='.$userid);
	}

?>