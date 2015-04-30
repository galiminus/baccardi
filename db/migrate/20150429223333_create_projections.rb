class CreateProjections < ActiveRecord::Migration
  def change
    create_table :projections do |t|

      t.timestamps
    end
  end
end
