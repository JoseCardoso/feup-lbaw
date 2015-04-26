<?php /* Smarty version Smarty-3.1.15, created on 2015-04-26 02:42:13
         compiled from "/home/henrique/git/feup-lbaw/frmk/templates/authentication/password-recovery.tpl" */ ?>
<?php /*%%SmartyHeaderCode:153249475553c34397dff78-49343987%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    'fe473f97c9f1ad3a6296e4c6e116a8200732a494' => 
    array (
      0 => '/home/henrique/git/feup-lbaw/frmk/templates/authentication/password-recovery.tpl',
      1 => 1430008929,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '153249475553c34397dff78-49343987',
  'function' => 
  array (
  ),
  'version' => 'Smarty-3.1.15',
  'unifunc' => 'content_553c3439826473_51662006',
  'variables' => 
  array (
    'BASE_URL' => 0,
  ),
  'has_nocache_code' => false,
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_553c3439826473_51662006')) {function content_553c3439826473_51662006($_smarty_tpl) {?><?php echo $_smarty_tpl->getSubTemplate ('common/header.tpl', $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, null, array(), 0);?>

</head>
<body>
<?php echo $_smarty_tpl->getSubTemplate ('common/navbar.tpl', $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, null, array(), 0);?>


<div class="row">
    <!-- sign up panel -->
    <div class="small-12 medium-8 large-6 small-centered columns">
        <div class="panel">
            <form action="<?php echo $_smarty_tpl->tpl_vars['BASE_URL']->value;?>
actions/authentication/sign-up-php" method="post" enctype="multipart/form-data">
                <h2 class="sign-up">Password Recovery</h2>
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
