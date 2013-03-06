Before do
  Helper::Stub.clear
end

Before "@sleep" do
  @sleep_enabled = true
end

After "@sleep" do
  @sleep_enabled = false
end