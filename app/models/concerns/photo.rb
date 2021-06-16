class Photo

  def initialize(attributes)

    attributes.each do |k, v|
      define_singleton_method :"#{k}" do
       v
      end

      if v.class == Hash
        v.each do |k, v|
          define_singleton_method :"#{k}" do
            v
          end

          if v.class == Hash
            v.each do |k, v|
              define_singleton_method :"#{k}" do
                v
              end
            end
          end

        end
      end
      
    end
  end

end