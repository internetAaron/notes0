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
    :zombie => "Mr.E"
  }
  t.save
  # or
  t = Tweet.find(3)
  t.update_attributes(
    :zombie => "Mr.E"
  )
# d
  t = Tweet.find(3)
  t.destroy
  # or
  Tweet.find(3).destroy
  Tweet.destroy_all
  
# level 1, challenge 1/6 - find
# Find Zombie where id = 1 and store it in a variable
z = Zombie.find(1)
# Print out the zombie's name and graveyard.
puts z.name, z.graveyard

# level 1, challenge 2/6 - create
# Create a new Zombie
Tweet.create(:name => "Zed", :graveyard => "Central"
# Find the zombie you just created by its ID
z = Zombie.find(4)

# level 1, challenge 3/6 - find2
# Find the last zombie in the database, but don't use ID's
Zombie.last
# Find the first zombie in the database, but don't use ID's
Zombie.first

# level 1, challenge 4/6 - query
# Find all Zombies ordered by their names
Zombie.order(":name")
# Do the same query but limit to just 2 Zombies
Zombie.order(":name").limit(2)

# level 1, challenge 5/6 - update
# Update Zombie 3's graveyard to 'Benny Hills Memorial'
Zombie.find(3).update_attributes(
  :graveyard => "Benny Hills Memorial"
)
# Update Zombie 3's name and graveyard at the same time using update_attributes
Zombie.find(3).update_attributes(
  :graveyard => "Benny Hills Memorial"
  :name => "Zed"
)

# level 1, challenge 6/6 - destroy
# Destroy Zombie where ID = 3
Zombie.find(3).destroy
# Destroy all the Zombies in one fell-swoop!
Zombie.destroy_all

# level 2 video

# app/models/tweet.rb
class Tweet < ActiveRecord::Base
  validates_presence_of :status
end

validates_..
..presence_of :status
..numericality_of :fingers
..uniqueness_of :toothmarks
..confirmation_of :password
..acceptance_of :zombification
..length_of :password, :minimum => 3
..format_of :email, :with => /regex/i
..inclusion_of :age, :in => 21..99
..exclusion_of :age, :in => 0..21, :message => "You must be older"

a) validates :status, :presence => true
b) validates :status, :length => { :minimum => 3}
a & b merges to:
c) validates :status, :presence => true, :length => { :minimum => 3}

tweets table updated with column "zombie_id"

# relationships

# app/models/tweet.rb
class Tweet < ActiveRecord::Base
  belongs_to :zombie #singular!
end

# app/models/zombie.rb
class Tweet < ActiveRecord::Base
  has_many :tweets #plural!
end

z = Zombied.find(2)
t = Tweet.create(
    :status => "tastes great"
  , :zombie => z
)
t.zombie
t.zombie.name
z.tweets
z.tweets.count