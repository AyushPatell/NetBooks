<?php
	include 'includes/session.php';

	if(isset($_POST['add'])){
		$id = $_POST['id'];
		$product = $_POST['product'];
		$quantity = $_POST['quantity'];

		$conn = $pdo->open();

		$stmt = $conn->prepare("SELECT *, COUNT(*) AS numrows FROM cart_master WHERE book_id=:id");
		$stmt->execute(['id'=>$product]);
		$row = $stmt->fetch();

		if($row['numrows'] > 0){
			$_SESSION['error'] = 'Product exist in cart';
		}
		else{
			try{
				$stmt = $conn->prepare("INSERT INTO cart_master (user_id, book_id, quantity) VALUES (:user, :product, :quantity)");
				$stmt->execute(['user'=>$id, 'product'=>$product, 'quantity'=>$quantity]);

				$_SESSION['success'] = 'Product added to cart';
			}
			catch(PDOException $e){
				$_SESSION['error'] = $e->getMessage();
			}
		}

		$pdo->close();

		header('location: cart.php?user='.$id);
	}

?>