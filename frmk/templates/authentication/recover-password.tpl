	{include file = 'common/header.tpl'}
</head>
<body>
	{include file = 'common/navbar.tpl'}

	<div class="row">
		<div class="small-12 medium-8 large-6 small-centered columns">
			<div class="panel">
				<form action="{$BASE_URL}/../../actions/authentication/recover-password.php" method="post" enctype="multipart/form-data" autocomplete="off">
					<h2>Password recovery</h2>
					<p>Choose a new password for your account.</p>

					<p>TEMP - request id debug: <b>{$recoveryRequestId}</b></p>

                    <input type="hidden" name="code" value="{$recoveryRequestId}">

					<div class="row">
						<div class="small-12 columns">
							<label>New password
								<input type="password" name="password" placeholder="New password"/>
							</label>
						</div>
					</div>

					<div class="row">
						<div class="small-12 columns">
							<label>Confirm password
								<input type="password" name="passwordConfirm" placeholder="Confirm password"/>
							</label>
						</div>
					</div>

					<div class="row">
						<div class="small-12 columns">
							<button type="submit" class="button large expand">Change password</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>

	{include file = 'common/footer.tpl'}
