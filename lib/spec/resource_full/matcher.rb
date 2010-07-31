require 'spec/resource_full/matcher/identified_by_matcher'

module Spec
  module ResourceFull
    # Spec::ResourceFull::Matcher provides several expectation matchers
    # intended to make life easier
    module Matcher
    end
  end
end

Spec::Runner.configure do |config|
  config.send(:include, Spec::ResourceFull::Matcher)
end
