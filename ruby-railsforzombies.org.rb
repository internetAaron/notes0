# level 1 video
b = {
  :status => "I did smth"
  :zombie => "Jim"
}

puts b[:status] # will get "I did smth"

# find with id #3
t = Tweet.find(3)
# Rails change "Tweet" to lowercase "tweet",
# und pluralize it, and looks in table "tweets" 

puts b[:status] 
# is same as 
puts b.status

# crud
  
# c
  t = Tweet.new
  t.status = "I do smth"
  t.save
  # or
  t = Tweet.new(:status => "asfd")
  t.save
  # or
  Tweet.create(:status => "sdds")
# r
  Tweet.find(3)       # returns an item
  Tweet.find(3, 4, 5) # return an array
  Tweet.first
  Tweet.last
  Tweet.all
  Tweet.count
  Tweet.order(:zombie)
  Tweet.limit(20)
  Tweet.where(:zombie => "ash")
  Tweet.where(:zombie => "ash").order(":time").limit(20)
# u
  t = Tweet.find(3)
  t.zombie = "Mr.E"
  t.save
  # or
  t = Tweet.find(3)
  t.attributes = {
    :zombie = "Mr.E"
  }
  t.save
  # or
  t = Tweet.find(3)
  t.update_attributes = {
    :zombie = "Mr.E"
  }
# d
  t = Tweet.find(3)
  t.destroy
  # or
  Tweet.find(3).destroy
  Tweet.destroy_all
