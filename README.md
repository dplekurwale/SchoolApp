# README

School App:
	App to handle admission and enrollment process of students for mulitple schools and assigned them to different courses. Student can request to join the batches and SchoolAdmin can approve/reject the request.

Rquirements:
	Ruby 3.2.2
	Rails 7.0.5

Gems Used:
	ActiveAdmin - Managing Admin portal
	Rolify - Managing user roles
	CanCan - To Manage authorization
	Devise - Handling Authentication
	Bootstrap - For Css
	Rspec - testing
	shoulda-matchers - testing
	capaybara - integration testing
	factory-girl - creating factories of test data

Getting Started:
	bundle install
	rake db:migrate
	rake db:seed -- it will create admin user (email: admin@example.com, password: password)
	rails server
	http://localhost:3000/admin -- Admin portal
	http://localhost:3000/ -- Student portal

Admin Functionality:
	Admin portal is used for creating schools, courses, batches, roles, admin users. Can manage whole portal.
	SchoolAdmin doesn't have access to roles, admin users and can update the school. Will be to see schools created by them. Other schools are not visible
	SchoolAdmin can approve the join request from student by editing the StudentBatches.
	Filters are avaliable at right side to filter the data.

Student Dashboard:
	Students are able to see all the batches in which they can enroll by click the join link. It will be in requested state until SchoolAdmin appoves it. Able to see other students info in the batch by clicking on batch name.

APIs are avaliable for Student Portal: 
	POST: /api/v1/auth/sign_in
	GET: /api/v1/batches
	GET: /api/v1/batch/:id
	GET: /api/v1/batch/:id/join

