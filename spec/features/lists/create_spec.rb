require 'spec_helper'

describe "Creating lists" do
  it "redirects to the list index page on success" do
    visit "/lists"
    click_link "New List"
    expect(page).to have_content("New list")

    fill_in "Title", with: "My todo list"
    fill_in "Description", with: "This is what I am doing today"
    click_button "Create List"

    expect(page).to have_content("My todo list")
  end

  it "displays an error when the list has no title" do
    expect(List.count).to eq(0)

    visit "/lists"
    click_link "New List"
    expect(page).to have_content("New list")

    fill_in "Title", with: ""
    fill_in "Description", with: "This is what I am doing today"
    click_button "Create List"

    expect(page).to have_content("error")
    expect(List.count).to eq(0)

    visit "/lists"
    expect(page).to_not have_content("This is what I am doing today")
  end
end