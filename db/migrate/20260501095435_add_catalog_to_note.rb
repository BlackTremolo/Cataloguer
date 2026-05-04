class AddCatalogToNote < ActiveRecord::Migration[8.1]
  def change
    add_reference :notes, :catalog, index: true, foreign_key: true
  end
end
