class ImageController < ActionController::Base
  def index
  end
  def delete_file
  	File.delete("#{Rails.root}/public/#{params[:filename]}")
  	redirect_back fallback_location: root_path
  end
end
