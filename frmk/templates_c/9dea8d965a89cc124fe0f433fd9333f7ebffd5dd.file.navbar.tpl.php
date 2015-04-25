<?php /* Smarty version Smarty-3.1.15, created on 2015-04-25 21:23:38
         compiled from "..\..\templates\common\navbar.tpl" */ ?>
<?php /*%%SmartyHeaderCode:13485553be9ba360746-81960307%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '9dea8d965a89cc124fe0f433fd9333f7ebffd5dd' => 
    array (
      0 => '..\\..\\templates\\common\\navbar.tpl',
      1 => 1429982396,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '13485553be9ba360746-81960307',
  'function' => 
  array (
  ),
  'variables' => 
  array (
    'BASE_URL' => 0,
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.15',
  'unifunc' => 'content_553be9ba5da030_61960418',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_553be9ba5da030_61960418')) {function content_553be9ba5da030_61960418($_smarty_tpl) {?><div class="contain-to-grid fixed nav-bar-border-top">
	<nav class="top-bar" data-topbar role="navigation">
		<ul class="title-area">
			<li class="name">
				<h1><a href="<?php echo $_smarty_tpl->tpl_vars['BASE_URL']->value;?>
pages/menus/explore.php">AskFEUP</a></h1>
			</li>

			<!-- Remove the class "menu-icon" to get rid of menu icon. Take out "Menu" to just have icon alone -->
			<li class="toggle-topbar menu-icon"><a href="#"><span>Menu</span></a></li>
		</ul>

		<section class="top-bar-section">
			<!-- Left Nav Section -->
			<ul class="left">
				<!-- search bar -->
				<li class="has-form">
					<div class="row collapse search-bar">
						<div class="small-8 columns">
							<input type="search" placeholder="Ask something">
						</div>
						<div class="small-4 columns">
							<a href="#" class="button expand">Search</a>
						</div>
					</div>
				</li>
			</ul>

			<!-- Right Nav Section -->
			<ul class="right">
				<li class="has-dropdown">
					<a href="<?php echo $_smarty_tpl->tpl_vars['BASE_URL']->value;?>
pages/menus/explore.php"><i class="fi-compass nav-bar-icon"></i>Explore</a>
					<ul class="dropdown">
						<li><a href="<?php echo $_smarty_tpl->tpl_vars['BASE_URL']->value;?>
pages/menus/contacts.php"><i class="fi-address-book nav-bar-icon"></i>Contact us</a></li>
						<li><a href="<?php echo $_smarty_tpl->tpl_vars['BASE_URL']->value;?>
pages/menus/about.php"><i class="fi-torsos-all nav-bar-icon"></i>About us</a></li>
					</ul>
				</li>
				<li class="has-dropdown">
					<a href="<?php echo $_smarty_tpl->tpl_vars['BASE_URL']->value;?>
pages/users/profile.php"><i class="fi-torso nav-bar-icon"></i>Profile</a>
					<ul class="dropdown">
						<li><a href="<?php echo $_smarty_tpl->tpl_vars['BASE_URL']->value;?>
pages/authentication/sign-in.php"><i class="fi-lock nav-bar-icon"></i>Sign out</a></li>
					</ul>
				</li>
				<li><a href="<?php echo $_smarty_tpl->tpl_vars['BASE_URL']->value;?>
pages/menus/faq.php"><b class="nav-bar-icon">?</b>FAQ</a></li>
			</ul>
		</section>
	</nav>
</div>
<div class="nav-bar-margin-bottom"></div>
<?php }} ?>
