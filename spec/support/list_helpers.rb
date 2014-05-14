module ListHelpers
  def visit_list(list)
    visit "/lists"
    within "#list_#{list.id}" do
      click_link "List Items"
    end
  end
end