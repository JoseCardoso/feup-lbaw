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
			<h1>Answers</h1>
		</div>
	</div>

	<div class="row">
		<div class="small-12 columns">
			<table>
				<thead>
					<tr>
						<th class="small-1 text-center">ID</th>
						<th class="small-4 text-center">Description</th>
						<th class="small-1 text-center">Username</th>
						<th class="small-6 text-center">Actions</th>
					</tr>
				</thead>
				<tbody>
					<ul class="custom-list-class">
						{foreach $answers as $answer}
						<li>
							<tr>
								<td class="text-center">{$answer->id}</td>

								<td>{$answer->description}</td>

								<td class="text-center">
									<a href="{$BASE_URL}/../../pages/admin/admin-user.php?user={$answer->username}">{$answer->username}</a>
								</td>

								<td>
									<ul class="button-group even-4">
										<li>
											<a href="{$BASE_URL}/../../pages/admin/admin-question.php?question={$answer->question_id}" class="button small">Question</a>
										</li>
										<li>
											<a href="{$BASE_URL}/../../pages/admin/admin-comments.php?contribution_id={$answer->id}" class="button small">Comments</a>
										</li>
										<li>
											<a href="{$BASE_URL}/../../pages/admin/admin-answer.php?answer={$answer->id}" class="button small">Details</a>
										</li>
										<li>
											<a href="{$BASE_URL}/../../pages/admin/admin-answer-delete.php?answer={$answer->id}" class="button small">Delete</a>
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
