class Address
attr_accessor :kind, :street1, :street2, :city, :state, :zipCode

    def to_s(format = 'short')
        address = ''
        case format
        when 'long'
            address += "-#{kind}-\n#{street1} "
            if !street2.nil?
            address += "#{street2} \n" 
            end
            address += "#{city}, #{state}, #{zipCode}"
        when 'short'
            address += "#{kind}: #{street1}"
            if street2
                address += "#{street2}"
            end
            address += ", #{city}, #{state}, #{zipCode}"
        end

    end

end



