class User < ActiveRecord::Base
	has_secure_password

	has_many :reservations
	has_many :restaurants, through: :reservations

	validates :name, presence: [:true]
	validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, on: :create }
	validates :telephone, presence: [:true], :numericality=>{:only_integer=>:true}, length: { :maximum=>10 }
	validates :user_type, presence: [:true], :numericality=>{:only_integer=>:true, :message=>" - please select an account type"}
	


end
