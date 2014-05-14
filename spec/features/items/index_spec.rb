require 'spec_helper'

describe "Viewing items" do
  let!(:list) { List.create(title: "Groceries", description: "Grocery list.") }

  it "displays the title of the list" do
    visit_list(list)
    within("h1") do
      expect(page).to have_content(list.title)
    end
  end

  it "displays no items when a list is empty" do
    visit_list(list)
    expect(page.all("ul.items li").size).to eq(0)
  end

  it "displays item content when a list has items" do
    list.items.create(content: "Milk")
    list.items.create(content: "Eggs")

    visit_list(list)
    expect(page.all("ul.items li").size).to eq(2)

    within "ul.items" do
      expect(page).to have_content("Milk")
      expect(page).to have_content("Eggs")
    end
  end
end