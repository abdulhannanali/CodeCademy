class Account


    def initialize(name, balance=100)
        @name = name
        @balance = balance
        pin
    end
    
    # private methods for my Account class
    private
    def pin
        @pin_chances = 3
        @pin = 1234
    end
    
    # pin has to be called explicitly if for the first time only otherwise it can be implicit
    def pin_error
        "Access denied: incorrect PIN."
    end

    # verifies whether the given pin is correct or incorrect
    def verify_pin(pin_number)
        if @pin == pin_number
            true
        else
            puts pin_error
            false
        end
    end

    # changes the pin number if the information entered was accurate
    private
    def change_pin(old_pin, new_pin, name, balance,)
        if (verify_pin(old_pin) &&
            @name == name &&
            @balance == balance)
            @pin = new_pin
            true
        else
            false
        end
    end

    # private method to add the given amount in the balance
    def add_amount(amount)
        @balance += amount
    end

    # private method to subtract the given amount from the balance
    def subtract_amount(amount)
        @balance -= amount
    end
    
    
    public
    def display_balance(pin_number)
        if verify_pin(pin_number)
            puts "Balance: $#{@balance}."
        end
    end
    
    # withdraws the amount from the bank balance
    def withdraw(pin_number, amount)
        if verify_pin(pin_number)
            @balance -= amount
            puts "Withdrew #{amount}. New balance: $#{@balance}"
        end
    end

    # deposit method to add money to the account
    def deposit(pin_number, amount)
        if verify_pin(pin_number)
            add_amount(amount)
            puts "Deposited #{amount}. New balance: $#{@balance}"
        end
    end 

    def request_pin_change
        puts "Enter your existing 4 - digit pin code"
        pin = Integer(gets.chomp)
        puts "Enter new 4 - digit pin code"
        new_pin = Integer(gets.chomp)
        puts "Enter the name of the bank account"
        name = gets.chomp
        puts "Please enter the existing balance in your bank account"
        balance = gets.chomp.to_f

        if change_pin(pin, new_pin, name, balance)
            puts "Your pin has been changed successfully"
        else
            puts "Sorry! The information you entered was wrong."
            puts "Your pin remains unchanged."
            puts "You have only "
end

checking_account = Account.new("programreneur", 500)
checking_account.display_balance(1234)  