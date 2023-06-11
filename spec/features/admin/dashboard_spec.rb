require 'rails_helper'

RSpec.describe 'Dashboard page', type: :feature do
  before do
    @user = create(:admin_user)
    @user.add_role :admin
  end

  scenario 'render landing page with all links' do
    sign_in_admin_user(@user)
    expect(page).to have_content('School App')
    expect(page).to have_selector(:css, 'a[href="/admin/dashboard"]')
    expect(page).to have_selector(:css, 'a[href="/admin/students"]')
    expect(page).to have_selector(:css, 'a[href="/admin/schools"]')
    expect(page).to have_selector(:css, 'a[href="/admin/admin_users"]')
    expect(page).to have_selector(:css, 'a[href="/admin/courses"]')
    expect(page).to have_selector(:css, 'a[href="/admin/batches"]')
    expect(page).to have_selector(:css, 'a[href="/admin/roles"]')
    expect(page).to have_selector(:css, 'a[href="/admin/student_batches"]')
    expect(page).to have_selector(:css, 'a[href="/admin/logout"]')
  end
end
