<?php /* Smarty version Smarty-3.1.15, created on 2015-04-26 04:09:59
         compiled from "C:\wamp\www\feup-lbaw\frmk\templates\common\navbar.tpl" */ ?>
<?php /*%%SmartyHeaderCode:13374553c48f77c96b8-10215668%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '98c88e0a4b9aee666cff19910a788b40802839ce' => 
    array (
      0 => 'C:\\wamp\\www\\feup-lbaw\\frmk\\templates\\common\\navbar.tpl',
      1 => 1430005098,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '13374553c48f77c96b8-10215668',
  'function' => 
  array (
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.15',
  'unifunc' => 'content_553c48f7802d36_44498301',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_553c48f7802d36_44498301')) {function content_553c48f7802d36_44498301($_smarty_tpl) {?><div class="contain-to-grid fixed nav-bar-border-top">
	<nav class="top-bar" data-topbar role="navigation">
		<ul class="title-area">
			<li class="name">
				<h1><a href="?page=explore">AskFEUP</a></h1>
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
					<a href="?page=explore"><i class="fi-compass nav-bar-icon"></i>Explore</a>
					<ul class="dropdown">
						<li><a href="?page=contacts"><i class="fi-address-book nav-bar-icon"></i>Contact us</a></li>
						<li><a href="?page=about"><i class="fi-torsos-all nav-bar-icon"></i>About us</a></li>
					</ul>
				</li>
				<li class="has-dropdown">
					<a href="?page=profile"><i class="fi-torso nav-bar-icon"></i>Profile</a>
					<ul class="dropdown">
						<li><a href="?page=sign-out"><i class="fi-lock nav-bar-icon"></i>Sign out</a></li>
					</ul>
				</li>
				<li><a href="?page=faq"><b class="nav-bar-icon">?</b>FAQ</a></li>
			</ul>
		</section>
	</nav>
</div>
<div class="nav-bar-margin-bottom"></div>
<?php }} ?>
