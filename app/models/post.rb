class Post < ActiveRecord::Base
	extend FriendlyId
	friendly_id :name, use: [:slugged, :finders]
	validates :name, presence: true
	validates :title, presence: true, length: {minimum: 5}

	has_attached_file :image
	validates_attachment_content_type :image, content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"]

end
