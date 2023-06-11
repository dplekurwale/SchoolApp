require 'rails_helper'

RSpec.describe 'Student page', type: :feature do
  let(:user) { create(:admin_user) }
  let(:school1) { create(:school, created_by_admin_user_id: user.id) }
  let(:student) { create(:student, school_id: school1.id) }

  before(:each) do
    user
    user.add_role :admin
    school1
    student
    sign_in_admin_user(user)
    visit admin_students_path
  end

  scenario 'list students' do
    expect(page).to have_content('Students')
    expect(page).to have_content(student.name)
    expect(page).to have_content(student.email)
  end

  scenario 'create student' do
    click_link 'New Student'
    fill_in 'Name', with: 'Test Student 1'
    fill_in 'Email', with: 'teststudent1@email.com'
    select school1.name, from: 'School'
    click_button "Create Student"
    expect(page).to have_content('Test Student 1')
  end

  scenario 'update student' do
    find("tr#student_#{student.id} a.edit_link.member_link").click
    fill_in 'Name', with: 'Editing Student'
    click_button 'Update Student'
    expect(page).to have_content('Editing Student')
  end

  scenario 'view student' do
    find("tr#student_#{student.id} a.view_link.member_link").click
    expect(page).to have_content('Student Details')
    expect(page).to have_content(user.email)
  end

  scenario 'delete student' do
    find("tr#student_#{student.id} a.delete_link.member_link").click
    expect(page).to have_content('Student was successfully destroyed.')
    expect(page).not_to have_content(student.name)
  end
end
