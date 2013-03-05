require 'json'
module Helper
  module Stub
    
    def self.clear
      Dir.foreach self.stub_file_path do |file|
        next if file == '.' or file == '..' or file == '.svn'
        File.delete(File.join(self.stub_file_path, file))
      end
    end
    
    def self.init_stubs
      @stubs ||= {}
    end
    
    def self.register(key, value)
      self.init_stubs
      @stubs[key] = value
    end
    
    def self.register_default(key, value)
      self.init_stubs
      unless @stubs[key]
        self.register(key, value)
      end
    end
    
    def self.load_defaults
      Dir.glob(File.join(Helper::Environment.default_stub_path, '**/*')).each do |file|
        unless File.directory?(file)
          value = JSON.load(File.read(file))
          key = file.split('/').last
          self.register_default(key, value)
        end
      end
    end
    
    def self.create_key(class_name, method, parameters = nil)
      Digest::MD5.hexdigest([
        class_name,
        method,
        parameters
      ].delete_if{|value| value == nil}.to_json)
    end
    
    def self.write
      if @stubs
        self.write_to_store
      end
    end
    
    def self.write_to_store
      if Helper::Environment.remote?
        self.write_to_redis
      else
        self.write_to_file
      end
    end
    
    def self.write_to_redis
      @redis ||= Redis.new(:host => '176.34.255.217', :port => 6379)
      @redis.flushall
      @redis.pipelined do
        @stubs.each_pair do |key, value|
          @redis.set key, value.to_json
        end
      end
    end
    
    def self.write_to_file
      @stubs.each_pair do |key, value|
        path = self.stub_file_path + '/' + key
        File.open(path, 'w') {|f| f.write(value.to_json) }
      end
    end
    
    def self.stub_file_path
      Helper::Environment.stub_path
    end
    
  end
end

World(Helper::Stub)