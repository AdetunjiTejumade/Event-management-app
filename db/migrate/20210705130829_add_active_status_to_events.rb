class AddActiveStatusToEvents < ActiveRecord::Migration[6.0]
  def change
    add_column :events, :in_active, :boolean, default: false
  end
end
