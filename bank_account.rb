class BankAccount
    attr_reader :name

    def initialize(name)
        @name = name
        @transactions = []
        add_transaction("Begining Balance", 0)
    end

    def credit(description, amount)
        add_transaction(description, amount)
    end

    def debit(description, amount)
        add_transaction(description, -amount)
    end

    def add_transaction(description, amount)
        @transactions.push(description: description, amount: amount)
    end
    
    def balance
        balance = 0.0
        @transactions.each{ |transaction|
        balance+= transaction[:amount]
        }
        return balance
    end

    def print_register
        puts "\n".ljust(40,"_")
        puts "\n"
        puts "#{name}'s Bank Account:".rjust(30)
        puts "Description".ljust(30) + "Amount".rjust(10)
        @transactions.each{ |transaction|
        puts transaction[:description].ljust(30)+ sprintf("%0.2f",transaction[:amount]).rjust(10)}
        puts "Balance: $#{sprintf("%0.2f",balance)}".rjust(25)
        puts "".ljust(40,"_")
    end

    def to_s
        "\tName: #{name} \t Balance: $#{sprintf("%0.2f", balance)}"
    end
end

bank_account = BankAccount.new("Ryan")
# puts bank_account.inspect
bank_account.credit("Paycheck", 100)
bank_account.debit("Groceries", 40)
bank_account.debit("Gas", 10.51)
bank_account.credit("Paycheck", 100)
# puts bank_account.inspect
puts sprintf("%0.2f", bank_account.balance)
puts bank_account.print_register