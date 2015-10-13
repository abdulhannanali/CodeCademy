class Computer
    @@users = Hash.new()
    
    def Computer.get_users
        @@users
    end
    
    def initialize(username, password)
        @username = username
        @password = password
        @@users[username] = password
        @files = Hash.new()
    end
    
    def create(filename)
        time = Time.now
        @@files[filename] = time
        puts "#{filename} has been created by #{@username} at #{time}"
    end
    
end

my_computer = Computer.new(         "programreneur", "helloworld")


Computer.get_users().select {
    |username, password|
    puts "#{username} || #{password}"
}