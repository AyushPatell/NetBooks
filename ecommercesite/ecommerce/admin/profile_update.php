<?php
	include 'includes/session.php';

	if(isset($_GET['return'])){
		$return = $_GET['return'];
		
	}
	else{
		$return = 'home.php';
	}

	if(isset($_POST['save'])){
		//$curr_password = $_POST['curr_password'];
		$email = $_POST['user_email'];
		//$password = $_POST['password'];
		$firstname = $_POST['user_fname'];
		$lastname = $_POST['user_lname'];
		$photo = $_FILES['user_photo']['user_name'];
		//if(password_verify($curr_password, $admin['password'])){
			if(!empty($photo)){
				move_uploaded_file($_FILES['user_photo']['tmp_name'], '../images/'.$photo);
				$filename = $photo;	
			}
			else{
				$filename = $admin['user_photo'];
			}

			/*if($password == $admin['password']){
				$password = $admin['password'];
			}
			else{
				$password = password_hash($password, PASSWORD_DEFAULT);
			}*/
			echo "<pre>";
				var_dump($_POST);
			echo "</pre>";
			exit();
			$conn = $pdo->open();

			try{
				$stmt = $conn->prepare("UPDATE user_master SET user_email=:email, user_fname=:firstname, user_lname=:lastname, user_photo=:photo WHERE user_id=:id");
				$stmt->execute(['email'=>$email,  'firstname'=>$firstname, 'lastname'=>$lastname, 'photo'=>$filename, 'id'=>$admin['id']]);

				$_SESSION['success'] = 'Account updated successfully';
			}
			catch(PDOException $e){
				$_SESSION['error'] = $e->getMessage();
			}

			$pdo->close();
			
		}
		/*//else{
		//	$_SESSION['error'] = 'Incorrect password';
		//}*/
	
	else{
		$_SESSION['error'] = 'Fill up required details first';
	}

	header('location:'.$return);

?>