Capybara.register_driver :tablet do |app|
  driver = Capybara::Poltergeist::Driver.new(app, 
    :window_size => [1024,768],
    :phantomjs_options => %w(--load-images=no --local-storage-quota=0 --proxy-type=none),
    :inspector => true
  )
  Helper::Driver.register(
    :tablet,
    :poltergeist,
    "Mozilla/5.0 (iPad; CPU OS 6_0 like Mac OS X) AppleWebKit/536.26 (KHTML, like Gecko) Version/6.0 Mobile/10A5355d Safari/8536.25"
  )
  driver
end