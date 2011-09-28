require 'fog/core/model'
module Fog
  module AWS
    class SimpleDB
      class Domain < Fog::Model
        model Fog::AWS::SimpleDB::Domain
        
        identity :name, :alias => 'DomainName'

        def save
          requires :name
          connection.create_domain(name)
        end
        
        def destroy
          requires :name
          connection.delete_domain(name)
          true
        rescue Excon::Errors::NotFound
          false
        end
        
      end
    end
  end
end
