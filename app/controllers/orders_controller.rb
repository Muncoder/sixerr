class OrdersController < ApplicationController

	before_action :authenticate_user!

	# def create
	# 	@order = current_user.orders.create(order_params)
	# 	redirect_to user_orders_path
	# end

	def user_orders
		@orders = current_user.orders
	end

	def user_sales
		@services = current_user.services
	end

	def destroy
		@order = Order.find(params[:id])
		@order_title = @order.service.title
		if @order.delete
			flash[:success] = "#{@order_title} deleted successfully "
			redirect_to :back
		else
			flash[:success] = "Error ! could not be deleted !"
			redirect_to :back
		end
	end


end