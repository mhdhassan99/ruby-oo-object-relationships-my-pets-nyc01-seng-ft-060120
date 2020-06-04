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
  def self.owners
    @@all.count 
  end
  def self.reset
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
end