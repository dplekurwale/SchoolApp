require 'rails_helper'

RSpec.describe 'Student Batch page', type: :feature do
  let(:user) { create(:admin_user) }
  let(:school1) { create(:school, created_by_admin_user_id: user.id) }
  let(:course1) { create(:course, school_id: school1.id) }
  let(:batch1)  { create(:batch, school_id: school1.id, course_id: course1.id) }
  let(:batch2)  { create(:batch, school_id: school1.id, course_id: course1.id) }
  let(:student) { create(:student, school_id:school1.id) }
  let(:student_batch1) { create(:student_batch, batch_id: batch1.id, user_id: student.id)}

  before(:each) do
    school1
    course1
    batch1
    batch2
    student
    student_batch1
    user.add_role :admin
    sign_in_admin_user(user)
    visit admin_student_batches_path
  end

  scenario 'list batches' do
    expect(page).to have_content('Student Batches')
    expect(page).to have_content(batch1.name)
    expect(page).to have_content(student.name)
  end

  scenario 'add student to batch' do
    click_link 'New Student Batch'
    select batch2.name, from: 'Batch'
    select student.name, from: 'Student'
    select 'Approved', from: 'Status'
    click_button 'Create Student batch'
    expect(page).to have_content(batch2.name)
    expect(page).to have_content(student.name)
  end

  scenario 'update student batch' do
    find("tr#student_batch_#{student_batch1.id} a.edit_link.member_link").click
    select 'Rejected', from: 'Status'
    click_button 'Update Student batch'
    expect(page).to have_content('rejected')
  end

  scenario 'view student batch' do
    find("tr#student_batch_#{student_batch1.id} a.view_link.member_link").click
    expect(page).to have_content('Student Batch Details')
    expect(page).to have_content(student_batch1.status)
  end

  scenario 'delete batch' do
    find("tr#student_batch_#{student_batch1.id} a.delete_link.member_link").click
    expect(page).to have_content('Student batch was successfully destroyed.')
    expect(page).not_to have_content(batch1.name)
  end
end
