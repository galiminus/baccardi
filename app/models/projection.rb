class Projection < ActiveRecord::Base
  belongs_to :user

  validates :label, presence: true
  validates :variation, presence: true, numericality: { greater_than: 0 }
end
