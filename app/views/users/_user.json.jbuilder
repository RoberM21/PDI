json.extract! user, :id, :email, :token, :password_digest, :email_confirmed, :confirm_token, :created_at, :updated_at
json.url user_url(user, format: :json)