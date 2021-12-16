require ('pry')

class Tamagotchi
  attr_accessor :name, :food_level, :activity_level, :sleep_level

  @@tamagotchis = {}

  def initialize(attributes)
    @name = attributes.fetch(:name)
    @food_level = 10
    @activity_level = 10
    @sleep_level = 10
  end
  
  def save
    @@tamagotchis = Tamagotchi.new({:name => self.name})
  end
  
  def self.tamagotchis
    @@tamagotchis
  end

  def is_alive?
    if (@food_level > 0) && (@activity_level > 0) && (@sleep_level > 0)
      true
    else
      false
    end
  end

  def start_timer
    Thread.new do
      while self.is_alive? do
        sleep 1
        @food_level -= 1
        @activity_level -= 1
        @sleep_level -= 1
      end
    end
    if self.is_alive? == false
      return "Your tamogatchi is dead"
    else
      "Alive!"
    end
  end

end
# diff = 0
# start_time = Time.now() 
# while is_alive?
#   sleep 10
#   @food_level -= 1
#   @activity_level -= 1
#   @sleep_level -= 1
# end

# buttons
# feed  put to sleep   play with 
# 1      1              1

# is_alive?


# def foodie
# food = 10
#   while food > 5
#     sleep 10
#     food -= 1
#     puts food
#   end

# end