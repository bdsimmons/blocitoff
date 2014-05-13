require 'spec_helper'

describe "Adding items" do
  let!(:list) { List.create(title: "Groceries", description: "Grocery list.") }

  def visit_list(list)
    visit "/lists"
    within "#list_#{list.id}" do
      click_link "List Items"
    end
  end

  it "is successful with valid content" do
    visit_list(list)
    click_link "New Item"
    fill_in "Content", with: "Milk"
    click_button "Save"
    expect(page).to have_content("Added list item.")
    within("ul.items") do
      expect(page).to have_content("Milk")
    end
  end

  it "displays an error with no content" do
    visit_list(list)
    click_link "New Item"
    fill_in "Content", with: ""
    click_button "Save"

    within("div.flash") do
      expect(page).to have_content("There was a problem adding that list item.")
    end
    expect(page).to have_content("Content can't be blank")
  end

  it "displays an error with content less than 2 characters long" do
    visit_list(list)
    click_link "New Item"
    fill_in "Content", with: "1"
    click_button "Save"

    within("div.flash") do
      expect(page).to have_content("There was a problem adding that list item.")
    end
    expect(page).to have_content("Content is too short")
  end

end