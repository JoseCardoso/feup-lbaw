<?php /* Smarty version Smarty-3.1.15, created on 2015-04-26 04:09:59
         compiled from "C:\wamp\www\feup-lbaw\frmk\templates\questions\question.tpl" */ ?>
<?php /*%%SmartyHeaderCode:21151553c48f78a06f3-62749912%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '6f626f1d39b68b9d49542024ce4c47eabac08384' => 
    array (
      0 => 'C:\\wamp\\www\\feup-lbaw\\frmk\\templates\\questions\\question.tpl',
      1 => 1430005098,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '21151553c48f78a06f3-62749912',
  'function' => 
  array (
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.15',
  'unifunc' => 'content_553c48f78c8f96_42353848',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_553c48f78c8f96_42353848')) {function content_553c48f78c8f96_42353848($_smarty_tpl) {?><div class="question-modal-content favorite">
	<div class="row">
		<div class="small-4 large-2 columns">
			<div class="row">
				<div class="small-12 columns text-center">
					<i class="fi-like"></i>
				</div>
			</div>

			<div class="row">
				<div class="small-12 columns text-center">
					<p class="score">50</p>
				</div>
			</div>

			<div class="row">
				<div class="small-12 columns text-center">
					<i class="fi-dislike"></i>
				</div>
			</div>

			<div class="row">
				<div class="small-12 columns text-center">
					<i class="fi-star"></i>
				</div>
			</div>
		</div>

		<div class="small-8 large-10 columns">
			<p class="question-text">Que tipo de gomas são vendidas na D. Beatriz?</p>
			<p class="text-right question-author"><a href="#">@ferrolho</a></p>
			<p class="text-right question-date">00h15 - 15 Jan 2015</p>
		</div>

		<div class="small-10 columns comments">
			<hr>
			<p>também gostava de saber <a href="#">@zoid</a></p>
		</div>
	</div>

	<hr>

	<div class="row upvote checked-answer">
		<div class="small-4 large-2 columns">
			<div class="row">
				<div class="small-12 columns text-center">
					<i class="fi-like"></i>
				</div>
			</div>

			<div class="row">
				<div class="small-12 columns text-center">
					<p class="score">3004</p>
				</div>
			</div>

			<div class="row">
				<div class="small-12 columns text-center">
					<i class="fi-dislike"></i>
				</div>
			</div>

			<div class="row">
				<div class="small-12 columns text-center">
					<i class="fi-check"></i>
				</div>
			</div>
		</div>

		<div class="small-8 large-10 columns">
			<p>Marshmallows e aquelas gomas ácidas.</p>
			<p class="text-right question-author"><a href="#">@botas</a></p>
			<p class="text-right question-date">00h30 - 15 Jan 2015</p>
		</div>
	</div>

	<hr class="dashed">

	<div class="row downvote">
		<div class="small-4 large-2 columns">
			<div class="row">
				<div class="small-12 columns text-center">
					<i class="fi-like"></i>
				</div>
			</div>

			<div class="row">
				<div class="small-12 columns text-center">
					<p class="score negative-score">-23</p>
				</div>
			</div>

			<div class="row">
				<div class="small-12 columns text-center">
					<i class="fi-dislike"></i>
				</div>
			</div>
		</div>

		<div class="small-8 large-10 columns">
			<p>A Dona Beatriz não vende gomas.</p>
			<p class="text-right question-author"><a href="#">@vecton</a></p>
			<p class="text-right question-date">00h36 - 15 Jan 2015</p>
		</div>

		<div class="small-10 columns comments">
			<hr>
			<p>LOL! Vende sim... <a href="#">@botas</a></p>
			<hr class="dashed">
			<p>^ isto. Estão logo à direita da entrada, a seguir aos frigoríficos. <a href="#">@mariamir</a></p>
			<hr class="dashed">
			<p>rime <a href="#">@ferrolho</a></p>
		</div>
	</div>

	<hr class="dashed">

	<form>
		<div class="row">
			<div class="small-12 columns">
				<label>Add answer
					<textarea placeholder="Your answer"></textarea>
				</label>
			</div>
		</div>

		<div class="row">
			<div class="small-12 columns">
				<a href="#" class="button small success">Post answer</a>
			</div>
		</div>
	</form>

</div>
<?php }} ?>
