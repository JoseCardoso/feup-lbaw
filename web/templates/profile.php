	<link rel="stylesheet" href="assets/css/explore.css" />
</head>
<body>
	<?php include 'navbar.php'; ?>
	
	<div class="row">
		<div class="small-12 columns">
			<h1>Profile</h1>
		</div>
	</div>

	<div class="row">
		<div class="small-12 medium-3 medium-offset-2 columns">
			<img src="http://placehold.it/200x200&amp;text=[img]">
		</div>

		<div class="small-12 medium-6 end columns">
			<div class="row">
				<div class="small-12 medium-6 end columns">
					<h2 class="text-right">Info</h2>
				</div>
			</div>

			<div class="row">
				<div class="small-12 medium-6 columns">
					<p class="text-right"><strong>Username</strong></p>
					<p class="text-right"><strong>Email</strong></p>
					<p class="text-right"><strong>Bio</strong></p>
				</div>
				<div class="small-12 medium-6 columns">
					<p>ferrolho</p>
					<p>henriqueferrolho@gmail.com</p>
					<p>MIEIC student</p>
				</div>
			</div>
		</div>
	</div>

	<div class="row">
		<div class="small-12 columns">
			<hr>
		</div>
	</div>

	<div class="row">
		<div class="small-12 columns">
			<ul class="tabs" data-tab>
				<li class="tab-title active"><a href="#panel1">Questions</a></li>
				<li class="tab-title"><a href="#panel2">Answers</a></li>
				<li class="tab-title"><a href="#panel3">Favorites</a></li>
			</ul>

			<div class="tabs-content">
				<div class="content active" id="panel1">
					<ul class="small-block-grid-1 medium-block-grid-2">
						<li>
							<div class="panel question" data-reveal-id="questionModal">
								<div class="row">
									<div class="small-12 columns">
										<p class="text-justify question-text">Que tipo de gomas são vendidas na D. Beatriz?</p>
									</div>
								</div>
								<div class="row text-center">
									<div class="small-3 medium-4 columns question-stats">
										<p>50</p>
										<p>votes</p>
									</div>
									<div class="small-3 medium-4 columns question-stats">
										<p>4</p>
										<p>answers</p>
									</div>
									<div class="small-6 medium-4 columns text-right">
										<p class="question-author"><a href="#">@ferrolho</a></p>
										<p class="question-date">00h15 - 15 Jan 2015</p>
									</div>
								</div>
							</div>
						</li>

						<li>
							<div class="panel question" data-reveal-id="questionModal">
								<div class="row">
									<div class="small-12 columns">
										<p class="text-justify question-text">Que tipo de gomas são vendidas na D. Beatriz?</p>
									</div>
								</div>
								<div class="row text-center">
									<div class="small-3 medium-4 columns question-stats">
										<p>50</p>
										<p>votes</p>
									</div>
									<div class="small-3 medium-4 columns question-stats">
										<p>4</p>
										<p>answers</p>
									</div>
									<div class="small-6 medium-4 columns text-right">
										<p class="question-author"><a href="#">@ferrolho</a></p>
										<p class="question-date">00h15 - 15 Jan 2015</p>
									</div>
								</div>
							</div>
						</li>

						<li>
							<div class="panel question" data-reveal-id="questionModal">
								<div class="row">
									<div class="small-12 columns">
										<p class="text-justify question-text">Que tipo de gomas são vendidas na D. Beatriz?</p>
									</div>
								</div>
								<div class="row text-center">
									<div class="small-3 medium-4 columns question-stats">
										<p>50</p>
										<p>votes</p>
									</div>
									<div class="small-3 medium-4 columns question-stats">
										<p>4</p>
										<p>answers</p>
									</div>
									<div class="small-6 medium-4 columns text-right">
										<p class="question-author"><a href="#">@ferrolho</a></p>
										<p class="question-date">00h15 - 15 Jan 2015</p>
									</div>
								</div>
							</div>
						</li>
					</ul>
				</div>

				<div class="content" id="panel2">
					<ul class="small-block-grid-1 medium-block-grid-2">
						<li>
							<div class="panel question" data-reveal-id="questionModal">
								<div class="row">
									<div class="small-12 columns">
										<p class="text-justify question-text">Que tipo de gomas são vendidas na D. Beatriz?</p>
									</div>
								</div>
								<div class="row text-center">
									<div class="small-3 medium-4 columns question-stats">
										<p>50</p>
										<p>votes</p>
									</div>
									<div class="small-3 medium-4 columns question-stats">
										<p>4</p>
										<p>answers</p>
									</div>
									<div class="small-6 medium-4 columns text-right">
										<p class="question-author"><a href="#">@ferrolho</a></p>
										<p class="question-date">00h15 - 15 Jan 2015</p>
									</div>
								</div>
							</div>
						</li>
					</ul>
				</div>

				<div class="content" id="panel3">
					<p>No favorites yet.</p>
				</div>
			</div>
		</div>
	</div>

	<div id="questionModal" class="reveal-modal large" data-reveal>
		<?php include 'question.php'; ?>
		<a class="close-reveal-modal">&#215;</a>
	</div>
