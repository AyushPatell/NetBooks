<?php
	include 'includes/session.php';

	$output = '';

	$conn = $pdo->open();

	$stmt = $conn->prepare("SELECT * FROM category_master");
	$stmt->execute();

	foreach($stmt as $row){
		$output .= "
			<option value='".$row['cat_id']."' class='append_items'>".$row['cat_name']."</option>
		";
	}

	$pdo->close();
	echo json_encode($output);

?>