require 'spec_helper'

describe "Editing lists" do
  let!(:list) { List.create(title: "Groceries", description: "Grocery list.") }

  def update_list(options={})
    options[:title] ||= "My todo list"
    options[:description] ||= "This is what I'm doing today"
    list = options[:list]

    visit "/lists"
    within "#list_#{list.id}" do
      click_link "Edit"
    end

    fill_in "Title", with: options[:title]
    fill_in "Description", with: options[:description]
    click_button "Update List"
  end

  it "updated a list successfully with correct information" do    
    update_list list: list, title: "New title", description: "New description"
    list.reload
    expect(page).to have_content("List was successfully updated.")
    expect(list.title).to eq("New title")
    expect(list.description).to eq("New description")
  end

  it "displays an error with no title" do
    update_list list: list, title: ""
    title = list.title
    list.reload
    expect(list.title).to eq(title)
    expect(page).to have_content("error")
  end

  it "displays an error with too short a title" do
    update_list list: list, title: "hi"
    expect(page).to have_content("error")
  end

  it "displays an error with no description" do
    update_list list: list, description: ""
    expect(page).to have_content("error")
  end

  it "displays an error with too short a description" do
    update_list list: list, description: "hi"
    expect(page).to have_content("error")
  end
end