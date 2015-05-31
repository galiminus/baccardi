class Projection < ActiveRecord::Base
  belongs_to :user

  validates :label, presence: true
  validates :variation, presence: true, numericality: true

  default_scope { where('recurring or extract(month from created_at) = ?', Time.now.month) }
end
