class List < ActiveRecord::Base
  belongs_to :user
  has_many :items

  validates :title, presence: true, length: { minimum: 3 }
  validates :description, presence: true, length: {minimum: 5 }

end
