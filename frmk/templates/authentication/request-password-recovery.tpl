	{include file = 'common/header.tpl'}
</head>
<body>
	{include file = 'common/navbar.tpl'}

	<div class="row">
		<!-- sign up panel -->
		<div class="small-12 medium-8 large-6 small-centered columns">
			<div class="panel">
				<form action="{$BASE_URL}/actions/authentication/request-password-recovery.php" method="post" enctype="multipart/form-data">
					<h2 class="sign-up">Password recovery</h2>
					<p>Enter your email address to recover your password.</p>
					<div class="row">
						<div class="small-12 columns">
							<label>
								<input name="email" type="text" placeholder="user@gmail.com" />
							</label>
						</div>
					</div>
					<div class="row">
						<div class="small-12 columns">
                            <button type="submit" class="button large expand">Confirm email</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>

	{include file = 'common/footer.tpl'}
