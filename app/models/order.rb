class Order < ActiveRecord::Base
  belongs_to :user
  belongs_to :service

  before_save :set_order_price

  private
	def set_order_price
		self.total_price = self.quantity * self.price
  	end

end
