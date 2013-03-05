module Helper
  module Driver
    def self.register(name, driver, useragent)
      @drivers ||= {}
      @drivers[name] = {
        :driver => driver,
        :useragent => useragent
      }
    end
    
    def self.setup(driver)
      driver = self.get(driver)
      if driver
        self.init_driver(driver)
      end
    end
    
    def self.init_driver(driver)
      if driver[:driver] == :poltergeist
        Capybara.current_session.driver.headers = {"User-Agent" => driver[:useragent]}
      end
    end
    
    def self.get(driver)
      if @drivers and @drivers[driver]
        @drivers[driver]
      end
    end
  end
end