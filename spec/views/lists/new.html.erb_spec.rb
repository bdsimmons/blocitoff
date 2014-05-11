require 'spec_helper'

describe "lists/new" do
  before(:each) do
    assign(:list, stub_model(List,
      :title => "MyString",
      :description => "MyText",
      :user => nil
    ).as_new_record)
  end

  it "renders new list form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", lists_path, "post" do
      assert_select "input#list_title[name=?]", "list[title]"
      assert_select "textarea#list_description[name=?]", "list[description]"
      assert_select "input#list_user[name=?]", "list[user]"
    end
  end
end
