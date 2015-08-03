require "rails_helper"

RSpec.feature "User creation", type: :feature do
  scenario "User creates a new account" do
    visit "/"
    # Redirects to Login page

    click_button "Create Account"
    # Opens new user form

    fill_in "First Name", with: "Jane"
    fill_in "Last Name", with: "Doe"
    fill_in "Email", with: "jane@doe.com"
    fill_in "Password", with: "password"
    click_button "Create Account"
    # Redirects to Dashboard

    expect(page).to have_content("Jane Doe")
    expect(page).to have_content("Available: 0")
    expect(page).to have_content("Redeemed: 0")
    expect(page).to have_content("Total Earned: 0")
    # Expect Rewards section to be empty
  end
end
