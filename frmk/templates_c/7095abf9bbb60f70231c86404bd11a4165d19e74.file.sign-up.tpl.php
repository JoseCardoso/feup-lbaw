<?php /* Smarty version Smarty-3.1.15, created on 2015-04-26 00:55:42
         compiled from "/home/henrique/git/feup-lbaw/frmk/templates/authentication/sign-up.tpl" */ ?>
<?php /*%%SmartyHeaderCode:1268569966553c1b39674bb7-28374624%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '7095abf9bbb60f70231c86404bd11a4165d19e74' => 
    array (
      0 => '/home/henrique/git/feup-lbaw/frmk/templates/authentication/sign-up.tpl',
      1 => 1430002539,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '1268569966553c1b39674bb7-28374624',
  'function' => 
  array (
  ),
  'version' => 'Smarty-3.1.15',
  'unifunc' => 'content_553c1b3969e143_09296941',
  'variables' => 
  array (
    'BASE_URL' => 0,
  ),
  'has_nocache_code' => false,
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_553c1b3969e143_09296941')) {function content_553c1b3969e143_09296941($_smarty_tpl) {?>	<?php echo $_smarty_tpl->getSubTemplate ('common/header.tpl', $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, null, array(), 0);?>

</head>
<body>
	<?php echo $_smarty_tpl->getSubTemplate ('common/navbar.tpl', $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, null, array(), 0);?>


	<div class="row">
		<!-- sign up panel -->
		<div class="small-12 medium-8 large-6 small-centered columns">
			<div class="panel">
				<form action="<?php echo $_smarty_tpl->tpl_vars['BASE_URL']->value;?>
actions/authentication/sign-up-php" method="post" enctype="multipart/form-data">
					<h2 class="sign-up">Sign Up</h2>
					<p>Already have an account? <a href="?page=signIn">Log In</a></p>
					<div class="row">
						<div class="small-12 columns">
							<label>Username
								<input type="text" placeholder="Insert Username" />
							</label>
						</div>
					</div>
					<div class="row">
						<div class="small-12 columns">
							<label>Password
								<input type="password" placeholder="Insert Password" />
							</label>
						</div>
					</div>
					<div class="row">
						<div class="small-12 columns">
							<label>Confirm Password
								<input type="password" placeholder="Confirm Password" />
							</label>
						</div>
					</div>
					<div class="row">
						<div class="small-12 columns">
							<label>E-mail
								<input type="email" placeholder="user@gmail.com" />
							</label>
						</div>
					</div>
					<div class="row">
						<div class="small-12 columns">
							<p>By clicking Sign Up, you agree to our <a href="#" data-reveal-id="termsModal">Terms</a> and that you have read our <a href="#">Data Policy</a>, including our <a href="#">Cookie Use</a>.
							</p>
						</div>
					</div>
					<div class="row">
						<div class="small-12 columns">
							<a href="#" class="button large expand">Sign up</a>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>

	<div id="termsModal" class="reveal-modal small" data-reveal>
		<h2>Terms and Conditions</h2>
		<p>I am at least 13 years old.</p>
		<a class="close-reveal-modal">&#215;</a>
	</div>

	<?php echo $_smarty_tpl->getSubTemplate ('common/footer.tpl', $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, null, array(), 0);?>

<?php }} ?>
