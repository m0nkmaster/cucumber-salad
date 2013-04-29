module Helper
  module Environment
    
    def host(prefix = 'pal')
      app_host = "http://#{prefix}."
      if self.env == "sandbox"
       app_host << "sandbox.dev"
      else
       app_host << "#{self.env}"
      end
      "#{app_host}.bbc.co.uk"
    end
    
    def env
      ENV["TARGET_ENV"] || "sandbox"
    end
    
    def stub_path
      raise "Please set your stub path using Helper::Environment.stub_path = '/path'" unless @stub_path
      FileUtils.mkdir_p(@stub_path) unless Dir.exists?(@stub_path)
      @stub_path
    end
    
    def stub_path=(path)
      @stub_path = path
    end
    
    def default_stub_path
      raise "Please set your default stub path using Helper::Environment.default_stub_path = '/path'" unless @default_stub_path
      FileUtils.mkdir_p(@default_stub_path) unless Dir.exists?(@default_stub_path)
      @default_stub_path
    end
    
    def default_stub_path=(path)
      @default_stub_path = path
    end
    
    def proxy
      ENV["http_proxy"] || ""
    end
    
    def syd_proxy
      "http://www-cache-syd.reith.bbc.co.uk:80"
    end
    
    def allow_driver_override?
      true if ENV["device_override"]
    end
    
    def remote?
      self.env != "sandbox"
    end
    
    module_function :host,
                    :env,
                    :stub_path,
                    :stub_path=,
                    :default_stub_path,
                    :default_stub_path=,
                    :proxy,
                    :syd_proxy,
                    :allow_driver_override?,
                    :remote?
  end
end