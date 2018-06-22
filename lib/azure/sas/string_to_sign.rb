module Azure
  class SAS
    module StringToSign
      module V20120212
        # @see https://docs.microsoft.com/en-us/rest/api/storageservices/fileservices/constructing-a-service-sas
        class Blob
          def initialize(canonicalized_resource, options)
            @canonicalized_resource = canonicalized_resource
            @options = options
          end

          def generate
            [
              @options.signedpermissions.to_s,
              (@options.signedstart && @options.signedstart.utc.iso8601).to_s,
              (@options.signedexpiry && @options.signedexpiry.utc.iso8601).to_s,
              @canonicalized_resource.to_s,
              @options.identifier.to_s,
              '2012-02-12'
            ].compact.join("\n").force_encoding('UTF-8')
          end
        end
      end

      module V20130815
        # @see https://docs.microsoft.com/en-us/rest/api/storageservices/fileservices/constructing-a-service-sas
        class Blob
          def initialize(canonicalized_resource, options)
            @canonicalized_resource = canonicalized_resource
            @options = options
          end

          def generate
            [
              @options.signedpermissions.to_s,
              (@options.signedstart && @options.signedstart.utc.iso8601).to_s,
              (@options.signedexpiry && @options.signedexpiry.utc.iso8601).to_s,
              @canonicalized_resource.to_s,
              @options.identifier.to_s,
              '2013-08-15'
            ].compact.join("\n").force_encoding('UTF-8')
          end
        end
      end
    end
  end
end
