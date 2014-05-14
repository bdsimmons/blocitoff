require 'spec_helper'

describe "Completing items" do
  let!(:list) { List.create(title: "Groceries", description: "Grocery list.") }
  let!(:item) { list.items.create(content: "Milk") }

  it "is successful when marking a single item complete" do
    expect(item.completed_at).to be_nil
    visit_list list
    within dom_id_for(item) do
      click_link "Mark Complete"
    end
    item.reload
    expect(item.completed_at).to_not be_nil
  end
end