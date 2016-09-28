class ServicesController < ApplicationController

	before_action :find_service, except: [ :index, :new, :create ]

	def index
		@services = Service.all.order("created_at desc")
	end

	def new
		@service = Service.new
	end

	def create
		@service = Service.new(service_params)
		
		if @service.save
			flash[:success] = "Service created !"
			redirect_to @service
		else
			flash[:success] = "Could not be saved"
			render "new"
		end
	end

	def show

	end

	private

	def service_params
		params.require(:service).permit(:title, :description, :price, :delivery_time, :revisions, :requirements)
	end

	def find_service
		@service = Service.find(params[:id])
	end

end