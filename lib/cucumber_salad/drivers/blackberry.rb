Capybara.register_driver :blackberry do |app|
  driver = Capybara::Poltergeist::Driver.new(app, 
    :window_size => [220,200],
    :phantomjs_options => %w(--load-images=no --local-storage-quota=0 --proxy-type=none),
    :inspector => true,
    :js_errors => false
  )
  Helper::Driver.register(
    :blackberry,
    :poltergeist,
    "BlackBerry8530/5.0.0.337 Profile/MIDP-2.1 Configuration/CLDC-1.1 VendorID/105"
  )
  driver
end