module ResourceFull
  module CoreExtensions
    module Exception
      def to_xml(options = {})
        options[:indent] ||= 2
        options[:builder] ||= Builder::XmlMarkup.new(:indent => options[:indent])
        options[:builder].instruct! unless options[:skip_instruct]

        options[:builder].errors {
          options[:builder].error self.to_s
          options[:builder].error self.backtrace if options[:include_backtrace] == true
        }
      end

      def to_json(options = {})
        hash = {:text => self.to_s}
        hash[:backtrace] = self.backtrace if options[:include_backtrace] == true
        {"error" => hash}.to_json
      end
    end
  end
end

class Exception
  include ResourceFull::CoreExtensions::Exception
end
