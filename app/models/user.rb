class User < ApplicationRecord
	validates :username, presence: true, uniqueness: true, length: { minimum: 4 }, format: { with: /\A[a-zA-Z0-9]+\z/, 
	message: "only allows letters and numbers" }

	validates :email, presence: true, format: { with: /\A\S+\z/, message: "email don't allows blank spaces" }

	validates :name, presence: true, format: { with: /\A[a-zA-Z\s]+\z/, message: "only allows letters" }

	validates :password, presence: true, confirmation: true, length: { minimum: 8 },  format: { with: /\A^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,20}$\z/, 
	message: " Password must be at least 8 characters, no more than 20 characters, and must include at least one upper case letter, one lower case 
	letter, and one numeric digit."}

	validates :confirmationToken, presence: true, uniqueness: true

	before_validation :settingConfirmationToken
	def settingConfirmationToken
		if self.confirmationToken == nil
	    	self.confirmationToken = generateToken
	    end
	end

	def generateToken
		loop do
	    	token = SecureRandom.hex(10)
	      	break token unless User.where(confirmationToken: token).exists?
	    end
	end

end
