<?php
	include 'includes/session.php';
	//include 'debug.php';

	$conn = $pdo->open();

	$output = '';

	//op($_SESSION);

	if(isset($_SESSION['user'])){

		if(isset($_SESSION['cart'])){

			//op($_SESSION);

			foreach($_SESSION['cart'] as $row){
				$stmt = $conn->prepare("SELECT *, COUNT(*) AS numrows FROM cart_master WHERE user_id AND book_id");
				$stmt->execute(['user_id'=>$_SESSION['user_id'], 'book_id'=>$row['book_id']]);
				$row = $stmt->fetch();
				if($row['numrows'] < 1){
					$stmt = $conn->prepare("INSERT INTO cart_master	 (user_id, book_id, order_quantity) VALUES (:user_id, :book_id, :quantity)");
					$stmt->execute(['user_id'=>$_SESSION['user_id'], 'book_id'=>$row['book_id'], 'quantity'=>$row['quantity']]);
				}
				else{
					$stmt = $conn->prepare("UPDATE cart_master SET order_quantity=:order_quantity WHERE user_id=:user_id AND book_id=:book_id");
					$stmt->execute(['order_quantity'=>$row['order_quantity'], 'user_id'=>$_SESSION['user'], 'book_id'=>$row['book_id']]);
				}
			}
			unset($_SESSION['cart']);
		}	

		try{
			$total = 0;
			$stmt = $conn->prepare("SELECT *, cart_id FROM cart_master cm LEFT JOIN book_master	bm ON bm.book_id=cm.book_id WHERE user_id=:user");
			$stmt->execute(['user'=>$_SESSION['user']]);
			//echo($stmt);
			foreach($stmt as $row){
				$image = (!empty($row['image_path'])) ? 'images/'.$row['image_path'] : 'images/noimage.jpg';
				$subtotal = $row['book_price']*$row['order_quantity'];
				$total += $subtotal;
				$output .= "
					<tr>
						<td><button type='button' data-id='".$row['cart_id']."' class='btn btn-danger btn-flat cart_delete'><i class='fa fa-remove'></i></button></td>
						<td><img src='".$image."' width='30px' height='30px'></td>
						<td>".$row['book_name']."</td>
						<td>&#8377; ".number_format($row['book_price'], 2)."</td>
						<td class='input-group'>
							<span class='input-group-btn'>
            					<button type='button' id='minus' class='btn btn-default btn-flat minus' data-id='".$row['cart_id']."'><i class='fa fa-minus'></i></button>
            				</span>
            				<input type='text' class='form-control' value='".$row['order_quantity']."' id='qty_".$row['cart_id']."'>
				            <span class='input-group-btn'>
				                <button type='button' id='add' class='btn btn-default btn-flat add' data-id='".$row['cart_id']."'><i class='fa fa-plus'></i>
				                </button>
				            </span>
						</td>
						<td>&#8377; ".number_format($subtotal, 2)."</td>
					</tr>
				";
			}
			$output .= "
				<tr>
					<td colspan='5' align='right'><b>Total</b></td>
					<td><b>&#8377; ".number_format($total, 2)."</b></td>
				<tr>
			";

		}
		catch(PDOException $e){
			$output .= $e->getMessage();
		}

	}
	else{
		if(count($_SESSION['cart']) != 0){
			$total = 0;
			foreach($_SESSION['cart'] as $row){
				$stmt = $conn->prepare("SELECT *, book_name AS bookname, cat_name AS catname FROM book_master LEFT JOIN category_master  ON cat_id=cat_id WHERE book_id=:book_id");


				$stmt->execute(['book_id'=>$row['book_id']]);
				$product = $stmt->fetch();
				$image = (!empty($product['photo'])) ? 'images/'.$product['photo'] : 'images/noimage.jpg';
				$subtotal = $product['order_price']*$row['order_quantity'];
				$total += $subtotal;
				$output .= "
					<tr>
						<td><button type='button' data-id='".$row['book_id']."' class='btn btn-danger btn-flat cart_delete'><i class='fa fa-remove'></i></button></td>
						<td><img src='".$image."' width='30px' height='30px'></td>
						<td>".$product['name']."</td>
						<td>&#36; ".number_format($product['price'], 2)."</td>
						<td class='input-group'>
							<span class='input-group-btn'>
            					<button type='button' id='minus' class='btn btn-default btn-flat minus' data-id='".$row['book_id']."'><i class='fa fa-minus'></i></button>
            				</span>
            				<input type='text' class='form-control' value='".$row['order_quantity']."' id='qty_".$row['book_id']."'>
				            <span class='input-group-btn'>
				                <button type='button' id='add' class='btn btn-default btn-flat add' data-id='".$row['book_id']."'><i class='fa fa-plus'></i>
				                </button>
				            </span>
						</td>
						<td>&#36; ".number_format($subtotal, 2)."</td>
					</tr>
				";
				
			}

			$output .= "
				<tr>
					<td colspan='5' align='right'><b>Total</b></td>
					<td><b>&#36; ".number_format($total, 2)."</b></td>
				<tr>
			";
		}

		else{
			$output .= "
				<tr>
					<td colspan='6' align='center'>Shopping cart empty</td>
				<tr>
			";
		}
		
	}

	$pdo->close();
	echo json_encode($output);

?>