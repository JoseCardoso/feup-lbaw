<?php /* Smarty version Smarty-3.1.15, created on 2015-04-25 21:52:16
         compiled from "..\..\templates\authentication\sign-up.tpl" */ ?>
<?php /*%%SmartyHeaderCode:27588553bf070e7a4a0-10659305%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    'b46da8d93d2350cd86fd5dd35b51b699e2586345' => 
    array (
      0 => '..\\..\\templates\\authentication\\sign-up.tpl',
      1 => 1429983823,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '27588553bf070e7a4a0-10659305',
  'function' => 
  array (
  ),
  'variables' => 
  array (
    'BASE_URL' => 0,
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.15',
  'unifunc' => 'content_553bf070eee6f6_15772230',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_553bf070eee6f6_15772230')) {function content_553bf070eee6f6_15772230($_smarty_tpl) {?></head>
<body>
	<<?php ?>?php include 'navbar.tpl'; ?<?php ?>>

	<div class="row">
		<!-- sign up panel -->
		<div class="small-12 medium-8 large-6 small-centered columns">
			<div class="panel">
				<form action="<?php echo $_smarty_tpl->tpl_vars['BASE_URL']->value;?>
actions/authentication/sign-up-php" method="post" enctype="multipart/form-data">
					<h2 class="sign-up">Sign Up</h2>
					<p>Already have an account? <a href="<?php echo $_smarty_tpl->tpl_vars['BASE_URL']->value;?>
index.php">Log In</a></p>
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
<?php }} ?>
