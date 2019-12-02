json.extract! message, :id, :ciphertext, :sender_name, :receiver_name, :created_at, :updated_at
json.url message_url(message, format: :json)
