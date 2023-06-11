require 'rails_helper'

RSpec.describe 'School page', type: :feature do
  let(:user) { create(:admin_user) }
  let(:school1) { create(:school, created_by_admin_user_id: user.id) }
  let(:school2) { create(:school, created_by_admin_user_id: user.id) }
  let(:school3) { create(:school, created_by_admin_user_id: user.id) }

  before(:each) do
    user
    user.add_role :admin
    school1
    school2
    school3
    sign_in_admin_user(user)
    visit admin_schools_path
  end

  scenario 'list schools' do
    expect(page).to have_content('School')
    expect(page).to have_content(school1.name)
    expect(page).to have_content(school1.address)
  end

  scenario 'create school' do
    click_link 'New School'
    fill_in 'Name', with: 'Test School 1'
    fill_in 'Address', with: 'Test School Address 1'
    click_button 'Create School'
    expect(page).to have_content('Test School 1')
  end

  scenario 'update school' do
    find("tr#school_#{school1.id} a.edit_link.member_link").click
    fill_in 'Name', with: 'Editing School'
    click_button 'Update School'
    expect(page).to have_content('Editing School')
  end

  scenario 'view school' do
    find("tr#school_#{school1.id} a.view_link.member_link").click
    expect(page).to have_content('School Details')
    expect(page).to have_content(user.email)
  end

  scenario 'delete school' do
    find("tr#school_#{school1.id} a.delete_link.member_link").click
    expect(page).to have_content('School was successfully destroyed.')
    expect(page).not_to have_content(school1.name)
  end
end
