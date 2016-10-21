json.extract! target, :id, :list_id, :name, :email, :created_at, :updated_at
json.url target_url(target, format: :json)