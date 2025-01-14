<?php include 'includes/session.php'; ?>
<?php include 'includes/header.php'; ?>
<!DOCTYPE html>
<html>
<body class="hold-transition skin-blue layout-top-nav">
<div class="wrapper" style="color: white">

	 <?php include 'includes/navbar.php'; ?>
	 
	  <div class="content-wrapper">
	    <div class="container">

	      <!-- Main content -->
	      <section class="content">
	        <div class="row">
	        	<div class="col-sm-9">
	        		<?php
	        			if(isset($_SESSION['error'])){
	        				echo "
	        					<div class='alert alert-danger'>
	        						".$_SESSION['error']."
	        					</div>
	        				";
	        				unset($_SESSION['error']);
	        			}
	        		?>

	        		<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
		                <ol class="carousel-indicators">
		                  <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
		                  <li data-target="#carousel-example-generic" data-slide-to="1" class=""></li>
		                  <li data-target="#carousel-example-generic" data-slide-to="2" class=""></li>
		                </ol>
		                <div class="carousel-inner">
		                  <div class="item active">
		                    <img src="images/banner4.jpg" alt="First slide">
		                  </div>
		                  <div class="item">
		                    <img src="images/banner5.jpg" alt="Second slide">
		                  </div>
		                  <div class="item">
		                    <img src="images/banner7.jpg" alt="Third slide">
		                  </div>
		                </div>
		                <a class="left carousel-control" href="#carousel-example-generic" data-slide="prev">
		                  <span class="fa fa-angle-left"></span>
		                </a>
		                <a class="right carousel-control" href="#carousel-example-generic" data-slide="next">
		                  <span class="fa fa-angle-right"></span>
		                </a>
		            </div>
		       
		            

		            <div class="">
		            	<?php

							$stmt = $conn->prepare("SELECT * FROM book_master");
							$stmt->execute();

							foreach ($stmt as $row) {
								echo '<div class="col-md-4">
									<h4 style="color: black">'.$row["book_name"].'</h4>
									<img src="images/'.$row["image_path"].'" alt="Books" id="images">
									<p class="list-price text-danger">List price: &#8377;<s>'.$row["book_price"].'.</s></p>
									<p class="price" style="color: black">Our price: &#8377;'.$row["book_price"].'.</p>
									<a href="details.php"><button type="button" class="btn btn-success" data-toggle="modal" data-target="#details-1">Details
								</button></a>		
								</div>';
							}
		            	?>


		                <!--<div class="tab__container mt--60">-->
					<!-- Start Single Tab Content 
					<div class="row single__tab tab-pane fade show active" id="nav-all" role="tabpanel">
						<div class="product__indicator--4 arrows_style owl-carousel owl-theme">
							<div class="single__product">-->
								<!-- Start Single Product >
								<div class="col-lg-3 col-md-4 col-sm-6 col-12">
									<div class="product product__style--3">
										<div class="product__thumb">-->

							<?php

							/*$stmt = $conn->prepare("SELECT * FROM book_master");
							$stmt->execute();

							foreach ($stmt as $row) {
								echo '<div class="col-md-4">
									<h4 style="color: black">'.$row["book_name"].'</h4>
									<img src="images/'.$row["image_path"].'" alt="Books" id="images">
									<p class="list-price text-danger">List price: <s>'.$row["book_price"].'RS.</s></p>
									<p class="price" style="color: black">Our price: '.$row["book_price"].'RS.</p>
									<button href="" type="button" class="btn btn-success" data-toggle="modal" data-target="#details-1">Details
									</button>		
								</div>';
							}*/
		            	?>
						<!--<div class="col-md-4">
							<h4 style="color: black">Web Design</h4>
							<img src="images/books1.jpg" alt="Watch" id="images">
							<p class="list-price text-danger">List price: <s>100RS.</s></p>
							<p class="price" style="color: black">Our price: 80RS.</p>
							<button type="button" class="btn btn-success" data-toggle="modal" data-target="#details-2">Details
							</button>		
						</div>

						<div class="col-md-4">
							<h4 style="color: black">Electrical Machines</h4>
							<img src="images/books2.png" alt="Polo Shirts" id="images">
							<p class="list-price text-danger">List price: <s>100RS.</s></p>
							<p class="price" style="color: black">Our price: 80RS.</p>
							<button type="button" class="btn btn-success" data-toggle="modal" data-target="#details-3">Details
							</button>		
						</div>

						<div class="col-md-4">
							<h4 style="color: black">Study Guide</h4>
							<img src="images/books3.png" alt="Nike joggers" id="images">
							<p class="list-price text-danger">List price: <s>100RS.</s></p>
							<p class="price" style="color: black">Our price: 80RS.</p>
							<button type="button" class="btn btn-success" data-toggle="modal" data-target="#details-4">Details
							</button>		
						</div>

						<div class="col-md-4">
							<h4 style="color: black">Bussiness Management</h4>
							<img src="images/books4.png" alt="Nike joggers" id="images">
							<p class="list-price text-danger">List price: <s>100RS.</s></p>
							<p class="price" style="color: black">Our price: 80RS.</p>
							<button type="button" class="btn btn-success" data-toggle="modal" data-target="#details-4">Details
							</button>		
						</div>

						<div class="col-md-4">
							<h4 style="color: black">Subject Test Biology</h4>
							<img src="images/book5.jpg" alt="Nike joggers" id="images">
							<p class="list-price text-danger">List price: <s>100RS.</s></p>
							<p class="price" style="color: black">Our price: 80RS.</p>
							<button type="button" class="btn btn-success" data-toggle="modal" data-target="#details-4">Details
							</button>		
						</div>

						<div class="col-md-4">
							<h4 style="color: black">MCAT</h4>
							<img src="images/books6.png" alt="Nike joggers" id="images">
							<p class="list-price text-danger">List price: <s>100RS.</s></p>
							<p class="price" style="color: black">Our price: 80RS.</p>
							<button type="button" class="btn btn-success" data-toggle="modal" data-target="#details-4">Details
							</button>		
						</div>

						<div class="col-md-4">
							<h4 style="color: black">SAT</h4>
							<img src="images/books7.jpg" alt="Nike joggers" id="images">
							<p class="list-price text-danger">List price: <s>100RS.</s></p>
							<p class="price" style="color: black">Our price: 80RS.</p>
							<button type="button" class="btn btn-success" data-toggle="modal" data-target="#details-4">Details
							</button>		
						</div>-->
		            </div>

		            <footer id="wn__footer" class="footer__area bg__cat--8 brown--color">
		            	<div class="container">
		            		<div class="row">
		            			<div class="col-lg-12">
		            				<div class="footer__widget">
		            
		            				</div>
		            			</div>
		            		</div>	
		            	</div>
		            </footer>
		            <!--<h2>Monthly Top Sellers</h2>-->
		       		<?php
		       			/*$month = date('m');
		       			$conn = $pdo->open();

		       			try{
		       			 	$inc = 3;	
						    $stmt = $conn->prepare("SELECT *, SUM(quantity) AS total_qty FROM details LEFT JOIN sales ON sales.id=details.sales_id LEFT JOIN products ON products.id=details.product_id WHERE MONTH(sales_date) = '$month' GROUP BY details.product_id ORDER BY total_qty DESC LIMIT 6");
						    $stmt->execute();
						    foreach ($stmt as $row) {
						    	$image = (!empty($row['photo'])) ? 'images/'.$row['photo'] : 'images/noimage.jpg';
						    	$inc = ($inc == 3) ? 1 : $inc + 1;
	       						if($inc == 1) echo "<div class='row'>";
	       						echo "
	       							<div class='col-sm-4'>
	       								<div class='box box-solid'>
		       								<div class='box-body prod-body'>
		       									<img src='".$image."' width='100%' height='230px' class='thumbnail'>
		       									<h5><a href='product.php?product=".$row['slug']."'>".$row['name']."</a></h5>
		       								</div>
		       								<div class='box-footer'>
		       									<b>&#36; ".number_format($row['price'], 2)."</b>
		       								</div>
	       								</div>
	       							</div>
	       						";
	       						if($inc == 3) echo "</div>";
						    }
						    if($inc == 1) echo "<div class='col-sm-4'></div><div class='col-sm-4'></div></div>"; 
							if($inc == 2) echo "<div class='col-sm-4'></div></div>";
						}
						catch(PDOException $e){
							echo "There is some problem in connection: " . $e->getMessage();
						}

						$pdo->close();*/

		       		?> 
	        	</div>
	        	<div class="col-sm-3">
	        		<?php include 'includes/sidebar.php'; ?>
	        	</div>
	        </div>
	      </section>
	     
	    </div>
	  </div>
  	<?php include 'includes/footer.php'; ?>
</div>

<?php include 'includes/scripts.php'; ?>
</body>
</html>