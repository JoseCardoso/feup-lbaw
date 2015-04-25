<?php /* Smarty version Smarty-3.1.15, created on 2015-04-26 00:48:55
         compiled from "/home/henrique/git/feup-lbaw/frmk/templates/menus/faq.tpl" */ ?>
<?php /*%%SmartyHeaderCode:913272242553c1541c03924-49313567%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '589d804ff65f1ad2afeb5792d941a2a9458777c9' => 
    array (
      0 => '/home/henrique/git/feup-lbaw/frmk/templates/menus/faq.tpl',
      1 => 1430002128,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '913272242553c1541c03924-49313567',
  'function' => 
  array (
  ),
  'version' => 'Smarty-3.1.15',
  'unifunc' => 'content_553c1541c29ef1_97276249',
  'variables' => 
  array (
    'CSS_PATH' => 0,
  ),
  'has_nocache_code' => false,
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_553c1541c29ef1_97276249')) {function content_553c1541c29ef1_97276249($_smarty_tpl) {?>	<?php echo $_smarty_tpl->getSubTemplate ('common/header.tpl', $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, null, array(), 0);?>


	<link rel="stylesheet" href="<?php echo $_smarty_tpl->tpl_vars['CSS_PATH']->value;?>
askfeup/faq.css" />
</head>
<body>
	<?php echo $_smarty_tpl->getSubTemplate ('common/navbar.tpl', $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, null, array(), 0);?>

	
	<div class="row">
		<div class="small-12 columns">
			<h1>Frequently asked questions</h1>
		</div>
	</div>

	<?php echo $_smarty_tpl->getSubTemplate ('common/footer.tpl', $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, null, array(), 0);?>

<?php }} ?>
