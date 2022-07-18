class AddBuildingToInformation < ActiveRecord::Migration[6.0]
  def change
    add_column :information, :building, :string
  end
end
