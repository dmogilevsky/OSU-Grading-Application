## Introduction ##
This project contains a web application for browsing OSU courses and their respective sections. The project uses OSU API to retrieve a list of courses and sections which are then stored in a local SQLite database.

#### Pre-Installation Requirements ####
1. Must have git installed
2. Must have node.js installed
3. Must have ruby rails installed

### Installation Instructions ###
1. Clone this repository using ```git clone git@github.com:cse-3901-sharkey/team-1.git```
2. Enter the git directory, and enter the 'lab-2' directory
3. Enter the RubyRails directory
4. Run the command ```npm i```
5. Run the command ```bundle install```
6. Run the command ```rake db:migrate```
7. Run the command ```rake db:seed```

### Starting the Application ###
1. Run the command ```rails s``` and go to http://127.0.0.1:3000/ on your web browser once the server starts
2. Login as the default admin user. The email is "admin.1@osu.edu" and the password is "password", both without the quotes
3. For first time configuration, go to "Admin" and click the button to reload the database.

### Registering new users ###
1. Logout if you are logged in
2. Click "Register an Account"
3. Enter user credentials
4. If the user is a student, they will automatically be created. Instructors and new admins have to be approved by existing admins

### Viewing the Course Catalog ###
Click on the courses button to view the course catalog

## Admin Functionality ##
The below functionality is only available to admin users

### Approving a User ###
1. Login as an existing admin
2. Go to "Admin Functions"
3. Approve the newly registered user

### Refreshing the database ###
Click the refresh database button on the admin page

### Editing Courses and Sections ###
1. On the course catalog click "Edit" next to a course or section
2. Update the information accordingly and click the button to save

### Deleting Courses and Sections ###
Next to a section or Course you wish to delete,click the delete button. Deleting a course will delete all of its sections

### Adding a section or course ###
Click the add Course/Section button and fill in the necessary information
