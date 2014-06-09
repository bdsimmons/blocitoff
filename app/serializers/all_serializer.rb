class AllSerializer < ActiveModel::Serializer
  attributes @params

  def initialize(params={})
    super
    @params = params
  end

  def created_at
    object.created_at.strftime('%B %d, %Y')
  end
end
