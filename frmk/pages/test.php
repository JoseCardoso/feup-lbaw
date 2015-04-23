<?php

include_once('../config/init.php');

$smarty->display($BASE_TEMPLATES.'questions/question.tpl');

/*$currentPage = isset($_GET['page']) ? $_GET['page'] : 'signIn';

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

/*switch ($currentPage) {
    default:
    case 'signIn':
        include TEMPLATES_PATH . '/authentication/sign-in.php';
        break;

    case 'signUp':
        include TEMPLATES_PATH . '/authentication/sign-up.php';
        break;

    case 'explore':
        include 'templates/explore.php';
        break;

    case 'contacts':
        include 'templates/contacts.php';
        break;

    case 'about':
        include 'templates/about.php';
        break;

    case 'profile':
        include 'templates/profile.php';
        break;

    case 'faq':
        include 'templates/faq.php';
        break;
}

include TEMPLATES_PATH . '/common/footer.tpl';*/
