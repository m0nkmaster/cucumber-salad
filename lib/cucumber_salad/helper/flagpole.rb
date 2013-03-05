module Helper
  module Flagpole
    def self.set(flagpole, value)
      Helper::Cookie.add_test_cookie("fp-#{flagpole}", value)
    end
  end
end
World(Helper::Flagpole)