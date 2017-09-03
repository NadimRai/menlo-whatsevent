class Event < ApplicationRecord
	validates :title, presence: true, length: {minimum: 5}
	validates :venue, presence: true
	validates :location, presence: true

	belongs_to :organizer, class_name: "User", foreign_key: "user_id"
end
