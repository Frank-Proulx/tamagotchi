require ('pry')

class Tamagotchi
  attr_accessor :name, :food_level, :activity_level, :sleep_level

  @@tamagotchis = {}

  def initialize(attributes)
    @name = attributes.fetch(:name)
    @food_level = 10
    @activity_level = 10
    @sleep_level = 10
    @start_time = Time.now()
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

  def new_timer
    now = Time.now()
    diff = (now - @start_time).floor()
    @food_level -= diff
    @activity_level -= diff
    @sleep_level -= diff
    @start_time = now
  end
end
