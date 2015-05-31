class Projection < ActiveRecord::Base
  belongs_to :user

  validates :label, presence: true
  validates :variation, presence: true, numericality: true
end
