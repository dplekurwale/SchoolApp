require 'rails_helper'

RSpec.describe 'Course page', type: :feature do
  let(:user) { create(:admin_user) }
  let(:school1) { create(:school, created_by_admin_user_id: user.id) }
  let(:course1) { create(:course, school_id: school1.id) }
  let(:course2) { create(:course, school_id: school1.id) }

  before(:each) do
    school1
    course1
    course2
    user.add_role :admin
    sign_in_admin_user(user)
    visit admin_courses_path
  end

  scenario 'list courses' do
    expect(page).to have_content('Course')
    expect(page).to have_content(course1.name)
    expect(page).to have_content(school1.name)
  end

  scenario 'create course' do
    click_link 'New Course'
    fill_in 'Name', with: 'Test Course 1'
    select school1.name, from: 'School'
    click_button 'Create Course'
    expect(page).to have_content('Test Course 1')
  end

  scenario 'update course' do
    find("tr#course_#{course1.id} a.edit_link.member_link").click
    fill_in 'Name', with: 'Editing Course'
    click_button 'Update Course'
    expect(page).to have_content('Editing Course')
  end

  scenario 'view course' do
    find("tr#course_#{course1.id} a.view_link.member_link").click
    expect(page).to have_content('Course Details')
    expect(page).to have_content(user.email)
  end

  scenario 'delete course' do
    find("tr#course_#{course1.id} a.delete_link.member_link").click
    expect(page).to have_content('Course was successfully destroyed.')
    expect(page).not_to have_content(course1.name)
  end
end
