require 'spec_helper'

describe "Editing items" do
  let!(:list) { List.create(title: "Groceries", description: "Grocery list.") }
  let!(:item) { list.items.create(content: "Milk") }

  def visit_list(list)
    visit "/lists"
    within "#list_#{list.id}" do
      click_link "List Items"
    end
  end

  it "is successful" do
    visit_list(list)
    within "#item_#{item.id}" do
      click_link "Delete"
    end
    expect(page).to have_content("List item was deleted.")
    expect(Item.count).to eq(0)
  end
end