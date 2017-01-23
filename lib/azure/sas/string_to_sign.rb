module Azure
  class SAS
    module StringToSign
      class Blob
        def initialize(canonicalized_resource, options)
          @canonicalized_resource = canonicalized_resource
          @options = options
        end

        def generate
          [
            @options.signedpermissions.to_s,
            (@options.signedstart && @options.signedstart.utc.iso8601),
            (@options.signedexpiry && @options.signedexpiry.utc.iso8601),
            @canonicalized_resource.to_s,
            @options.identifier.to_s
          ].compact.join("\n").force_encoding('UTF-8')
        end
      end
    end
  end
end
