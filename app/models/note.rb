class Note < ApplicationRecord
  belongs_to :catalog
  # has_rich_text :description
  validates :name, :link, presence: true, uniqueness: true
end
