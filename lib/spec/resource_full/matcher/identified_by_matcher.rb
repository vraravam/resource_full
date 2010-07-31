module Spec
  module ResourceFull
    module Matcher
      class IdentifiedByMatcher
        def initialize(attribute)
          @expected_attribute = attribute.to_sym
        end

        def matches?(target)
          @target = target

          actual_attribute = @target.class.resource_identifier
          # TODO: Does not handle the case when its not a Proc 
          if !actual_attribute.nil? && actual_attribute.is_a?(Proc)
            actual_attribute = actual_attribute.call("ABC12")
          end
          actual_attribute == @expected_attribute
        end

        def description
          "be identified by #{@expected_attribute}"
        end

        def failure_message
          "expected #{@target} to be identified by #{@expected_attribute.inspect}, but didn't"
        end

        def negative_failure_message
          "expected #{@target} to not be identified by #{@expected_attribute.inspect}, but didn't"
        end
      end

      # Usage: MyClass.should be_identified_by(:attr)
      def be_identified_by(attribute)
        IdentifiedByMatcher.new(attribute)
      end
    end
  end
end
