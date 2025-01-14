<?php
	include 'includes/session.php';
	include 'includes/slugify.php';

	if(isset($_POST['edit'])){
		$id = $_POST['book_id'];
		$name = $_POST['book_name'];
		$category = $_POST['category'];
		$price = $_POST['book_price'];
		$description = $_POST['book_description'];

		$conn = $pdo->open();

		try{
			$stmt = $conn->prepare("UPDATE book_master SET book_name=:name, cat_id=:category, book_price=:price, book_description=:description WHERE book_id=:id");
			$stmt->execute(['name'=>$name,'category'=>$category, 'price'=>$price, 'description'=>$description, 'id'=>$id]);
			$_SESSION['success'] = 'Product updated successfully';
		}
		catch(PDOException $e){
			$_SESSION['error'] = $e->getMessage();
		}
		
		$pdo->close();
	}
	else{
		$_SESSION['error'] = 'Fill up edit product form first';
	}

	header('location: products.php');

?>