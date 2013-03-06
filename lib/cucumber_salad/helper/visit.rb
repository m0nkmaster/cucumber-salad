module Helper
  module Visit
    def visit(*args)
      current_driver = Capybara.current_driver
      Helper::Stub.load_defaults
      Helper::Stub.write
      Capybara.current_session.visit "/"
      Helper::Driver.setup current_driver
      Helper::Cookie.send_to_driver current_driver
      Helper::Sleep.enable?
      Capybara.current_session.visit *args
    end
  end
end