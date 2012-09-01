This is a simple forum software created so I could learn rails.

It currently supports an interface for creating and managing forums for the admin and 5 power levels, 3 being the highest and -1 being the lowest, 3 acting as admin and -1 acting as a banned user (will probably add more negatives to allow for different levels of banned). Currently, power level can only be set by manually messing with the database, but that will change once I add controls to users for admins.

To use:

	Required software:
		Ruby (and gem)
		Rails
		Some server to host your files (I use apache with the passenger mod, but you can set it up however you want)
		MySQL
		
	First, install Ruby either through your package manager or build from source on linux, get an installer on windows or mac. 
	Install rails using gem
	Set up your server to take rails (this step depends on the server you are using, with apache you need to install passenger and run the apache-passenger installer, there are directions online for this step)
	Change to the directory where you will host this forum and clone the repository ("git clone git@gitorious.org:rorforum/rorforum.git")
	After the repository is cloned, enter the directory and run "rails exec bundle install" to install all the required gems
	Run "rake db:create"
	Run "rake db:migrate"
	The "main forum" is created by running "rake db:init_forum[forumname, forumdescription, adminusername, adminemail, adminpassword]"
		forumname: This is the name of your forum, it is displayed at the top of every page
		forumdescription: This is the description of your forum, it is displayed below the forum name
		adminusername: Username of the admin user
		adminemail: Email for the admin user
		adminpassword: Password for the admin user
	For instance, if you were to run: rake db:init_forum["HuFlungDu's forum of awesome", "An awesome forum", "HuFlungDu", "HuFlungDu@email.com", "foobar"]
		it would create a forum called "HuFlungDu's forum of awesome" with a description "An awesome forum". It would also create the user "HuFlungDu" with the given email and password who would be given admin powers.
	After this, everything else can be handled within the forum software itself, via the admin panel provided through the forum.