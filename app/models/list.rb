class List < ActiveRecord::Base
  belongs_to :user

  validates :title, presence: true, length: { minimum: 3 }
end
