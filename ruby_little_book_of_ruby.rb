# chapter 01: 	Strings and Methods
# chapter 02: 	Classes and Objects
# chapter 03: 	Class Hierarchies
# chapter 04: 	Accessors, Attributes, Class Variables
# chapter 05: 	Arrays
# chapter 06: 	Hashes
# chapter 07: 	Loops and Iterators
# chapter 08: 	Conditional Statements
# chapter 09: 	Modules and Mixins
# chapter 10: 	Saving Files, Moving On<

# chapter 01: 	Strings and Methods
puts 'Hello World'
puts 'mystring'.upcase
print 'Enter your name: '
# name = gets()
name = 'skip'
puts "hello #{name}"
puts 'hello #{name}'
# works just with double quotes

# puts and print
puts 'adds new line'
puts 'adds new line' 
print 'stays on line'
print 'stays on line'
puts

# case sensitive
myvar = 1
myvar = 2
myVar = 3
puts myvar
puts myVar

def showsmth
  puts 'asdf'
end

puts "test #{showsmth}"
# doesn't work

def greet(firstname)
  puts "hi there #{firstname}"
end

greet('Masha')

#numbers
subtotal = 100
taxrate = 0.175
tax = subtotal * taxrate
puts "Taxrate on #{subtotal} is #{taxrate}, so amount to pay is #{tax}"

print 'now, enter the sum: '
# sum = gets
sum = 99
subtotal = sum.to_f
tax = subtotal * taxrate
puts "now, so amount to pay is #{tax}"


# if then else
print 'now, enter the sum again: '
# sum = gets
sum = 99
subtotal = sum.to_f

if subtotal < 0
  subtotal = 0
end

tax = subtotal * taxrate
puts "now, so amount to pay is #{tax}"

