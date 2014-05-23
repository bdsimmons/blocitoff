require 'spec_helper'

describe "Editing items" do
  let!(:list) { List.create(title: "Groceries", description: "Grocery list.") }
  let!(:item) { list.items.create(content: "Milk") }

  it "is successful with valid content" do
    visit_list(list)
    within "#item_#{item.id}" do
      click_link "Edit"
    end
    fill_in "Content", with: "Lots of Milk"
    click_button "Save"
    expect(page).to have_content("Saved list item.")
    item.reload
    expect(item.content).to eq("Lots of Milk")
  end

  it "is unsuccessful with no content" do
    visit_list(list)
    within "#item_#{item.id}" do
      click_link "Edit"
    end
    fill_in "Content", with: ""
    click_button "Save"
    expect(page).to_not have_content("Saved list item.")
    expect(page).to have_content("Content can't be blank")
    item.reload
    expect(item.content).to eq("Milk")
  end

  it "is unsuccessful with not enough content" do
    visit_list(list)
    within "#item_#{item.id}" do
      click_link "Edit"
    end
    fill_in "Content", with: "1"
    click_button "Save"
    expect(page).to_not have_content("Saved list item.")
    expect(page).to have_content("Content is too short")
    item.reload
    expect(item.content).to eq("Milk")
  end
end