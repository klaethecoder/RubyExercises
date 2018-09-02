require './contact'
require "yaml"
class AddressBook
    attr_reader :contacts

    def initialize
        @contacts=[]
        open()
    end

    def addContact
        contact = Contact.new
        print "First Name: "
        contact.firstName = gets.chomp
        print "Middle Name: "
        contact.middleName = gets.chomp
        print "Last Name: "
        contact.lastName = gets.chomp

        loop do
            puts "Add Phone Number or Address?"
            puts "p: Add Phone Number"
            puts "a: Add Address"
            puts "(Any other key to go back)"
            response =  gets.chomp.downcase
            case response
            when 'p'
                phone = Phone.new
                print "Phone Number Kind(Home, Work, etc.): "
                phone.kind = gets.chomp
                print "Number: "
                phone.number = gets.chomp

                contact.phoneNumbers.push(phone)
            when 'a'
                address = Address.new
                print "Address Kind (Home, Work, etc.): "
                address.kind = gets.chomp
                print "Address Line 1: "
                address.street1 = gets.chomp
                print "Address Line 2: "
                address.street2 = gets.chomp
                print "City: "
                address.city = gets.chomp
                print "State: " 
                address.state = gets.chomp
                print "Zip Code: "
                address.zipCode = gets.chomp
                contact.addresses.push(address)
            else
                print "\n"
                break
            end
        end

        contacts.push(contact)
    end

    def open
        if File.exists?("contacts.yml")
            @contacts = YAML.load_file("contacts.yml")
        end
    end

    def save
        File.open("contacts.yml", "w") do |file|
            file.write(contacts.to_yaml)
        end
    end

    def run
        loop do
            puts "Address Book"
            puts "a: Add Contact"
            puts "p: Print Address Book"
            puts "s: Search"
            puts "u: Update"
            puts "e: Exit"
            print "Enter your choice: "
            input = gets.chomp.downcase

            case input
                when 'a'
                    addContact
                when 'p'
                    printContactList
                when 's'
                    print "Search Term: "
                    search = gets.chomp
                    findByName(search)
                    findByNumber(search)
                    findByAdd(search)
                when 'e'
                    save()
                    break
                end
                puts "\n"
        end
    end

    def printContactList
        puts "Contact List:"
       contacts.each do |contact|
        puts contact.to_s('lastFirst') 
       end
    end

    
    def findByName(name)
        results = []
        search = name.downcase
        contacts.each do |contact|
            if contact.fullName.downcase.include?(search)
                results.push(contact)
            end
        end

        printResults("Name search results (#{search})", results)
       
    end

    def printResults(search, results)
        puts search
        results.each do |contact|
                puts contact.to_s('fullName')
                contact.printPhone
                contact.printAdd
                puts "\n"
            end
    end

    def findByAdd(query)
        results = []
        search = query.downcase
        contacts.each do |contact|
             contact.addresses.each do |address|
             if address.to_s('long').downcase.include?(search)
                results.push(contact) unless results.include?(contact)
             end
             
            end
        end
        printResults("Address search results (#{search})", results)

    end

    def findByNumber(number)
        results =[]
        search = number.gsub("-", "")
        contacts.each do |contact|
         contact.phoneNumbers.each do |phone|
               if phone.number.gsub("-","").include?(search)
                    results.push(contact) unless results.include?(contact)
               end
            end
        printResults("Phone search results (#{search})", results)
        end
    end

    def tester
        contacts.each do |contact|
            puts contact.firstName
        end
    end
end

addressBook = AddressBook.new

addressBook.run