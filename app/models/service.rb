class Service < ActiveRecord::Base

	validates :title, presence: true
	validates :description, presence: true
	validates :price, presence: true, numericality: { only_integer: true }

end