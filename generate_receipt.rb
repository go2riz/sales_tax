Dir["./src/*.rb"].each {|file| require file }

puts "\n------------Welcome------------\n"

puts "Please enter line items one by one. When you want to finish, press TAB and then press ENTER.\n\n\n"

puts "Quantity, Product, Price"

items = gets("\t\n").chomp

puts "\n\n\n"
Receipt.new( items ).create_receipt
