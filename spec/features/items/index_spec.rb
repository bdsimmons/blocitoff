require 'spec_helper'

describe "Viewing items" do
  let!(:list) { List.create(title: "Groceries", description: "Grocery list.") }

  it "displays no items when a list is empty" do
    visit "/lists"
    within "#list_#{list.id}" do
      click_link "List Items"
    end
    expect(page).to have_content("Items#index")
  end
end