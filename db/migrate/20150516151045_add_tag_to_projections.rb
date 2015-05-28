class AddTagToProjections < ActiveRecord::Migration
  def change
    add_reference :projections, :tag, index: true
  end
end
