class HomeController < ApplicationController
  def index
  end

  def send_mail
  	ActionMailer::Base.mail(to: 'dan24797@gmail.com',
         body: 'hello there',
         content_type: "text/plain",
         subject: "Already rendered!")
  end
end
