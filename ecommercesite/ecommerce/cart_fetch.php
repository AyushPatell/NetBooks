<?php
	include 'includes/session.php';
	$conn = $pdo->open();

	$output = array('list'=>'','count'=>0);

	if(isset($_SESSION['user'])){
		try{
			$stmt = $conn->prepare("SELECT *, cat_name FROM book_master bm LEFT JOIN cart_master cm ON bm.book_id=cm.book_id LEFT JOIN category_master cam ON cam.cat_id=bm.cat_id WHERE cm.user_id=:user_id");
			$stmt->execute(['user_id'=>$_SESSION['user']]);
			foreach($stmt as $row){ 	
				$output['count']++;
				$image = (!empty($row['image_path'])) ? 'images/'.$row['image_path'] : 'images/noimage.jpg';
				$productname = (strlen($row['book_name']) > 30) ? substr_replace($row['book_name'], '...', 27) : $row['book_name'];
				$output['list'] .= "
					<li>
						<a href='product.php?product=".$row['cat_id']."'>
							<div class='pull-left'>
								<img src='".$image."' class='thumbnail' alt='User Image'>
							</div>
							<h4>
		                        <b>".$row['cat_id']."</b>
		                        <small>&times; ".$row['order_quantity']."</small>
		                    </h4>
		                    <p>".$productname."</p>
						</a>
					</li>
				";
			}
		}
		catch(PDOException $e){
			$output['message'] = $e->getMessage();
		}
	}
	else{
		if(!isset($_SESSION['cart'])){
			$_SESSION['cart'] = array();
		}

		if(empty($_SESSION['cart'])){
			$output['count'] = 0;
		}
		else{
			foreach($_SESSION['cart'] as $row){
				$output['count']++;
				$stmt = $conn->prepare("SELECT *, book_id, cat_name FROM book_master bm LEFT JOIN category_master cm on bm.cat_id=cm.cat_id WHERE bm.book_id=:id");
				$stmt->execute(['id'=>$row['book_id']]);
				$product = $stmt->fetch();
				$image = (!empty($product['image_path'])) ? 'images/'.$product['image_path'] : 'images/noimage.jpg';
				$output['list'] .= "
					<li>
						<a href='product.php?product=".$product['book_name']."'>
							<div class='pull-left'>
								<img src='".$image."' class='img-circle' alt='User Image'>
							</div>
							<h4>
		                        <b>".$product['cat_name']."</b>
		                        <small>&times; ".$row['order_quantity']."</small>
		                    </h4>
		                    <p>".$product['book_name']."</p>
						</a>
					</li>
				";
				
			}
		}
	}

	$pdo->close();
	echo json_encode($output);

?>

