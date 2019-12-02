json.extract! user, :id, :username, :password_digest, :pub_key, :pvt_key, :created_at, :updated_at
json.url user_url(user, format: :json)
