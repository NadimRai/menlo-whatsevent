class Category < ApplicationRecord
	validates :name, presence: true, length: {minimum: 4}
	validates_uniqueness_of :name

	has_many :events
end
