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
			<h1>{$user->firstName} {$user->lastName}</h1>
		</div>
	</div>

	<div class="row">
		<div class="small-5 small-centered columns">
			<table class="small-12">
				<caption>User information</caption>
				<tbody>
					<tr>
						<th class="small-4 text-right">ID</th>
						<td class="small-8">{$user->id}</td>
					</tr>
					<tr>
						<th class="text-right">Username</th>
						<td>{$user->username}</td>
					</tr>
					<tr>
						<th class="text-right">Email</th>
						<td>{$user->email}</td>
					</tr>
					<tr>
						<th class="text-right">Name</th>
						<td>{$user->firstName} {$user->lastName}</td>
					</tr>
					<tr>
						<th class="text-right">Register date</th>
						<td>{$user->register_at}</td>
					</tr>
					<tr>
						<th class="text-right">Last Login</th>
						<td>{$user->lastLogin_at}</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>

	<div class="row">
		<div class="small-8 small-centered columns">
			<ul class="button-group even-4">
				<li>
					<a href="{$BASE_URL}/../../pages/admin/admin-questions.php?user={$user->username}" class="button">Questions</a>
				</li>
				<li>
					<a href="{$BASE_URL}/../../pages/admin/admin-answers.php?user={$user->username}" class="button">Answers</a>
				</li>
				<li>
					<a href="{$BASE_URL}/../../pages/admin/admin-comments.php?user={$user->username}" class="button">Comments</a>
				</li>
				<li>
					<a href="{$BASE_URL}/../../pages/admin/admin-user-delete.php?user={$user->username}" class="button">Delete</a>
				</li>
			</ul>
		</div>
	</div>

	{include file = 'common/footer.tpl'}
