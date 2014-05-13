require 'spec_helper'

describe "Deleting lists" do
  let!(:list) { List.create(title: "Groceries", description: "Grocery list.") }

  it "is successful when clicking the destroy link" do
    visit "/lists"

    within "#list_#{list.id}" do
      click_link "Destroy"
    end
    expect(page).to_not have_content(list.title)
    expect(List.count).to eq(0)
  end
end