require 'spec_helper'

describe "Destroying items" do
  let!(:list) { List.create(title: "Groceries", description: "Grocery list.") }
  let!(:item) { list.items.create(content: "Milk") }

  it "is successful" do
    visit_list(list)
    within "#item_#{item.id}" do
      click_link "Delete"
    end
    expect(page).to have_content("List item was deleted.")
    expect(Item.count).to eq(0)
  end
end