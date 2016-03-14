class Product < ActiveRecord::Base
    has_and_belongs_to_many :tags
    has_many :search_indices
    belongs_to :category
    has_many :orders
    has_many :users, :through => :orders
    
    include Loggable
    include Indexable
    
    def tag_list
      self.tags.map {|t| t.name }.join(", ")
    end
    def tag_list=(tag_list)
      self.tags.clear # For the update method, just in case we're changing tags
      
      # Split the tags into an array, strip whitespace , and convert to lowercase
      tags = tag_list.split(",").collect{|s| s.strip.downcase}
     
      # For each tag, find or create by name, and associate with the post
      tags.each do |tag_name|
        tag = Tag.find_or_create_by(name: tag_name)
        # tag.name = tag_name      
        self.tags << tag # Append the tag to the post
      end
    end
end
