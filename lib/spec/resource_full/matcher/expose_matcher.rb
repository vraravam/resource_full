module Spec
  module ResourceFull
    module Matcher
      class ExposeMatcher
        def initialize(model_class)
          @expected_model_class = model_class
        end

        def matches?(target)
          @target = target.class.model_class
          @target == @expected_model_class
        end

        def description
          "be exposing #{@expected_model_class}"
        end

        def failure_message
          "expected #{@target} to be exposing #{@expected_model_class.inspect}, but didn't"
        end

        def negative_failure_message
          "expected #{@target} to not be exposing #{@expected_model_class.inspect}, but didn't"
        end
      end

      def expose(model_class)
        ExposeMatcher.new(model_class)
      end
    end
  end
end
