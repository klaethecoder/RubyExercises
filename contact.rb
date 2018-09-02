require "./phoneNumber"
require "./address"
class Contact
    attr_writer :firstName, :middleName , :lastName 
    attr_reader :phoneNumbers, :addresses

    def initialize
        @phoneNumbers = []
        @addresses = []
    end

    def addPhone(kind, number)
        thePhone = Phone.new
        thePhone.kind = kind
        thePhone.number = number
        phoneNumbers.push(thePhone)
    end

    def addAddress(kind, street1, street2, city, state, zipCode)
        theAddress = Address.new
        theAddress.kind = kind
        theAddress.street1 = street1
        theAddress.street2 = street2
        theAddress.city = city
        theAddress.state = state
        theAddress.zipCode = zipCode
        addresses.push(theAddress)
    end

    def printAdd
        puts "Addresses: "
        addresses.each{|add| puts add.to_s('long')}
    end

    def firstName
        @firstName
    end

    def middleName
        @middleName
    end

    def lastName
        @lastName
    end

    def fullName
        fullName = firstName
        if !middleName.nil?
        fullName += " #{middleName.slice(0,1)}."
            fullName += " #{lastName}"
        else
            fullName += " #{lastName}"
        end
        fullName
    end

    def lastFirst
        lastFirst = "#{lastName}, #{firstName}"
        if !middleName.nil?
            lastFirst += " #{middleName.slice(0,1)}."
        else
            lastFirst
        end
    end
    
    def firstLast
        "#{firstName} #{lastName}"
    end

    def to_s(format = 'fullName')
        case format
        when 'fullName'
            fullName
        when 'lastFirst'
            lastFirst
        when 'first'
            firstName
        when 'lastName'
            lastName
        else
            firstLast
        end

    end

    def printPhone
        puts "Phone Numbers:"
        phoneNumbers.each { |stuff| puts stuff }
    end

end

