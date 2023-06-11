require 'rails_helper'

RSpec.describe 'Admin User page', type: :feature do
  let(:user) { create(:admin_user) }
  let(:admin_user) { create(:admin_user) }

  before(:each) do
    user
    user.add_role :admin
    admin_user
    admin_user.add_role :school_admin
    sign_in_admin_user(user)
    visit admin_admin_users_path
  end

  scenario 'list admin users' do
    expect(page).to have_content('Admin Users')
    expect(page).to have_content('admin')
    expect(page).to have_content(admin_user.email)
  end

  scenario 'create admin user' do
    click_link 'New Admin User'
    fill_in 'Email', with: 'testuser@example.com'
    fill_in 'admin_user[password]', with: 'password'
    fill_in 'admin_user[password_confirmation]', with: 'password'
    check 'school_admin'
    click_button 'Create Admin user'
    expect(page).to have_content('testuser@example.com')
  end

  scenario 'update admin user' do
    find("tr#admin_user_#{admin_user.id} a.edit_link.member_link").click
    fill_in 'Email', with: 'edituser@example.com'
    click_button 'Update Admin user'
    expect(page).to have_content('edituser@example.com')
  end

  scenario 'view admin user' do
    find("tr#admin_user_#{admin_user.id} a.view_link.member_link").click
    expect(page).to have_content('Admin User Details')
    expect(page).to have_content(admin_user.email)
  end

  scenario 'delete admin user' do
    find("tr#admin_user_#{admin_user.id} a.delete_link.member_link").click
    expect(page).to have_content('Admin user was successfully destroyed.')
    expect(page).not_to have_content(admin_user.email)
  end
end
