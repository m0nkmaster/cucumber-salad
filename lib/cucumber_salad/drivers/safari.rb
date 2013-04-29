Capybara.register_driver :safari do |app|
  driver = Capybara::Poltergeist::Driver.new(app, 
    :window_size => [1024,768],
    :phantomjs_options => %w(--load-images=no --local-storage-quota=0 --proxy-type=none),
    :inspector => true,
    :js_errors => false
  )
  Helper::Driver.register(
    :smartphone,
    :poltergeist,
    "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.29.13 (KHTML, like Gecko) Version/6.0.4 Safari/536.29.13"
  )
  driver
end