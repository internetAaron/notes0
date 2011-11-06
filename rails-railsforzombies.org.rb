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

z = Zombie.find(2)
t = Tweet.create(
    :status => "tastes great"
  , :zombie => z
)
t.zombie
t.zombie.name
z.tweets
z.tweets.count

# level 2, challenges
#challenge 1 - create a model
class Zombie < ActiveRecord::Base
  validates_presence_of :name #challenge2 
  validates_uniqueness_of :name #challenge3
  
  #challenge4
  # Do both uniqueness and presence validation on a Zombie's name on a single line, using the new syntax
  validates :name, :presence => true, :uniqueness => true
end

# Use your newly created model to count the number of Zombies
Zombie.all.count

# Verify that the validation works by trying to create a zombie with no name
z = Zombie.new
# z.name = 'missing'
z.save

# Verify that the validation works by trying to create a zombie with a duplicate name
z = Zombie.new
z.name = 'Bob'
z.save

# level 2, challenge 5/6 - belongs to
# A Weapon should belong to a Zombie. Create that relationship
class Weapon < ActiveRecord::Base
  belongs_to :zombie
end

# Create a weapon for an existing Zombie
w = Weapon.new
w.name = 'sword'
w.strength = 8
w.zombie = 3
w.save

# ?why not
Weapon.create(
   :name => "sword"
 , :strength => 8
 , :zombie_id => 3
)

Weapon.create( :name => "sword") #ok
Weapon.create( :name => "sword", :strength => 6) #ok
Weapon.create( :name => "sword", :strength => 6, :zombie_id => 3) #ok

#amazing! doesn't work with leading comas
Weapon.create(
 :name => "sword",
 :strength => 8,
 :zombie_id => 3
)

# level 2, challenge 6/6 - relationship find
# Assuming the models and relationships are properly defined, find all the weapons that belong to Zombie Ash

?
z = Zombie.where(:name => 'Ash')
Weapon.where( :id => z)

# why not?
z.weapons

# this works
z = Zombie.find(1)
z.weapons

z = Zombie.where(:name => 'Ash')
z = Zombie.find(z)
z.weapons


# level 3 video
zombie_twitter
- app
- - views
- - - zombies
- - - tweets
- - - - index.html.erb (list all tweets)
- - - - show.html.erb (to view a tweet)

'erb' - 'embedded ruby', ruby inside html

<% - evaluate ruby
<=% - evaluate & print

# original markup
<!DOCTYPE html>
<html>
 <head><title>Twitter for Zombies</title></hea
<body>
  <img src="/images/twitter.png" />
</body></html>
  <% tweet = Tweet.find(1) %>
  <h1><%= tweet.status %></h1>
  <p>Posted by <%= tweet.zombie.name %></p>

# splitted markup
/app/views/layouts/application.html.erb
<!DOCTYPE html>
<html>
 <head><title>Twitter for Zombies</title></head>
 <!--specific rails tags-->
  <%= stylesheet_link_tag :all %>
  <%= javascript_include_tag :defaults %>
  <%= csrf_meta_tag %>
<body>
  <img src="/images/twitter.png" />
</body></html>


/app/views/tweets/show.html.erb
<% tweet = Tweet.find(1) %>
<h1><%= tweet.status %></h1>
<p>Posted by <%= tweet.zombie.name %></p>
  
  
 <!--specific rails tags-->
  <%= stylesheet_link_tag :all %>
  zombie_twitter
  - public
  -- stylesheets
  
  <%= javascript_include_tag :defaults %>
  zombie_twitter
  - public
  -- javascripts
  
  <%= csrf_meta_tag %>
  what is that?
  
# links
<p>Posted by <%= tweet.zombie.name %></p>


<%= link_to tweet.zombie.name, zombie_path(tweet.zombie) %>

# renders to 

<a href="/zombies/1">Ash </a>

# or simplier
<%= link_to tweet.zombie.name, tweet.zombie %>

todo: look for link_to
in
1 rails sourcecode from github
2 api.rubyonrails.org
3 apidock.com/rails
4 railsapi.com



/app/views/tweets/index.html.erb
<h1>Listing tweets</h1>
<table>
  <tr>
    <th>Status</th>
    <th>Zombie</th>
  </tr>
<% Tweet.all.each do |tweet| %>
  <tr>
    <td><%= link_to tweet.status, tweet %></td>
    <td><%= link_to tweet.zombie.name,  %> </td>
    </tr>
    </table>
<% end %>

Tweet class
Tweet.all array of tweets
tweet single tweet

/app/views/tweets/index.html.erb
<% Tweet.all.each do |tweet| %>
  <tr>
    <td><%= link_to tweet.status, tweet %></td>
    <td><%= link_to tweet.zombie.name, tweet.zombie %></td>
    <td><%= link_to "Edit", edit_tweet_path(tweet) %></td>
    <td><%= link_to "Delete", tweet, :method => :delete %></td>
  </tr>
<% end %>


<% tweets = Tweet.all %>

<% tweets.each do |tweet| %>
...
<% end %>

<% if tweets.size == 0 %>
  <em>No tweets found</em>
<% end %>  

List all tweets tweets_path /tweets
New tweet form new_tweet_path /tweets/new

tweet = Tweet.find(1)

Show a tweet tweet /tweets/1
Edit a tweet edit_tweet_path(tweet) /tweets/1/edit
Delete a tweet tweet, :method => :delete /tweets/1

# level 3 challenge 1
# Print out the Zombie's name and graveyard
<% zombie = Zombie.first %>
<h1><%= zombie.name %></h1>
<p>
  <%= zombie.graveyard %>
</p>

# 3-02
# Link to show the zombie. Use the zombie's name as the anchor text
<% zombie = Zombie.first %>

<p>
<%= link_to zombie.name, zombie %>
</p>

# Use the API documentation to figure out how to add a css class called 'bloody' to the html of the link
<% zombie = Zombie.first %>

<p>
<%= link_to zombie.name, zombie, :class => 'bloody' %>
</p>

# 3-3
# Use an each block to print the names of all the Zombies
<% zombies = Zombie.all %>

<ul>
<% zombies.each do |zombie| %>
  <%= zombie.name %>
<% end %>
</ul>

# Link to show all the Zombies in the each block
<% zombies = Zombie.all %>

<ul>
<% zombies.each do |zombie| %>
  <%= link_to zombie.name, zombie %>
<% end %>
</ul>

# 3-4
# In the each block, if a Zombie has more than 1 tweet, print out SMART ZOMBIE
# Use an else to print out a different message for not so smart Zombies
<% zombies = Zombie.all %>

<ul>
  <% zombies.each do |zombie| %>
    <li>
      <%= zombie.name %>
      <% if zombie.tweets.size > 1 %>
        <em>SMART ZOMBIE</em>
        <% else %>
        <em>not so smart ZOMBIE</em>
      <% end %>
    </li>
  <% end %>
</ul>

# 3-5
# In the each block, make the Zombie's name link to it's edit page
# Link to the new Zombie page outside of the each block
<% zombies = Zombie.all %>

<ul>
  <% zombies.each do |zombie| %>
    <li>
      <%= link_to zombie.name, edit_zombie_path(zombie) %>
    </li>
  <% end %>
</ul>


# level 4 notes
zombie_twitter
- app
-- controllers
---- tweets_controller.rb

# if instead of
/app/views/tweets/show.html.erb
# wants 
/app/views/tweets/status.html.erb
<h1><%= @tweet.status %></h1>
<p>Posted by <%= @tweet.zombie.name %></p>

/app/controllers/tweets_controller.rb
class TweetsController < ApplicatoinController
  def show
    @tweet = Tweet.find(params[:id])
    render :action => status
    
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @tweet}
      format.json { render :json => @tweet}
    end
    
  end
  
  defs:
  index - list all tweets
  show - show a single
  new - show new tweet form
  edit
  create
  update
  destroy
  
  # authorization
  def edit
    @tweet = Tweet.find(params[:id])
    
    if session[:zombie_id] != @tweet.zombie_id
      # edition not allowed
      flash[:notice] = "Sorry, not allowed"
      redirect_to(tweets_path)
      # or
      redirect_to(tweets_path
        :notice => "sorry")
    end
  end
end

main template should be edited

/app/views/layouts/application.html.erb

<!DOCTYPE html>
<html>
<head>
  <title>Twitter for Zombies</title> 
  <%= stylesheet_link_tag :all %>
  <%= javascript_include_tag :defaults %>
  <%= csrf_meta_tag %>
</head>
<body>
  <img src="/images/twitter.png" />
  
  <% if flash[:notice] %>
    <div id="notice"><%= flash[:notice] %></div>
  <% end %>
  
  <%= yield %>
</body></html>





/tweets/1.json
{"tweet":{"id":1,"status":"Where can I get a good bite to eat?","zombie_id":1}}

/tweets/1.xml
<?xml version="1.0" encoding="UTF-8"?>
<tweet>
  <id type="integer">1</id>
  <status>Where can I get a good bite to eat?</status>
  <zombie-id type="integer">1</zombie-id>
</tweet>


edit, update, destroy needs authorization
so,
  @tweet = Tweet.find(params[:id])

is moved out of other methods
into get_tweet:

before_filter :get_tweet, :only => [:edit, :update, :destroy]

before_filter :check_auth, :only => [:edit, :update, :destroy]

def get_tweet
  @tweet = Tweet.find(params[:id])
end

def check_auth
  if session[:zombie_id] != @tweet.zombie_id
    redirect_to(tweets_path,
      :notice => "sorry")
  end
end

# level 4 challenges
# Create the show action for a Zombies Controller which finds a Zombie based on params[:id].
# Finish the respond_to block so the action returns xml format
def show
  @zombie = Zombie.find(params[:id])
  
  respond_to do |format|
    # format.xml { render :xml => @zombie}
    # Implement a JSON respond to format
    format.json { render :json => @zombie}
  end
  
end

# 3/4
# Write a create action that will create a new Zombie from the params and then redirect to the created zombie's show page
def create

  @zombie = Zombie.create(params[:zombie])
  
  redirect_to(zombies_path :notice => 'you are being redirected')
# ? why not  
# redirect_to(zombie_path)

end

# 4/4
# Add a before filter which calls a method to check if a zombie has no tweets. Redirect to zombies_path if they dont have tweets. Only on show.
class ZombiesController < ApplicationController
  before_filter :find_zombie
  before_filter :find_tweet, :only => [:show]

  def show
    render :action => :show
  end

  def find_zombie
    @zombie = Zombie.find params[:id]
  end
  
  def find_tweet
   zombie = find_zombie  
   if zombie.tweets.size < 1
      redirect_to(zombies_path)
   end    
  end
end

# level 5/5



# 1/5
# Create a resources route for zombies
RailsForZombies::Application.routes.draw do
  resources :zombies
end

# 2/5
# Create a custom route so that /undead will go to the undead action on the ZombiesController
RailsForZombies::Application.routes.draw 
  match 'undead' => "Zombies#undead"
end

#3/5
# Create redirect /undead to /zombies
RailsForZombies::Application.routes.draw 
  match 'undead' => redirect('zombies')
end

# 4/5
# Create a root route to ZombiesController index action
RailsForZombies::Application.routes.draw do
  root :to => 'Zombies#index'
end

# 5/5
Create a named route. It should generate a path like '/zombies/:name' where :name is a parameter, and points to the index action in ZombiesController. Name the route 'graveyard'
RailsForZombies::Application.routes.draw do
  match 'zombies/:name' => 'Zombies#index'
end