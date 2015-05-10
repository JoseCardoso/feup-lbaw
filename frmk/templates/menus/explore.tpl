	{include file = 'common/header.tpl'}

	<link rel="stylesheet" href="{$CSS_PATH}askfeup/explore.css" />
</head>

<body>
	{include file = 'common/navbar.tpl'}

	<div class="row">
		<div class="small-12 medium-2 columns">
			<a href="#" class="button small secondary expand"><i class="fi-filter nav-bar-icon"></i>Filter</a>
		</div>

		<div class="small-12 medium-8 columns">
			<div class="row">
				<div class="small-12 medium-8 small-centered columns">
					<ul class="button-group even-3">
						<li><a href="#" class="button small secondary">Most Recent</a></li>
						<li><a href="#" class="button small secondary">Most Popular</a></li>
						<li><a href="#" class="button small secondary">Most Viewed</a></li>
					</ul>
				</div>
			</div>
		</div>

		<div class="small-12 medium-2 columns">
			<a href="#" class="button success small expand"><i class="fi-plus nav-bar-icon"></i>Add new</a>
		</div>
	</div>

	<div class="row">
		<div class="small-12 columns">
			<ul class="small-block-grid-1 medium-block-grid-2">
                {foreach $questions as $question}
				<li>
					<div class="panel question" data-reveal-id="questionModal">
						<div class="row">
							<div class="small-12 columns">
								<p class="text-justify question-text">{$question->text}</p>
							</div>
						</div>
						<div class="row text-center">
							<div class="small-3 medium-4 columns question-stats">
								<p>{$question->contribution()->diferencaVotos}</p>
								<p>votes</p>
							</div>
							<div class="small-3 medium-4 columns question-stats">
								<p>{$question->contribution()->countAnswers()}</p>
								<p>answers</p>
							</div>
							<div class="small-6 medium-4 columns text-right">
								<p class="question-author"><a href="#">{$question->contribution()->user()->displayUsername()}</a></p>
								<p class="question-date">{$question->contribution()->displayDate()}</p>
							</div>
						</div>
					</div>
				</li>
                {/foreach}
			</ul>
		</div>
	</div>

	<div id="questionModal" class="reveal-modal large" data-reveal>
		{include '../questions/question-old.tpl'}
		<a class="close-reveal-modal">&#215;</a>
	</div>

	{include file = 'common/footer.tpl'}

	<script type="text/javascript">
	document.addEventListener("DOMContentLoaded", function(event) {
		var id = window.location.hash.substring(1); // remove the #
		var element = document.querySelector('[data-reveal-id="' + id + '"]');

		element.click();
	});
	</script>
