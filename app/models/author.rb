class Author < ActiveRecord::Base
    validates :name, presence: true
    validates :phone_number, length: {in: 10..12}
    validates :phone_number, uniqueness: true
    validates :name, uniqueness: true
end
