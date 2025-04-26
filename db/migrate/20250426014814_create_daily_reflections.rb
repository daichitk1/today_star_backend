class CreateDailyReflections < ActiveRecord::Migration[8.0]
  def change
    create_table :daily_reflections do |t|
      t.string :comment
      t.integer :rating
      t.timestamps
    end
  end
end
