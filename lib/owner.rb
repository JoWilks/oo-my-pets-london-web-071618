require 'pry'
require_relative 'dog.rb'

class Owner

  attr_reader
  attr_accessor :name, :pets

  @@owners = []

  def initialize(name, species = "human")
    @name = name
    @species = species
    @@owners << self
    @pets = {:fishes => [], :dogs => [], :cats => []}
  end

  def self.all
    @@owners
  end

  def self.count
    @@owners.count
  end

  def self.reset_all
    @@owners = []
  end

  def species
    @species
  end

  def say_species
    "I am a #{@species}."
  end

  def buy_fish(name)
    fish = Fish.new(name)
    @pets[:fishes] << fish
  end

  def buy_cat(name)
    cat = Cat.new(name)
    @pets[:cats] << cat
  end

  def buy_dog(name)
    dog = Dog.new(name)
    @pets[:dogs] << dog
  end

  def walk_dogs
    @pets[:dogs].each {|x| x.mood = "happy"}
  end

  def play_with_cats
    @pets[:cats].each {|x| x.mood = "happy"}
  end

  def feed_fish
    @pets[:fishes].each {|x| x.mood = "happy"}
  end

  def sell_pets
    @pets.each {|type_pet, pets| pets.each {|x| x.mood = "nervous"}}
    @pets = {:fishes => [], :dogs => [], :cats => []}
  end

  def list_pets
    "I have #{@pets[:fishes].count} fish, #{@pets[:dogs].count} dog(s), and #{@pets[:cats].count} cat(s)."
  end

end
#
# an_owner = Owner.new("Bob")
# an_owner.buy_dog("Spot")
# binding.pry
# puts "hello"
