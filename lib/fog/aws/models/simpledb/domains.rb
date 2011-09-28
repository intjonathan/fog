require 'fog/core/model'
module Fog
  module AWS
    class SimpleDB
      class Domains < Fog::Collection
        model Fog::AWS::SimpleDB::Domain
        
        def all
          connection.list_domains.body[]
        end
      end
    end
  end
end
