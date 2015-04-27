<?php

include_once('config/paths-init.php');
include_once('config/init.php');
include_once('config/phpmailer.php');

$currentPage = isset($_GET['page']) ? $_GET['page'] : 'signIn';

/*
$pagesWithMandatoryLogin = array(
	'profile'
	);

// if the current page is one of the pages with mandatory login
foreach ($pagesWithMandatoryLogin as $page) {
	// and user is not logged in
	if ($currentPage === $page && $_SESSION['username'] === null) {
		echo "
		<script type=\"text/javascript\">
			window.alert('You are not signed in.');
			window.location.href = 'index.php';
		</script>
		";

		// redirect to sign in page
		$currentPage = 'signIn';
		break;
	}
}
*/

switch ($currentPage) {
	// authentication
	default:
	case 'signIn':
	include $BASE_DIR . '/pages/authentication/sign-in.php';
	break;

	case 'signUp':
	include $BASE_DIR . '/pages/authentication/sign-up.php';
	break;

	case 'requestPasswordRecovery':
	include $BASE_DIR . '/pages/authentication/request-password-recovery.php';
	break;

	case 'recoverPassword':
	include $BASE_DIR . '/pages/authentication/recover-password.php';
	break;

	// navbar
	case 'explore':
	include $BASE_DIR . '/pages/menus/explore.php';
	break;

	case 'contacts':
	include $BASE_DIR . '/pages/menus/contacts.php';
	break;

	case 'about':
	include $BASE_DIR . '/pages/menus/about.php';
	break;

	case 'faq':
	include $BASE_DIR . '/pages/menus/faq.php';
	break;

	// profile
	case 'profile':
	include $BASE_DIR . '/pages/users/profile.php';
	break;
}
