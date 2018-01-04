json.extract! post, :id, :name, :title, :content, :short_desc, :image, :created_at, :updated_at
json.url post_url(post, format: :json)
