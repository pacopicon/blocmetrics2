class AddInstancesToEvents < ActiveRecord::Migration
  def change
    add_column :events, :instance, :integer
  end
end
