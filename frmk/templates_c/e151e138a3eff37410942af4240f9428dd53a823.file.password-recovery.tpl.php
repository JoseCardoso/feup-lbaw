<?php /* Smarty version Smarty-3.1.15, created on 2015-04-26 02:39:04
         compiled from "C:\wamp\www\feup-lbaw\frmk\templates\authentication\password-recovery.tpl" */ ?>
<?php /*%%SmartyHeaderCode:23282553c32f0bc1b41-21358689%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    'e151e138a3eff37410942af4240f9428dd53a823' => 
    array (
      0 => 'C:\\wamp\\www\\feup-lbaw\\frmk\\templates\\authentication\\password-recovery.tpl',
      1 => 1430008743,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '23282553c32f0bc1b41-21358689',
  'function' => 
  array (
  ),
  'version' => 'Smarty-3.1.15',
  'unifunc' => 'content_553c32f0c67c51_92153380',
  'variables' => 
  array (
    'BASE_URL' => 0,
  ),
  'has_nocache_code' => false,
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_553c32f0c67c51_92153380')) {function content_553c32f0c67c51_92153380($_smarty_tpl) {?><?php echo $_smarty_tpl->getSubTemplate ('common/header.tpl', $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, null, array(), 0);?>

</head>
<body>
<?php echo $_smarty_tpl->getSubTemplate ('common/navbar.tpl', $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, null, array(), 0);?>


<div class="row">
    <!-- sign up panel -->
    <div class="small-12 medium-8 large-6 small-centered columns">
        <div class="panel">
            <form action="<?php echo $_smarty_tpl->tpl_vars['BASE_URL']->value;?>
actions/authentication/sign-up-php" method="post" enctype="multipart/form-data">
                <h2 class="sign-up">Password Recory</h2>
                <p>Enter the validation code that you've received in your email adress.</p>
                <div class="row">
                    <div class="small-12 columns">
                        <label>
                            <input type="text" placeholder="Insert Validation Code" />
                        </label>
                    </div>
                </div>
                <div class="row">
                    <div class="small-12 columns">
                        <a href="#" class="button large expand">Confirm code</a>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>

<?php echo $_smarty_tpl->getSubTemplate ('common/footer.tpl', $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, null, array(), 0);?>

<?php }} ?>
