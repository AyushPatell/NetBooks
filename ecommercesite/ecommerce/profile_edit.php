<?php
	include 'includes/session.php';

	$conn = $pdo->open();

	if(isset($_POST['edit'])){
		//$curr_password = $_POST['curr_password'];
		//$password = $_POST['user_password'];
		$firstname = $_POST['firstname'];
		$lastname = $_POST['lastname'];
		$address = $_POST['address'];
		$contact = $_POST['contact'];
		$email = $_POST['email'];
		$photo = $_FILES['image']['name'];
		//if(password_verify($curr_password, $user['user_password'])){
			/*echo "<pre>";
		var_dump($_POST);
		echo "</pre>";
		exit();*/
			if(!empty($photo)){
				move_uploaded_file($_FILES['user_photo']['tmp_name'], 'images/'.$photo);
				$filename = $photo;	
			}
			else{
				$filename = $user['photo'];
			}

			/*if($password == $user['password']){
				$password = $user['password'];
			}
			else{
				$password = password_hash($password, PASSWORD_DEFAULT);
			}*/

			try{
				$stmt = $conn->prepare("UPDATE user_master SET user_fname=:firstname, user_lname=:lastname, user_address=:address, user_contact=:contact, user_email=:email,image_path=:image WHERE user_id=:user_id");
				$stmt->execute(['user_fname'=>$firstname, 'user_lname'=>$lastname,'user_address'=>$address,'user_contact'=>$contact, 'user_email'=>$email,  'user_photo'=>$filename, 'user_id'=>$user['user_id']]);

				$_SESSION['success'] = 'Account updated successfully';
			}
			catch(PDOException $e){
				$_SESSION['error'] = $e->getMessage();
			}
			
		//}
		//else{
			//$_SESSION['error'] = 'Incorrect password';
		//}
	}
	else{
		$_SESSION['error'] = 'Fill up edit form first';
	}

	$pdo->close();

	header('location: profile.php');

?>