module Slugifiable
  module ClassMethods
    def find_by_slug(slug)
      self.all.find{|obj| obj.slug == slug}
    end

  end 

  module InstanceMethods
    def slug
      if self.class.method_defined?(:username)
        self.username.gsub(/[^a-zA-Z\d\s]/, "").gsub(/[\s]/, "-").downcase
      elsif self.class.method_defined?(:name)
        self.name.gsub(/[^a-zA-Z\d\s]/, "").gsub(/[\s]/, "-").downcase
      end
    end

  end
end