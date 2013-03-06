require 'cgi'
module Helper
  module Cookie
    def self.init_cookies
      @cookies ||= {}
    end
    
    def self.all
      @cookies
    end
    
    def self.add(key, value, options = {})
      self.init_cookies
      @cookies[key] = {
        :value => value,
        :options => options
      }
    end
    
    def self.add_test_cookie(key, value)
      key = 'test-' + self.base64_encode(key)
      value = base64_encode value
      self.add(key, value)
    end
    
    def self.send_to_driver(driver)
      driver = Helper::Driver.get(driver)
      if driver
        self.set_cookies(driver)
      end
    end
    
    def self.set_cookies(driver)
      self.init_cookies
      if driver[:driver] == :poltergeist
        @cookies.keys.each do |key|
          cookie = @cookies[key]
          Capybara.current_session.driver.set_cookie(
            key,
            cookie[:value],
            :domain => self.domain_for_cookie(cookie)
          )
        end
      end
    end
    
    def self.domain_for_cookie(cookie)
      if cookie[:options][:domain]
        cookie[:options][:domain]
      end
    end
    
    def self.base64_encode(key)
      CGI.escape(Base64.encode64(key).gsub("\n", ""))
    end
    
    def self.reset
      @cookies = nil
    end
    
  end
end