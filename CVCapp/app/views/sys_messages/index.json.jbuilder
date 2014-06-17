json.array!(@sys_messages) do |sys_message|
  json.extract! sys_message, :id
  json.url sys_message_url(sys_message, format: :json)
end
