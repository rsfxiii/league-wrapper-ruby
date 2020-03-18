require "lolruby/version"
require "lolruby/api"

module Lolruby
  class Error < StandardError; end

  class CLI
  end

  class API
    def self.call(endpoint, method, *params)
      # TODO: Check that ENDPOINT exists in API import
        # TODO: IF SO, Check that METHOD exists in API[:ENDPOINT]
        # TODO: IF SO, continue with PARAMS
      # ELSE: ERR/EXIT
    end
  end
end
