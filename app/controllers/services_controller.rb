class ServicesController < ApplicationController

	before_action :find_service, except: [ :index, :new, :create, :my_services ]

	def index
		@services = Service.all.order("created_at DESC")
	end

	def new
		@service = current_user.services.build
	end

	def create
		@service = current_user.services.build(service_params)
		
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

	def edit
	end

	def update
		if @service.update(service_params)
			flash[:success] = "Updated successfully"
			redirect_to services_path
		else
			flash[:success] = "Could not be updated"
			redirect_to :back
		end
	end

	def destroy
		if @service.delete
			flash[:success] = "Deleted successfully"
			redirect_to :back
		else
			flash[:success] = "Could not be deleted"
			redirect_to :back
		end
	end

	def my_services
		@services = current_user.services
	end

	private

	def service_params
		params.require(:service).permit(:title, :description, :price, :delivery_time, :revisions, :requirements, :image)
	end

	def find_service
		@service = Service.find(params[:id])
	end

end