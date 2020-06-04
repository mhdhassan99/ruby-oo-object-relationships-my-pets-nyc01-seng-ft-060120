class Owner

  attr_reader :name 
  @@all = []
  def initialize(name)
    @name = name 
    @species = species
    @@all << self 
  end

  def species 
    @species = "human"
  end

  def say_species
    "I am a #{@species}."
  end
 
  def self.all
    @@all 
  end
  def self.count
    @@all.count 
  end
  def self.reset_all
    @@all.clear
  end

  def cats
    Cat.all.select do |single_cat|
      single_cat.owner == self 
    end  
  end

  def dogs 
    Dog.all.select do |single_dog|
      single_dog.owner == self 
    end
  end

  def buy_cat(name)
    Cat.new(name, self)
  end 
  def buy_dog(name)
    Dog.new(name, self)
  end 

  def walk_dogs
    self.dogs.each {|dog| dog.mood = "happy"}
  end 
  def feed_cats 
    self.cats.each {|cat| cat.mood = "happy"}
  end 

  def sell_pets 
    pets = self.cats + self.dogs
    pets.each do |pet| 
      pet.mood = "nervous"
      pet.owner = nil 
    end
  end 

  def list_pets
    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end 

end