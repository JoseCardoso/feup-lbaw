<?php /* Smarty version Smarty-3.1.15, created on 2015-04-25 21:23:38
         compiled from "..\..\templates\authentication\sign-in.tpl" */ ?>
<?php /*%%SmartyHeaderCode:17267553be9ba7eed67-44177969%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '50bf977567df26eba5278106361bf71b4927e3c1' => 
    array (
      0 => '..\\..\\templates\\authentication\\sign-in.tpl',
      1 => 1429981443,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '17267553be9ba7eed67-44177969',
  'function' => 
  array (
  ),
  'variables' => 
  array (
    'CSS_PATH' => 0,
    'IMAGE_PATH' => 0,
    'BASE_URL' => 0,
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.15',
  'unifunc' => 'content_553be9ba9299f1_12336244',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_553be9ba9299f1_12336244')) {function content_553be9ba9299f1_12336244($_smarty_tpl) {?>	<link rel="stylesheet" href="<?php echo $_smarty_tpl->tpl_vars['CSS_PATH']->value;?>
askfeup/sign-in.css" />
</head>
<body>
	<div class="row">
		<div class="small-12 medium-6 large-8 columns">
			<div data-alert class="alert-box warning radius">
				<h5 style="color: yellow;">
					<i class="fi-alert"></i>
					This is still under construction!
				</h5>
				<a href="#" class="close">&times;</a>
			</div>

			<!-- orbit -->
			<ul class="orbit" data-orbit data-options="pause_on_hover: false;">
				<li>
					<img src="<?php echo $_smarty_tpl->tpl_vars['IMAGE_PATH']->value;?>
main-page/feup-garden.jpg" alt="slide 1" />
					<div class="orbit-caption">
						FEUP
					</div>
				</li>
				<li>
					<img src="<?php echo $_smarty_tpl->tpl_vars['IMAGE_PATH']->value;?>
main-page/feup-biblio.jpg" alt="slide 2" />
				</li>
				<li>
					<img src="<?php echo $_smarty_tpl->tpl_vars['IMAGE_PATH']->value;?>
main-page/feup-sunset.jpg" alt="slide 3" />
				</li>
			</ul>

			<!-- search box panel -->
			<div class="panel search-box-panel">
				<div class="row">
					<div class="small-10 columns">
						<input type="text" placeholder="Ask something">
					</div>
					<div class="small-2 columns">
						<i class="fi-magnifying-glass"></i>
					</div>
				</div>
			</div>
		</div>

		<!-- log in panel -->
		<div class="small-12 medium-6 large-4 columns">
			<div class="panel">
				<p>Log in via</p>
				<ul class="button-group even-2">
					<li><a href="#" class="button facebook-button">Facebook</a></li>
					<li><a href="#" class="button google-plus-button">Google+</a></li>
				</ul>

				<p class="right"><a href="#">Forgot password?</a></p>
				<p>Log in</p>
				<form>
					<input type="text" placeholder="Username or Email" />
					<input type="password" placeholder="Password" />
					<input id="remember-me-checkbox" type="checkbox"><label for="remember-me-checkbox">Remember me</label>
				</form>

				<!-- log in button -->
				<div class="row">
					<div class="small-12 columns">
						<a href="#" class="button large expand">Log in</a>
					</div>
				</div>

				<p class="text-center"><a href="<?php echo $_smarty_tpl->tpl_vars['BASE_URL']->value;?>
pages/authentication/sign-up.php">Create an account</a></p>
			</div>
		</div>
	</div>
<?php }} ?>
