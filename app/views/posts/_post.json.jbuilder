json.extract! post, :id, :name, :local, :type, :created_at, :updated_at
json.url post_url(post, format: :json)
