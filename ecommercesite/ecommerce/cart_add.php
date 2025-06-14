<?php
	include 'includes/session.php';

	$conn = $pdo->open();

	$output = array('error'=>false);

	$id = $_POST['book_id'];
	$quantity = $_POST['order_quantity'];

	if(isset($_SESSION['user'])){
		$stmt = $conn->prepare("SELECT *, COUNT(*) AS numrows FROM cart_master WHERE user_id=:user_id AND book_id=:product_id");
		$stmt->execute(['user_id'=>$user['id'], 'product_id'=>$id]);
		$row = $stmt->fetch();

		/*echo "<pre>";
		var_dump($row);
		echo "</pre>";
		exit();*/

		if($row['numrows'] < 1){
			try{
				$stmt = $conn->prepare("INSERT INTO cart_master (user_id, book_id, order_quantity) VALUES (:user_id, :product_id, :quantity)");
				$stmt->execute(['user_id'=>$_SESSION['user'], 'product_id'=>$id, 'quantity'=>$quantity]);
				$output['message'] = 'Item added to cart';
				
			}
			catch(PDOException $e){
				$output['error'] = true;
				$output['message'] = $e->getMessage();
			}
		}
		else{
			$output['error'] = true;
			$output['message'] = 'Product already in cart';
		}
	}
	else{

		/*echo "<pre>NOT SET";
		//var_dump($row);
		echo "</pre>";
		exit();*/

		if(!isset($_SESSION['cart'])){
			$_SESSION['cart'] = array();
		}

		$exist = array();

		foreach($_SESSION['cart'] as $row){
			array_push($exist, $row['book_id']);
		}

		if(in_array($id, $exist)){
			$output['error'] = true;
			$output['message'] = 'Product already in cart';
		}
		else{
			
			$data['book_id'] = $id;
			$data['order_quantity'] = $quantity;

			if(array_push($_SESSION['cart'], $data)){
				$output['message'] = 'Item added to cart';
			}
			else{
				$output['error'] = true;
				$output['message'] = 'Cannot add item to cart';
			}
		}

	}

	$pdo->close();
	echo json_encode($output);

?>