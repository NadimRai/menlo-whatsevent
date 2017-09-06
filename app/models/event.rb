class Event < ApplicationRecord
	validates :title, presence: true, length: {minimum: 5}
	validates :venue, presence: true
	validates :location, presence: true

	belongs_to :organizer, class_name: "User", foreign_key: "user_id"
	belongs_to :category
	has_many :comments, dependent: :destroy
	has_many :attendances, dependent: :destroy
	has_many :attendees, through: :attendances
	has_many :likes, dependent: :destroy

	has_attached_file :image, styles: { medium: "848x400>", thumb: "150x150>" }, default_url: "/images/:style/missing.png"
  	validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  	def self.search(search)
  		where("title LIKE ?", "%#{search}%") 
	end

	def seats_left
		seats - attendees.count
	end

	def seats_left?
		seats == attendees.count
	end


	def likes_total
    	self.likes.where(like: "like").count
  	end

	  def dislikes_total
	    self.likes.where(like: "dislike").count
	  end
end
