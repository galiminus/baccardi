class AddUserRefToProjections < ActiveRecord::Migration
  def change
    add_reference :projections, :user, index: true
  end
end
