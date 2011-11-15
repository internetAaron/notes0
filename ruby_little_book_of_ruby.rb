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

# chapter 02: 	Classes and Objects

class MyClass
end

ob = MyClass.new

puts ob.class

class MyClass
  def greetthem
    puts 'hi'
  end
end

testob = MyClass.new
testob.greetthem

# instance variable
class Dog
  def set_name(name)
    @nickname = name
  end
end

dog1 = Dog.new
dog2 = Dog.new

dog1.set_name('Aaron')
dog2.set_name('Bonanza')


class Dog
  def get_name
    return @nickname
  end
  def talk
    return 'woof, woof!'
  end
end

puts(dog1.get_name)
puts(dog1.talk)


class Dog
  def initialize (aName, aDescription)
    @name = aName
    @description = aDescription
  end
  def get_description
    return @description
  end
end

another_dog = Dog.new('Ceazar', 'guard dog')
puts(another_dog.get_description)
puts(another_dog)

class Dog 
  def to_s
    puts "#{@name}, the #{@description}"
  end
end  

puts(another_dog)