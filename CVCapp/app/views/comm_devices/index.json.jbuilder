json.array!(@comm_devices) do |comm_device|
  json.extract! comm_device, :id
  json.url comm_device_url(comm_device, format: :json)
end
