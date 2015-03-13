<?php
require_once realpath(dirname(__FILE__) . "/config.php");

include TEMPLATES_PATH . '/header.php';

$currentPage = isset($_GET['page']) ? $_GET['page'] : 'signIn';

/*
$pagesWithMandatoryLogin = array(
	'feed',
	'myPolls',
	'profile',
	'signOut',
	'viewPoll',
	'viewPollResults',
	'search'
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
	default:
	case 'signIn':
	include 'templates/sign-in.php';
	break;

	case 'signUp':
	include 'templates/sign-up.php';
	break;
}

include 'templates/footer.php';
?>
