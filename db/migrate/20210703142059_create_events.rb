class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string :name
      t.text :description
      t.text :location
      t.time :start_date
      t.time :end_date
      t.time :start_time
      t.time :end_time
      t.boolean :paid
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
