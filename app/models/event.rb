class Event < ApplicationRecord
	validates :title, presence: true, length: {minimum: 5}
	validates :venue, presence: true
	validates :location, presence: true

	belongs_to :organizer, class_name: "User", foreign_key: "user_id"

	has_attached_file :image, styles: { medium: "848x400>", thumb: "150x150>" }, default_url: "/images/:style/missing.png"
  	validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  	def self.search(search)
  		where("title LIKE ?", "%#{search}%") 
	end
end
