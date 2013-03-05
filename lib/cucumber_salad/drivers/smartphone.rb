Capybara.register_driver :smartphone do |app|
  driver = Capybara::Poltergeist::Driver.new(app, 
    :window_size => [320,480],
    :phantomjs_options => %w(--load-images=no --local-storage-quota=0 --proxy-type=none),
    :inspector => true,
    :js_errors => false
  )
  Helper::Driver.register(
    :smartphone,
    :poltergeist,
    "Mozilla/5.0 (iPhone; CPU iPhone OS 6_1 like Mac OS X) AppleWebKit/536.26 (KHTML, like Gecko) Version/6.0 Mobile/10B141 Safari/8536.25"
  )
  driver
end

Capybara.register_driver :smartphone_landscape do |app|
  driver = Capybara::Poltergeist::Driver.new(app, 
    :window_size => [480, 320],
    :phantomjs_options => %w(--load-images=no --local-storage-quota=0 --proxy-type=none),
    :inspector => true,
    :js_errors => false
  )
  Helper::Driver.register(
    :smartphone_landscape,
    :poltergeist,
    "Mozilla/5.0 (iPhone; CPU iPhone OS 6_1 like Mac OS X) AppleWebKit/536.26 (KHTML, like Gecko) Version/6.0 Mobile/10B141 Safari/8536.25"
  )
  driver
end