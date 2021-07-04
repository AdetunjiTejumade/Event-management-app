# frozen_string_literal: true
class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string :name
      t.text :description
      t.text :location
      t.datetime :start_date
      t.datetime :end_date
      t.boolean :paid, default: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
