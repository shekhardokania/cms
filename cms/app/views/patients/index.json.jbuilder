json.array!(@patients) do |patient|
  json.extract! patient, :name, :email, :age, :sex, :phone
  json.url patient_url(patient, format: :json)
end
