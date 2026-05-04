class ChangeDefaultToNotes < ActiveRecord::Migration[8.1]
  def change
    change_column_default :notes, :catalog_id, from: nil, to: 1
  end
end
