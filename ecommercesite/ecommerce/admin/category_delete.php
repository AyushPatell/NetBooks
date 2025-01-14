<?php
	include 'includes/session.php';

	if(isset($_POST['delete'])){
		$id = $_POST['catid'];
		
		$conn = $pdo->open();

		try{
			$stmt = $conn->prepare("DELETE FROM category_master WHERE cat_id=:catid");
			$stmt->execute(['catid'=>$id]);

			$_SESSION['success'] = 'Category deleted successfully';
		}
		catch(PDOException $e){
			$_SESSION['error'] = $e->getMessage();
		}

		$pdo->close();
	}
	else{
		$_SESSION['error'] = 'Select category to delete first';
	}

	header('location: category.php');
	
?>