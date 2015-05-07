<div class="contain-to-grid fixed nav-bar-border-top">
	<nav class="top-bar" data-topbar role="navigation">
		<ul class="title-area">
			<li class="name">
				<h1><a href="{$BASE_DIR}/pages/menus/explore.php">AskFEUP</a></h1>
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
					<a href="{$BASE_DIR}/pages/menus/explore.php"><i class="fi-compass nav-bar-icon"></i>Explore</a>
					<ul class="dropdown">
						<li><a href="{$BASE_DIR}/pages/menus/contacts.php"><i class="fi-address-book nav-bar-icon"></i>Contact us</a></li>
						<li><a href="{$BASE_DIR}/pages/menus/about.php"><i class="fi-torsos-all nav-bar-icon"></i>About us</a></li>
					</ul>
				</li>
                {if $username}
				<li class="has-dropdown">
					<a href="{$BASE_DIR}/pages/users/profile.php"><i class="fi-torso nav-bar-icon"></i>{$username}</a>
					<ul class="dropdown">
						<li><a href="{$BASE_DIR}/actions/authentication/sign-out.php"><i class="fi-lock nav-bar-icon"></i>Sign out</a></li>
					</ul>
				</li>
                {/if}
				<li><a href="{$BASE_DIR}/pages/menus/faq.php"><b class="nav-bar-icon">?</b>FAQ</a></li>
			</ul>
		</section>
	</nav>
</div>
<div class="nav-bar-margin-bottom"></div>