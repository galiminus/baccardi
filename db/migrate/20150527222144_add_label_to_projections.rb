class AddLabelToProjections < ActiveRecord::Migration
  def change
    remove_reference :projections, :tag
    add_column :projections, :label, :text
  end
end
