class CreateNotes < ActiveRecord::Migration[8.1]
  def change
    create_table :notes do |t|
      t.string :name
      t.string :link
      t.string :description

      t.timestamps
    end
  end
end
