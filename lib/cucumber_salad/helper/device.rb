module Helper
  module Device
    def use_device(device)
      driver = driver_for_device(device)
      self.set_driver(driver)
    end
    
    protected
    
    def set_driver(driver)
      Capybara.current_driver = driver
    end
    
    def default_drivers
      {
        :desktop => :firefox,
        :tablet => :ipad,
        :smartphone => :smartphone,
        :feature_phone => :blackberry
      }
    end
    
    def driver_for_device(device)
      driver = ENV[device.to_s] || default_drivers[device]
      raise "Driver '#{driver}' does not exist. Please define a driver for :#{driver} in drivers/#{driver}.rb" unless Capybara.drivers.keys.include?(driver)
      driver
    end
  end
end

World(Helper::Device)