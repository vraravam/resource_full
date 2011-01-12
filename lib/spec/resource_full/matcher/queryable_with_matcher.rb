module Spec
  module ResourceFull
    module Matcher
      class QueryableWithMatcher
        def initialize(attribute)
          @expected_attribute = attribute.to_sym
        end

        def matches?(target)
          @target = target

          @target.class.queryable_params.collect(&:name).include?(@expected_attribute)
        end

        def description
          "be queryable with #{@expected_attribute}"
        end

        def failure_message
          "expected #{@target} to be queryable with #{@expected_attribute.inspect}, but didn't"
        end

        def negative_failure_message
          "expected #{@target} to not be queryable with #{@expected_attribute.inspect}, but didn't"
        end
      end

      def be_queryable_with(attribute)
        QueryableWithMatcher.new(attribute)
      end
    end
  end
end
