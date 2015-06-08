	{include file = 'common/header.tpl'}

	<style>
		li {
			list-style-type: none;
		}
	</style>
</head>
<body>
	{include file = 'admin/admin-navbar.tpl'}

	<div class="row">
		<div class="small-12 columns">
			<h1>Users</h1>
		</div>
	</div>

	<div class="row">
		<div class="small-12 columns">
			<table>
				<thead>
					<tr>
						<th class="small-1 text-center">ID</th>
						<th class="small-1 text-center">Username</th>
						<th class="small-1 text-center">Name</th>
						<th class="small-9 text-center">Actions</th>
					</tr>
				</thead>
				<tbody>
					<ul class="custom-list-class">
						{foreach $users as $user}
						<li>
							<tr>
								<td class="text-center">{$user->id}</td>

								<td class="text-center">{$user->username}</td>

								<td class="text-center">{$user->firstName} {$user->lastName}</td>

								<td>
									<ul class="button-group even-5">
										<li>
											<a href="{$BASE_URL}/../../pages/admin/admin-questions.php?user={$user->username}" class="button small">Questions</a>
										</li>
										<li>
											<a href="{$BASE_URL}/../../pages/admin/admin-answers.php?user={$user->username}" class="button small">Answers</a>
										</li>
										<li>
											<a href="{$BASE_URL}/../../pages/admin/admin-comments.php?user={$user->username}" class="button small">Comments</a>
										</li>
										<li>
											<a href="{$BASE_URL}/../../pages/admin/admin-user.php?user={$user->username}" class="button small">Details</a>
										</li>
										<li>
											<a href="{$BASE_URL}/../../pages/admin/admin-user-delete.php?user={$user->username}" class="button small">Delete</a>
										</li>
									</ul>
								</td>
							</tr>
						</li>
						{/foreach}
					</ul>
				</tbody>
			</table>
		</div>
	</div>

	{include file = 'common/footer.tpl'}
