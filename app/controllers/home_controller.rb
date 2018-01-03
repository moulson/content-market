class HomeController < ApplicationController
  def index
  	@title = "Bright Marketing ideas from The Content Market | Content Agency"
  	@meta_desc = "At the Content Market we don't do ordinary marketing. Agencies in Harrogate, London and Edinburgh."
    unless current_user.nil?
      unless current_user.email == "dan24797@gmail.com" || current_user.email == "cmadmin"
        redirect_to logout_path
      end
    end
  end

  def send_mail
  	ActionMailer::Base.mail(to: 'dan24797@gmail.com',
         body: 'hello there',
         content_type: "text/plain",
         subject: "Already rendered!")
  end
end
