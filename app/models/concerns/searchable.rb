module Searchable
  extend ActiveSupport::Concern

  module ClassMethods
    def search(search_term=nil)
      where(['name LIKE ?', "%#{search_term}%"]).order(name: :asc)
    end
  end
end
