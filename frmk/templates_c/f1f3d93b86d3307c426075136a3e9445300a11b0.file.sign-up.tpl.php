<?php /* Smarty version Smarty-3.1.15, created on 2015-04-25 19:22:31
         compiled from "C:\wamp\www\feup-lbaw\frmk\templates\authentication\sign-up.tpl" */ ?>
<?php /*%%SmartyHeaderCode:9055553bc359448b04-90199142%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    'f1f3d93b86d3307c426075136a3e9445300a11b0' => 
    array (
      0 => 'C:\\wamp\\www\\feup-lbaw\\frmk\\templates\\authentication\\sign-up.tpl',
      1 => 1429982545,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '9055553bc359448b04-90199142',
  'function' => 
  array (
  ),
  'version' => 'Smarty-3.1.15',
  'unifunc' => 'content_553bc35954dfa3_62380665',
  'variables' => 
  array (
    'BASE_URL' => 0,
  ),
  'has_nocache_code' => false,
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_553bc35954dfa3_62380665')) {function content_553bc35954dfa3_62380665($_smarty_tpl) {?></head>
<body>
	<<?php ?>?php include 'navbar.tpl'; ?<?php ?>>

	<div class="row">
		<!-- sign up panel -->
		<div class="small-12 medium-8 large-6 small-centered columns">
			<div class="panel">
				<form>
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
