class Opening < ApplicationRecord
	validates :name, presence: true, format: { with: /\A([a-zA-Z0-9]*\s*\.*)*\z/, message: "only allows letters, numbers, spaces." }

	validates :move_sequence, presence: true, format: { with: /\A(([a-hA-H][1-8])*\s((\-\-)*\s)*)+([0-9][0-9]?\-[0-9][0-9]?)?\s*([a-hA-H][1-8])?\z/, message: "wrong format."}
	
	validates :user_id, presence: true
	
	validates :play_color, presence: true

	before_validation :convertMovementScript
	def convertMovementScript()
		for i in 1..33
			move_sequence.sub!(i.to_s+'. ', '')
			move_sequence.sub!("\n", ' ')
			move_sequence.sub!("\r", '')
		end
	end
end