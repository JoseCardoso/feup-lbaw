<?php /* Smarty version Smarty-3.1.15, created on 2015-04-26 01:39:57
         compiled from "C:\wamp\www\feup-lbaw\frmk\templates\menus\explore.tpl" */ ?>
<?php /*%%SmartyHeaderCode:32058553c25cd637e45-20716103%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '15a94c9b83a9fbfbe95bf40c3230c356c5d08f3b' => 
    array (
      0 => 'C:\\wamp\\www\\feup-lbaw\\frmk\\templates\\menus\\explore.tpl',
      1 => 1430005098,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '32058553c25cd637e45-20716103',
  'function' => 
  array (
  ),
  'variables' => 
  array (
    'CSS_PATH' => 0,
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.15',
  'unifunc' => 'content_553c25cd73d548_53641023',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_553c25cd73d548_53641023')) {function content_553c25cd73d548_53641023($_smarty_tpl) {?>	<?php echo $_smarty_tpl->getSubTemplate ('common/header.tpl', $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, null, array(), 0);?>

	
	<link rel="stylesheet" href="<?php echo $_smarty_tpl->tpl_vars['CSS_PATH']->value;?>
askfeup/explore.css" />
</head>
<body>
	<?php echo $_smarty_tpl->getSubTemplate ('common/navbar.tpl', $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, null, array(), 0);?>


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
								<p class="text-justify question-text">A D. Beatriz vende Red Bull?</p>
							</div>
						</div>
						<div class="row text-center">
							<div class="small-3 medium-4 columns question-stats">
								<p>46</p>
								<p>votes</p>
							</div>
							<div class="small-3 medium-4 columns question-stats">
								<p>2</p>
								<p>answers</p>
							</div>
							<div class="small-6 medium-4 columns text-right">
								<p class="question-author"><a href="#">@jpereira</a></p>
								<p class="question-date">00h15 - 15 Jan 2015</p>
							</div>
						</div>
					</div>
				</li>

				<li>
					<div class="panel question" data-reveal-id="questionModal">
						<div class="row">
							<div class="small-12 columns">
								<p class="text-justify question-text">A que horas abre e fecha a papelaria?</p>
							</div>
						</div>
						<div class="row text-center">
							<div class="small-3 medium-4 columns question-stats">
								<p>37</p>
								<p>votes</p>
							</div>
							<div class="small-3 medium-4 columns question-stats">
								<p>3</p>
								<p>answers</p>
							</div>
							<div class="small-6 medium-4 columns text-right">
								<p class="question-author"><a href="#">@zoid</a></p>
								<p class="question-date">00h15 - 15 Jan 2015</p>
							</div>
						</div>
					</div>
				</li>

				<li>
					<div class="panel question" data-reveal-id="questionModal">
						<div class="row">
							<div class="small-12 columns">
								<p class="text-justify question-text">A cantina está aberta ao domingo?</p>
							</div>
						</div>
						<div class="row text-center">
							<div class="small-3 medium-4 columns question-stats">
								<p>33</p>
								<p>votes</p>
							</div>
							<div class="small-3 medium-4 columns question-stats">
								<p>1</p>
								<p>answers</p>
							</div>
							<div class="small-6 medium-4 columns text-right">
								<p class="question-author"><a href="#">@vecton</a></p>
								<p class="question-date">00h15 - 15 Jan 2015</p>
							</div>
						</div>
					</div>
				</li>

				<li>
					<div class="panel question" data-reveal-id="questionModal">
						<div class="row">
							<div class="small-12 columns">
								<p class="text-justify question-text">Bacon ipsum dolor amet kielbasa chicken turkey turducken meatloaf shank?</p>
							</div>
						</div>
						<div class="row text-center">
							<div class="small-3 medium-4 columns question-stats">
								<p>0</p>
								<p>votes</p>
							</div>
							<div class="small-3 medium-4 columns question-stats">
								<p>0</p>
								<p>answers</p>
							</div>
							<div class="small-6 medium-4 columns text-right">
								<p class="question-author"><a href="#">@piglet</a></p>
								<p class="question-date">00h15 - 15 Jan 2015</p>
							</div>
						</div>
					</div>
				</li>
			</ul>
		</div>
	</div>

	<div id="questionModal" class="reveal-modal large" data-reveal>
		<?php echo $_smarty_tpl->getSubTemplate ('../questions/question.tpl', $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, null, array(), 0);?>

		<a class="close-reveal-modal">&#215;</a>
	</div>

	<?php echo $_smarty_tpl->getSubTemplate ('common/footer.tpl', $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, null, array(), 0);?>


	<script type="text/javascript">
	document.addEventListener("DOMContentLoaded", function(event) {
		var id = window.location.hash.substring(1); // remove the #
		var element = document.querySelector('[data-reveal-id="' + id + '"]');

		element.click();
	});
	</script>
<?php }} ?>
