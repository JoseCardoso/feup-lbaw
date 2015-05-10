	{include file = 'common/header.tpl'}

	<link rel="stylesheet" href="{$CSS_PATH}askfeup/sign-in.css" />
</head>
<body>
	{include file = 'common/navbar.tpl'}
	
	<div class="row">
		<div class="small-12 medium-6 large-8 columns">
			<div data-alert class="alert-box warning radius">
				<h5 style="color: yellow;">
					<i class="fi-alert"></i>
					This is still under construction!
				</h5>
				<a href="#" class="close">&times;</a>
			</div>

			<!-- orbit -->
			<ul class="orbit" data-orbit data-options="pause_on_hover: false;">
				<li>
					<img src="{$IMAGE_PATH}main-page/feup-garden.jpg" alt="slide 1" />
					<div class="orbit-caption">
						FEUP
					</div>
				</li>
				<li>
					<img src="{$IMAGE_PATH}main-page/feup-biblio.jpg" alt="slide 2" />
				</li>
				<li>
					<img src="{$IMAGE_PATH}main-page/feup-sunset.jpg" alt="slide 3" />
				</li>
			</ul>

			<!-- search box panel -->
			<div class="panel search-box-panel">
				<div class="row">
					<div class="small-10 columns">
						<input type="text" placeholder="Ask something">
					</div>
					<div class="small-2 columns">
						<i class="fi-magnifying-glass"></i>
					</div>
				</div>
			</div>
		</div>

		<!-- log in panel -->
		<div class="small-12 medium-6 large-4 columns">
			<div class="panel">
				<p>Log in via</p>
				<ul class="button-group even-2">
					<li><a href="#" class="button facebook-button">Facebook</a></li>
					<li><a href="#" class="button google-plus-button">Google+</a></li>
				</ul>

				<p class="right"><a href="{$BASE_URL}/../../pages/authentication/request-password-recovery.php">Forgot password?</a></p>
				<p>Log in</p>
				<form id="sign-in" action="{$BASE_URL}/../../actions/authentication/sign-in.php" method="post" enctype="multipart/form-data">
					<input type="text" name="username"  placeholder="Username or Email" />
					<input type="password" name="password"  placeholder="Password" />
					<input id="remember-me-checkbox" type="checkbox"><label for="remember-me-checkbox">Remember me</label>
				

				<!-- log in button -->
					<div class="row">
						<div class="small-12 columns">
							<button type="submit" class="button large expand">Log in</button>
						</div>
					</div>
				</form>	

				<p class="text-center"><a href="{$BASE_URL}/../../pages/authentication/sign-up.php">Create an account</a></p>
			</div>
		</div>
	</div>

	{include file = 'common/footer.tpl'}
