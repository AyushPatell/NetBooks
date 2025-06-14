<?php
	include 'includes/session.php';
	$conn = $pdo->open();

	if(isset($_POST['login'])){
			$email = $_POST['email'];
			$password = $_POST['password'];
			try{

				$stmt = $conn->prepare("SELECT *, COUNT(*) AS numrows FROM user_master WHERE user_email = :email");
				$stmt->execute(['email'=>$email]);
				$row = $stmt->fetch();

				/*echo "<pre>";
				var_dump($row);
				exit();
				echo "</pre>";*/

				if($row['numrows'] > 0){
					if($row['user_isactive']){
						if($password==$row['user_password']){
							if($row['user_type']==0){
								$_SESSION['admin'] = $row['user_id'];
							}
							else{
								$_SESSION['user'] = $row['user_id'];
							}
							//header('location: profile.php');
						}
						else{
							$_SESSION['error'] = 'Incorrect Password';
						}
					}
					else{
						$_SESSION['error'] = 'Account not activated.';
					}
				}
				else{
					$_SESSION['error'] = 'Email not found';
				}
			}
			catch(PDOException $e){
				echo "There is some problem in connection: " . $e->getMessage();
			}
	}
	else{
		$_SESSION['error'] = 'Input login credentails first';
	}

	$pdo->close();

	header('location: login.php');

?>