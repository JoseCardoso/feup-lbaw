<?php /* Smarty version Smarty-3.1.15, created on 2015-04-25 19:19:08
         compiled from "C:\wamp\www\feup-lbaw\frmk\templates\users\profile.tpl" */ ?>
<?php /*%%SmartyHeaderCode:15989553bcc8c15c920-98440437%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '6d3582cde1becf338ccac2a47b4caef7c867eb16' => 
    array (
      0 => 'C:\\wamp\\www\\feup-lbaw\\frmk\\templates\\users\\profile.tpl',
      1 => 1429982244,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '15989553bcc8c15c920-98440437',
  'function' => 
  array (
  ),
  'variables' => 
  array (
    'CSS_PATH' => 0,
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.15',
  'unifunc' => 'content_553bcc8c1e7335_04681526',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_553bcc8c1e7335_04681526')) {function content_553bcc8c1e7335_04681526($_smarty_tpl) {?>	<link rel="stylesheet" href="<?php echo $_smarty_tpl->tpl_vars['CSS_PATH']->value;?>
askfeup/explore.css" />
	<link rel="stylesheet" href="<?php echo $_smarty_tpl->tpl_vars['CSS_PATH']->value;?>
askfeup/profile.css" />
</head>
<body>
	<div class="row">
		<div class="small-12 columns">
			<h1>Profile</h1>
		</div>
	</div>

	<div class="row">
		<div class="small-12 medium-3 medium-offset-2 columns">
			<img src="http://placehold.it/400x400&amp;text=[img]">
		</div>

		<div class="small-12 medium-6 end columns">
			<div class="row">
				<div class="small-12 medium-6 end columns">
					<h2 class="show-for-medium-up text-right">Info</h2>

					<hr class="show-for-small-only">
					<h2 class="show-for-small-only text-center">Info</h2>
				</div>
			</div>

			<div class="row show-for-medium-up">
				<div class="medium-6 columns">
					<p class="text-right"><strong>Username</strong></p>
					<p class="text-right"><strong>Email</strong></p>
					<p class="text-right"><strong>Bio</strong></p>
				</div>
				<div class="medium-6 columns">
					<p>ferrolho</p>
					<p>henriqueferrolho@gmail.com</p>
					<p>MIEIC student</p>
				</div>
			</div>

			<div class="row show-for-small-only">
				<div class="small-12 columns text-center">
					<p class="info-label"><strong>Username</strong></p>
					<p>ferrolho</p>

					<p class="info-label"><strong>Email</strong></p>
					<p>henriqueferrolho@gmail.com</p>

					<p class="info-label"><strong>Bio</strong></p>
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
			<ul class="tabs show-for-medium-up" data-tab>
				<li class="tab-title active"><a href="#panel1">Questions</a></li>
				<li class="tab-title"><a href="#panel2">Answers</a></li>
				<li class="tab-title"><a href="#panel3">Favorites</a></li>
			</ul>
			<ul class="tabs show-for-small-only vertical" data-tab>
				<li class="tab-title text-center active"><a href="#panel1">Questions</a></li>
				<li class="tab-title text-center"><a href="#panel2">Answers</a></li>
				<li class="tab-title text-center"><a href="#panel3">Favorites</a></li>
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
		<?php echo $_smarty_tpl->getSubTemplate ('../questions/question.tpl', $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, null, array(), 0);?>

		<a class="close-reveal-modal">&#215;</a>
	</div>
<?php }} ?>
