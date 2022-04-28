## README ##
This project contains a web application for browsing OSU courses, specifically CSE, and their respective sections. The project uses OSU API to retrieve the list of courses and sections which are then stored in a local SQLite database. These then can be browsed by Students, Instructors, and Admins meanwhile approved Admins can add, edit, and delete courses and sections. Approved Admins also has the functionality to approve admins and instructors and approved Admins can reload the course database. All types of users can edit their passwords or delete their profiles. 

#### Pre-Installation Requirements ####
1. Must have git installed
2. Must have node.js installed
3. Must have ruby rails installed

### Installation Instructions ###
1. Clone this repository using ```git clone git@github.com:cse-3901-sharkey/team-1.git```
2. Enter the git directory, and enter the 'lab-2' directory
3. Run the command ```npm i```
4. Run the command ```bundle install```
5. Run the command ```rake db:migrate```
6. Run the command ```rake db:seed```

### Starting the Application ###
1. Run the command ```rails s``` and go to http://127.0.0.1:3000/ on your web browser once the server starts
2. Login as the default admin user. The email is "admin.1@osu.edu" and the password is "password", both without the quotes

### Registering new users ###
1. Logout if you are logged in
2. Click "Register an Account"
3. Enter user credentials
4. If the user is a student, they will automatically be created. Instructors and new admins have to be approved by existing admins

### Viewing the Course Catalog ###
Click on the courses button to view the course catalog

## Student Functionality ##
Students may submit applications to become graders by clicking on the Grader Application button on their home page. If they have already submitted an application, they will be able to edit it by clicking the same button

## Instructor Functionality ##
Instructors can write recommendations for students by clicking the Recommendations buttons from their home page. Select a student, and then write a recommendation for them. Recommendations can not later be retracted or edited by design, so make sure to write a good recommendation

## Admin Functionality ##
The below functionality is only available to admin users

### Approving a User ###
1. Go to "Admin Functions"
2. Approve the newly registered user

### Assigning Graders ###
1. Go to "Admin Functions"
2. Under grader applications, click on "View Form"
3. If there are recommendation for the student, you can view them by clicking on view recommendation
4. Search for the course the student wishes to grade for on the right
5. Find a section that matches the student's availability
6. Click Assign Grader to assign the student to grade that section, you may assign a student to multiple section of varying courses
7. Once you are done assigning the student to sections (or no sections), you may delete the form by clicking delete form

### Refreshing the database ###
Click the refresh database button on the admin page

### Editing Courses and Sections ###
1. On the course catalog click "Edit" next to a course or section
2. Update the information accordingly and click the button to save

### Deleting Courses and Sections ###
Next to a section or Course you wish to delete,click the delete button. Deleting a course will delete all of its sections

### Adding a section or course ###
Click the add Course/Section button and fill in the necessary information


### Troubleshooting ###
If the course database is empty:
An approved admin must reload the course database.
If an admin can't add/edit/delete any courses/sections:
The admin must be approved to use these funcitonalities, so have an already approved admin approve this admin.
Who is the original approved admin?
This can be found in the "Starting the Application" part of the README
What if the approved admin is deleted?
This can be reset by rake db:drop, rake db:migrate, and rake db:seed commands in sequential order. This also can be used if there are any issues on the database side.
