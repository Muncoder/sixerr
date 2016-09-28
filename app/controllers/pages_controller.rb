class PagesController < ApplicationController
  
  def home
  	@gigs = Service.all.order("created_at desc")
  end

end
