json.extract! appointment, :id, :patient_id, :doctor_id, :diseases, :created_at, :updated_at
json.url appointment_url(appointment, format: :json)
