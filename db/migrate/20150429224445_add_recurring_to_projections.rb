class AddRecurringToProjections < ActiveRecord::Migration
  def change
    add_column :projections, :recurring, :boolean
  end
end
