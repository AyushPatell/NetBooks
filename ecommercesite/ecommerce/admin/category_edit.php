<?php
	include 'includes/session.php';

	if(isset($_POST['edit'])){
		$id = $_POST['catid'];
		$name = $_POST['name'];

		try{
			$stmt = $conn->prepare("UPDATE category_master SET cat_name=:name WHERE cat_id=:catid");
			$stmt->execute(['name'=>$name, 'catid'=>$id]);
			$_SESSION['success'] = 'Category updated successfully';
		}
		catch(PDOException $e){
			$_SESSION['error'] = $e->getMessage();
		}
		
		$pdo->close();
	}
	else{
		$_SESSION['error'] = 'Fill up edit category form first';
	}

	header('location: category.php');

?>