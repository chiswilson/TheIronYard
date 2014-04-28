class Hospital < ActiveRecord::Base
	validates :name, presence: true
	validate :validate_stuff
	
    has_many :hpconnects
    has_many :patients, through: :hpconnects

    has_many :doctors, as: :curable

	

	def validate_stuff
		if self.name == "shit"
			errors.add(:name, "you cant name a hospital that!")
		end

	end
end
