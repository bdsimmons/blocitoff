module ListHelpers
  def visit_list(list)
    visit "/lists"
    within dom_id_for(list) do
      click_link list.title
    end
  end
end