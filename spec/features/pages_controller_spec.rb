require "rails_helper"

describe "GET landing_page", type: :feature do
  it "load landing_page" do
    visit root_path
    expect(page).to have_content 'Come play with us!'
  end
end