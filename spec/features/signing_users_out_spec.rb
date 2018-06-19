require 'rails_helper'

RSpec.feature "Signing out signed-in users" do

  before do
    @pablo = User.create!(email: "pablo@example.com", password: "password")
    visit '/'
    click_link "Sign in"
    fill_in "Email", with: @pablo.email
    fill_in "Password", with: @pablo.password
    click_button "Log in"
  end

  scenario do
    visit '/'
    click_link "Sign out"
    expect(page).to have_content('Signed out successfully.')
    expect(page).to not_have_content('Sign out')
  end

end
