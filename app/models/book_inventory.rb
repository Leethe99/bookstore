class BookInventory < ApplicationRecord
    validates :title, presence: true
    validates :author , presence: true
    validates :year, presence: true
    validates :description, presence: true

end
