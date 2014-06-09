class List < ActiveRecord::Base
  belongs_to :user
  has_many :items, dependent: :destroy

  validates :title, presence: true, length: { minimum: 3 }
  validates :description, presence: true, length: {minimum: 5 }
  validates :permissions, presence: true, :inclusion => { :in => %w(private viewable open) }

  def self.permission_options
    %w(private viewable open)
  end

  def has_completed_items?
    items.complete.size > 0
  end

  def has_incomplete_items?
    items.incomplete.size > 0
  end

end
