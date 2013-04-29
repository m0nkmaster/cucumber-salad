Capybara.register_driver :safari do |app|
  driver = Capybara::Poltergeist::Driver.new(app, 
    :window_size => [1024,768],
    :phantomjs_options => %w(--load-images=no --local-storage-quota=0 --proxy-type=none),
    :inspector => true,
    :js_errors => false
  )
  Helper::Driver.register(
    :smartphone,
    :poltergeist
  )
  driver
end