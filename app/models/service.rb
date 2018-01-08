class Service < ApplicationRecord
	has_attached_file :icon
	has_attached_file :banner
	validates_attachment_content_type :icon, content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"]
	validates_attachment_content_type :banner, content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"]
end
