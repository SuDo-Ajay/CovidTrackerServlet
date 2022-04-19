<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
		<link rel="preconnect" href="https://fonts.gstatic.com">
    	<link href="https://fonts.googleapis.com/css2?family=Josefin+Sans:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;1,100;1,200;1,300;1,400;1,500;1,600;1,700&display=swap" rel="stylesheet">
        <link rel = "stylesheet" href="./styles.css"/>
    </head>
	<body>
		<div class = "Header">
			<p>Covid Case Tracker - India</p>
			<div class="Header-Right">
				<a class="Active" href="./register.html">Account</a>
				<a class="Active" href="./index.html">Tracker</a>
			</div>
		</div>
		<div class="Logo-Circle">
			<div class="Logo">
				<img width=60 src="test-tube.png" usemap="#image-map" />
			</div>
		</div>
		<div class="Main-Text">
			<h2>Covid Tracker - India<br></h2>
			<h3>Search a state to track its case count and other information</h3>
			<h3>Enter a valid State Name</h3>
		</div>
	<main>
	<section class = "glass">
		<div class = "logo">
			<form name="Search" action=TrackerServlet method="POST">
				<label for="state-name">State Name</label>
				<input type="text" name="statename" value="" />
				<input type="submit" value="Search" name="statesearch" />
			</form>
		</div>
	</section>
	</main>
	<div class = "circle1"></div>
	<div class = "circle2"></div>
    </body>
</html>
