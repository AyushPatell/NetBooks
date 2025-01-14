<?php
	include 'includes/session.php';

	if(isset($_POST['activate'])){
		$id = $_POST['id'];
		
		$conn = $pdo->open();

		try{
			$stmt = $conn->prepare("UPDATE user_master SET user_isactive=:status WHERE user_id=:id");
			$stmt->execute(['user_isactive'=>1, 'user_id'=>$id]);
			$_SESSION['success'] = 'User activated successfully';
		}
		catch(PDOException $e){
			$_SESSION['error'] = $e->getMessage();
		}

		$pdo->close();

	}
	else{
		$_SESSION['error'] = 'Select user to activate first';
	}

	header('location: users.php');
?>