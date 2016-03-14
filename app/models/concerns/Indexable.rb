module Indexable
    extend ActiveSupport::Concern
    
    included do
        after_save :index
    end
    
    def index
        # search_indices.clear
        SearchIndex.where(product: self).destroy_all
        words = description.split(/\W+/)
        words.each { |word|
            search_index = SearchIndex.new
            search_index.word = word
            search_index.product = self
            search_index.save!
        }
    end
end