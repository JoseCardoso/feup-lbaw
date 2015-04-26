<?php /* Smarty version Smarty-3.1.15, created on 2015-04-26 04:10:06
         compiled from "C:\wamp\www\feup-lbaw\frmk\templates\authentication\sign-in.tpl" */ ?>
<?php /*%%SmartyHeaderCode:12770553c48fe4e9248-58588849%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '4dca79fe02b9e3f9ea9fb98fd0e1a9703df7d2a3' => 
    array (
      0 => 'C:\\wamp\\www\\feup-lbaw\\frmk\\templates\\authentication\\sign-in.tpl',
      1 => 1430008498,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '12770553c48fe4e9248-58588849',
  'function' => 
  array (
  ),
  'variables' => 
  array (
    'CSS_PATH' => 0,
    'IMAGE_PATH' => 0,
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.15',
  'unifunc' => 'content_553c48fe5b5972_12736830',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_553c48fe5b5972_12736830')) {function content_553c48fe5b5972_12736830($_smarty_tpl) {?>	<?php echo $_smarty_tpl->getSubTemplate ('common/header.tpl', $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, null, array(), 0);?>


	<link rel="stylesheet" href="<?php echo $_smarty_tpl->tpl_vars['CSS_PATH']->value;?>
askfeup/sign-in.css" />
</head>
<body>
	<?php echo $_smarty_tpl->getSubTemplate ('common/navbar.tpl', $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, null, array(), 0);?>

	
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

				<p class="right"><a href="?page=passwordRecovery">Forgot password?</a></p>
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

				<p class="text-center"><a href="?page=signUp">Create an account</a></p>
			</div>
		</div>
	</div>

	<?php echo $_smarty_tpl->getSubTemplate ('common/footer.tpl', $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, null, array(), 0);?>

<?php }} ?>
