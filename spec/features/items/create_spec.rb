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
end