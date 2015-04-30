class AddVariationToProjections < ActiveRecord::Migration
  def change
    add_column :projections, :variation, :float
  end
end
