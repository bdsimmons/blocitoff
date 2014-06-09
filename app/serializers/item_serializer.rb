class ItemSerializer < ActiveModel::Serializer
  attributes :id, :list_id, :content, :created_at

  def created_at
    object.created_at.strftime('%B %d, %Y')
  end
end
