# config/initializers/will_paginate.rb
if defined?(WillPaginate)
  module WillPaginate
    module ActiveRecord
      module RelationMethods
        alias_method :total_count, :count
        alias_method :per, :per_page
        alias_method :num_pages, :total_pages
      end
    end
  end
end
