json.extract! incidence, :id, :tipo, :prioridad, :estado, :comentario, :created_at, :updated_at
json.url incidence_url(incidence, format: :json)