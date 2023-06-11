require 'rails_helper'

RSpec.describe 'Home page', type: :feature do
  scenario 'render root path' do
    visit root_path
    expect(page).to have_content('Welcome To School')
  end
end