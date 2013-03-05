module Helper
  module Sleep
    
    def enable
      @enable_sleep = true
    end
    
    def disable
      @enable_sleep = false
    end
    
    def enable?
      sleep 10000 if @enable_sleep
    end
    
    module_function :enable,
                    :disable,
                    :enable?
    
  end
end
World(Helper::Sleep)