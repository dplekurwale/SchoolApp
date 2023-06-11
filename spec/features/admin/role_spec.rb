require 'rails_helper'

RSpec.describe 'Role page', type: :feature do
  let(:user) { create(:admin_user) }
  let(:role) { create(:role, name: 'school_admin')}

  before(:each) do
    role
    user.add_role :admin
    sign_in_admin_user(user)
    visit admin_roles_path
  end

  scenario 'list roles' do
    expect(page).to have_content('Role')
    expect(page).to have_content(role.name)
  end

  scenario 'create role' do
    click_link 'New Role'
    fill_in 'Name', with: 'Test Role'
    click_button 'Create Role'
    expect(page).to have_content('Test Role')
  end

  scenario 'update role' do
    find("tr#role_#{role.id} a.edit_link.member_link").click
    fill_in 'Name', with: 'Editing Role'
    click_button 'Update Role'
    expect(page).to have_content('Editing Role')
  end

  scenario 'view role' do
    find("tr#role_#{role.id} a.view_link.member_link").click
    expect(page).to have_content('Role Details')
    expect(page).to have_content(role.name)
  end

  scenario 'delete role' do
    find("tr#role_#{role.id} a.delete_link.member_link").click
    expect(page).to have_content('Role was successfully destroyed.')
    expect(page).not_to have_content(role.name)
  end
end
