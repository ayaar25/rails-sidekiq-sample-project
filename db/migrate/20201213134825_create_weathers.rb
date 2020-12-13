class CreateWeathers < ActiveRecord::Migration[6.1]
  def change
    create_table :weathers do |t|
      t.string :city
      t.float :temperature
      t.string :weather
      t.timestamps
    end
  end
end
