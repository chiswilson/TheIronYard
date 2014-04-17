class Dvd < ActiveRecord::Base
  validates :title, presence: true, length: {minimum: 2}
  validates :year, presence:  true, length: {is: 4}

end
