<?php /* Smarty version Smarty-3.1.15, created on 2015-04-26 17:19:54
         compiled from "C:\wamp\www\feup-lbaw\frmk\templates\authentication\sign-up.tpl" */ ?>
<?php /*%%SmartyHeaderCode:18803553c490094f809-03007325%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    'f1f3d93b86d3307c426075136a3e9445300a11b0' => 
    array (
      0 => 'C:\\wamp\\www\\feup-lbaw\\frmk\\templates\\authentication\\sign-up.tpl',
      1 => 1430061591,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '18803553c490094f809-03007325',
  'function' => 
  array (
  ),
  'version' => 'Smarty-3.1.15',
  'unifunc' => 'content_553c4900b8e2f6_69451730',
  'variables' => 
  array (
    'BASE_DIR' => 0,
    'cities' => 0,
    'city' => 0,
  ),
  'has_nocache_code' => false,
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_553c4900b8e2f6_69451730')) {function content_553c4900b8e2f6_69451730($_smarty_tpl) {?><?php echo $_smarty_tpl->getSubTemplate ('common/header.tpl', $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, null, array(), 0);?>

</head>
<body>
<?php echo $_smarty_tpl->getSubTemplate ('common/navbar.tpl', $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, null, array(), 0);?>


<div class="row">
    <!-- sign up panel -->
    <div class="small-12 medium-8 large-6 small-centered columns">
        <div class="panel">
            <form id="sign-up" action="<?php echo $_smarty_tpl->tpl_vars['BASE_DIR']->value;?>
/actions/authentication/sign-up.php" method="post" enctype="multipart/form-data">
                <h2 class="sign-up">Sign Up</h2>

                <p>Already have an account? <a href="?page=signIn">Log In</a></p>

                <div class="row">
                    <div class="small-12 columns">
                        <label>Username
                            <input type="text" name="username" placeholder="Insert Username"/>
                        </label>
                    </div>
                </div>

                <div class="row">
                    <div class="small-12 columns">
                        <label>Password
                            <input type="password" name="password" placeholder="Insert Password"/>
                        </label>
                    </div>
                </div>

                <div class="row">
                    <div class="small-12 columns">
                        <label>Confirm Password
                            <input type="password" placeholder="Confirm Password"/>
                        </label>
                    </div>
                </div>

                <div class="row">
                    <div class="small-12 columns">
                        <label>E-mail
                            <input type="email" name="email" placeholder="user@gmail.com"/>
                        </label>
                    </div>
                </div>

                <div class="row">
                    <div class="small-6 columns">
                        <label>Primeiro Nome
                            <input type="text" name="firstName" placeholder="Primeiro Nome"/>
                        </label>
                    </div>

                    <div class="small-6 columns">
                        <label>Último Nome
                            <input type="text" name="lastName" placeholder="Último Nome"/>
                        </label>
                    </div>
                </div>

                <div class="row">
                    <div class="small-12 columns">
                        <label>City
                            <select name="cityName" form="sign-up">
                                <option class="selectPlaceholder" value="" disabled selected>Choose a city</option>
                                <?php  $_smarty_tpl->tpl_vars['city'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['city']->_loop = false;
 $_smarty_tpl->tpl_vars['name'] = new Smarty_Variable;
 $_from = $_smarty_tpl->tpl_vars['cities']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['city']->key => $_smarty_tpl->tpl_vars['city']->value) {
$_smarty_tpl->tpl_vars['city']->_loop = true;
 $_smarty_tpl->tpl_vars['name']->value = $_smarty_tpl->tpl_vars['city']->key;
?>
                                    <option value="<?php echo $_smarty_tpl->tpl_vars['city']->value['nome'];?>
"><?php echo $_smarty_tpl->tpl_vars['city']->value['nome'];?>
</option>
                                <?php } ?>
                            </select>
                        </label>
                    </div>
                </div>

                <div class="row">
                    <div class="small-12 columns">
                        <p>By clicking Sign Up, you agree to our <a href="#" data-reveal-id="termsModal">Terms</a> and
                            that you have read our <a href="#">Data Policy</a>, including our <a href="#">Cookie Use</a>.
                        </p>
                    </div>
                </div>

                <div class="row">
                    <div class="small-12 columns">
                        <button type="submit" class="button large expand">Sign up</button>
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
