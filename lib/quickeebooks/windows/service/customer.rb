require 'quickeebooks/windows/service/service_base'

module Quickeebooks
  module Windows
    module Service
      class Customer < Quickeebooks::Windows::Service::ServiceBase

        def list(filters = [], page = 1, per_page = 20, sort = nil, options = {})
          custom_field_query = '<?xml version="1.0" encoding="utf-8"?>'
          custom_field_query += '<CustomerQuery xmlns="http://www.intuit.com/sb/cdm/v2">'
          custom_field_query += "<StartPage>#{page}</StartPage><ChunkSize>#{per_page}</ChunkSize>"
          custom_field_query += '</CustomerQuery>'
          fetch_collection(Quickeebooks::Windows::Model::Customer, custom_field_query.strip, filters, page, per_page, sort, options)
        end
        
        def fetch_by_id(id, idDomain = 'QB', options = {})
          url = "#{url_for_resource(Quickeebooks::Windows::Model::Customer::REST_RESOURCE)}/#{id}"
          fetch_object(Quickeebooks::Windows::Model::Customer, url, {:idDomain => idDomain})
        end

      end
    end
  end
end