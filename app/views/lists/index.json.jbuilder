json.array!(@lists) do |list|
  json.extract! list, :id, :title, :description, :user_id
  json.url list_url(list, format: :json)
end
