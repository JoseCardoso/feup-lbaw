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
			<h1>Comments</h1>
		</div>
	</div>

	<div class="row">
		<div class="small-12 columns">
			<table>
				<thead>
					<tr>
						<th class="small-1 text-center">ID</th>
						<th class="small-6 text-center">Description</th>
						<th class="small-1 text-center">Username</th>
						<th class="small-1 text-center">Contribution</th>
						<th class="small-3 text-center">Actions</th>
					</tr>
				</thead>
				<tbody>
					<ul class="custom-list-class">
						{foreach $comments as $comment}
						<li>
							<tr>
								<td class="text-center">{$comment->id}</td>

								<td>{$comment->description}</td>

								<td class="text-center">
									<a href="{$BASE_URL}/../../pages/admin/admin-user.php?user={$comment->username}">{$comment->username}</a>
								</td>

								<td class="text-center">{$comment->contribution_id}</td>

								<td>
									<ul class="button-group even-2">
										<li>
											<a href="#" class="button small">Details</a>
										</li>
										<li>
											<a href="#" class="button small">Delete</a>
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
