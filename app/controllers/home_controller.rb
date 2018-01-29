class HomeController < ApplicationController
  def index
  @index_page = true
	@services = Service.all
  	@title = "Bright Marketing ideas from The Content Market | Content Agency"
  	@meta_desc = "At the Content Market we don't do ordinary marketing. Agencies in Harrogate, London and Edinburgh."
    unless current_user.nil?
      unless current_user.email == "dan24797@gmail.com" || current_user.email == "cmadmin"
        redirect_to logout_path
      end
    end
  end
  def send_mail
    @name = params[:contact_name]
    @email = params[:contact_email]
    @message = params[:contact_message]
    ContactMailer.send_mail(@name, @email, @message).deliver_now
  end
end
