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
			<h1>Questions</h1>
		</div>
	</div>

	<div class="row">
		<div class="small-12 columns">
			<table>
				<thead>
					<tr>
						<th class="small-1 text-center">ID</th>
						<th class="small-4 text-center">Text</th>
						<th class="small-1 text-center">Username</th>
						<th class="small-6 text-center">Actions</th>
					</tr>
				</thead>
				<tbody>
					<ul class="custom-list-class">
						{foreach $questions as $question}
						<li>
							<tr>
								<td class="text-center">{$question->id}</td>

								<td>{$question->text}</td>

								<td class="text-center">
									<a href="{$BASE_URL}/../../pages/admin/admin-user.php?user={$question->username}">{$question->username}</a>
								</td>

								<td>
									<ul class="button-group even-4">
										<li>
											<a href="{$BASE_URL}/../../pages/admin/admin-answers.php?question_id={$question->id}" class="button small">Answers</a>
										</li>
										<li>
											<a href="{$BASE_URL}/../../pages/admin/admin-comments.php?contribution_id={$question->id}" class="button small">Comments</a>
										</li>
										<li>
											<a href="{$BASE_URL}/../../pages/admin/admin-question.php?question={$question->id}" class="button small">Details</a>
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
