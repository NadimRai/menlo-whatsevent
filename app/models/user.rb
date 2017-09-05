class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :organized_events, class_name: "Event", dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :attendances
  has_many :attended_events, through: :attendances

  def full_name
  		"#{first_name} #{last_name}"
  	end
end
