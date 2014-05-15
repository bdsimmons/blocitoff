require 'spec_helper'
include Warden::Test::Helpers
Warden.test_mode!

describe "Creating lists" do
  let!(:user) { FactoryGirl.create(:user) }
  login_user

  def create_list(options={})
    options[:title] ||= "My todo list"
    options[:description] ||= "This is what I'm doing today"

    visit "/lists"
    click_link "New List"
    expect(page).to have_content("New list")

    fill_in "Title", with: options[:title]
    fill_in "Description", with: options[:description]
    click_button "Create List"
  end

  it "redirects to the list index page on success" do
    create_list
    expect(page).to have_content("My todo list")
  end

  it "displays an error when the list has no title" do
    expect(List.count).to eq(0)

    create_list title: ""

    expect(page).to have_content("error")
    expect(List.count).to eq(0)

    visit "/lists"
    expect(page).to_not have_content("This is what I am doing today")
  end

  it "displays an error when the list has a title less than 3 characters" do
    expect(List.count).to eq(0)

    create_list title: "Hi"

    expect(page).to have_content("error")
    expect(List.count).to eq(0)

    visit "/lists"
    expect(page).to_not have_content("This is what I am doing today")
  end

  it "displays an error when the list has no description" do
    expect(List.count).to eq(0)

    create_list description: ""

    expect(page).to have_content("error")
    expect(List.count).to eq(0)

    visit "/lists"
    expect(page).to_not have_content("Grocery list")
  end

  it "displays an error when the list has a description less than 5 characters" do
    expect(List.count).to eq(0)

    create_list description: "Food"

    expect(page).to have_content("error")
    expect(List.count).to eq(0)

    visit "/lists"
    expect(page).to_not have_content("This is what I am doing today")
  end
end