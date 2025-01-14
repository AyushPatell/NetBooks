<?php
	include 'includes/session.php';

	$output = '';

	$conn = $pdo->open();

	$stmt = $conn->prepare("SELECT * FROM book_master");
	$stmt->execute();
	foreach($stmt as $row){
		$output .= "
			<option value='".$row['book_id']."' class='append_items'>".$row['book_name']."</option>
		";
	}

	$pdo->close();
	echo json_encode($output);

?>