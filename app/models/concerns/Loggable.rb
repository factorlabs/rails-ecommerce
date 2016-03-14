module Loggable
    extend ActiveSupport::Concern
    
    included do
        before_save :log
    end
    
    def log
        logger.debug "New product #{name} will be safed"
    end
end