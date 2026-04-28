class Note < ApplicationRecord
  validates :name, :link, presence: true
end
