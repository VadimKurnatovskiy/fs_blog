require "rails_helper"

feature "As user I can search posts" do

  scenario "with title query parameters" do
    fill_in :search, with: "MyString"
    click_button "Search"
    expect(page).to have_content "MyString"
  end

  scenario "with description query parameters" do
    fill_in :search, with: "Some"
    click_button "Search"
    expect(page).to have_content "Some"
  end

  scenario "with empty parameters" do
    fill_in :search, with: ""
    click_button "Create Course"
    expect(page).to have_content "No results"
  end

end
