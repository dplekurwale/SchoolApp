require 'rails_helper'

RSpec.describe 'Course page', type: :feature do
  let(:user) { create(:admin_user) }
  let(:school1) { create(:school, created_by_admin_user_id: user.id) }
  let(:course1) { create(:course, school_id: school1.id) }
  let(:batch1)  { create(:batch, school_id: school1.id, course_id: course1.id) }

  before(:each) do
    school1
    course1
    batch1
    user.add_role :admin
    sign_in_admin_user(user)
    visit admin_batches_path
  end

  scenario 'list batches' do
    expect(page).to have_content('Batch')
    expect(page).to have_content(batch1.name)
    expect(page).to have_content(school1.name)
  end

  scenario 'create batch' do
    click_link 'New Batch'
    fill_in 'Name', with: 'Test Batch 1'
    select school1.name, from: 'School'
    select course1.name, from: 'Course'
    click_button 'Create Batch'
    expect(page).to have_content('Test Batch 1')
  end

  scenario 'update batch' do
    find("tr#batch_#{batch1.id} a.edit_link.member_link").click
    fill_in 'Name', with: 'Editing Batch'
    click_button 'Update Batch'
    expect(page).to have_content('Editing Batch')
  end

  scenario 'view batch' do
    find("tr#batch_#{batch1.id} a.view_link.member_link").click
    expect(page).to have_content('Batch Details')
    expect(page).to have_content(user.email)
  end

  scenario 'delete batch' do
    find("tr#batch_#{batch1.id} a.delete_link.member_link").click
    expect(page).to have_content('Batch was successfully destroyed.')
    expect(page).not_to have_content(batch1.name)
  end
end
