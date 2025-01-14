<?php include 'includes/session.php'; ?>
<?php
	$conn = $pdo->open();

	$slug = $_GET['details'];

	try{
		 		
	    $stmt = $conn->prepare("SELECT *, bm.book_name AS prodname, cm.cat_name AS catname, bm.book_id AS prodid FROM book_master bm LEFT JOIN category_master cm ON cm.cat_id=bm.cat_id WHERE bm.book_id = :slug");
	    $stmt->execute(['slug' => $slug]);
	    $details = $stmt->fetch();
		
	}
	catch(PDOException $e){
		echo "There is some problem in connection: " . $e->getMessage();
	}

	//page view
	/*$now = date('Y-m-d');
	if($details['date_view'] == $now){
		$stmt = $conn->prepare("UPDATE book SET counter=counter+1 WHERE id=:id");
		$stmt->execute(['id'=>$details['prodid']]);
	}
	else{
		$stmt = $conn->prepare("UPDATE detailss SET counter=1, date_view=:now WHERE id=:id");
		$stmt->execute(['id'=>$details['prodid'], 'now'=>$now]);
	}
*/
?>
<?php include 'includes/header.php'; ?>
<body class="hold-transition skin-blue layout-top-nav">

<div class="wrapper">

	<?php include 'includes/navbar.php'; ?>
	 
	  <div class="content-wrapper">
	    <div class="container">

	      <!-- Main content -->
	      <section class="content">
	        <div class="row">
	        	<div class="col-sm-9">
	        		<div class="callout" id="callout" style="display:none">
	        			<button type="button" class="close"><span aria-hidden="true">&times;</span></button>
	        			<span class="message"></span>
	        		</div>
		            <div class="row">
		            	<div class="col-sm-6">
		            		<img src="<?php echo (!empty($details['image_path'])) ? 'images/'.$details['image_path'] : 'images/noimage.jpg'; ?>" width="100%" class="zoom" data-magnify-src="images/large-<?php echo $details['image_path']; ?>">
		            		<br><br>
		            		<form class="form-inline" id="detailsForm">
		            			<div class="form-group">
			            			<div class="input-group col-sm-5">
			            				
			            				<span class="input-group-btn">
			            					<button type="button" id="minus" class="btn btn-default btn-flat btn-lg"><i class="fa fa-minus"></i></button>
			            				</span>
							          	<input type="text" name="order_quantity" id="quantity" class="form-control input-lg" value="1">
							            <span class="input-group-btn">
							                <button type="button" id="add" class="btn btn-default btn-flat btn-lg"><i class="fa fa-plus"></i>
							                </button>
							            </span>
							            <input type="hidden" value="<?php echo $details['book_id']; ?>" name="book_id">
							        </div>
			            			<button type="submit" class="btn btn-primary btn-lg btn-flat"><i class="fa fa-shopping-cart"></i> Add to Cart</button>
			            		</div>
		            		</form>
		            	</div>
		            	<div class="col-sm-6">
		            		<h1 class="page-header"><?php echo $details['book_name']; ?></h1>
		            		<h3><b>&#8377; <?php echo number_format($details['book_price'], 2); ?></b></h3>
		            		<p><b>Category:</b> <a href="category.php?category=<?php echo $details['cat_id']; ?>"><?php echo $details['cat_name']; ?></a></p>
		            		<p><b>Description:</b></p>
		            		<p><?php echo $details['book_description']; ?></p>
		            	</div>
		            </div>
		            <br>
				    <div class="fb-comments" data-href="http://localhost/ecommerce/details.php?details=<?php echo $slug; ?>" data-numposts="10" width="100%"></div> 
	        	</div>
	        	<div class="col-sm-3">
	        		<?php include 'includes/sidebar.php'; ?>
	        	</div>
	        </div>
	      </section>
	     
	    </div>
	  </div>
  	<?php $pdo->close(); ?>
  	<?php include 'includes/footer.php'; ?>
</div>

<?php include 'includes/scripts.php'; ?>
<script>
$(function(){
	$('#add').click(function(e){
		e.preventDefault();
		var quantity = $('#quantity').val();
		if(quantity < 10){
			quantity++;
		}
		$('#quantity').val(quantity);
	});
	$('#minus').click(function(e){
		e.preventDefault();
		var quantity = $('#quantity').val();
		if(quantity > 1){
			quantity--;
		}
		$('#quantity').val(quantity);
	});

});
</script>
</body>
</html>