require 'rspec'
require 'tamagotchi'
require 'pry'

describe('#Tamagotchi') do
  before(:each) do
    @t = Tamagotchi.new({:name => "lil dragon"})
  end

  describe("#initialize") do
    it('should create Tamagotchi object with attributes and initialize food, activity, sleep_level') do
      expect(@t.name).to(eq("lil dragon"))
      expect(@t.food_level).to(eq(10))
      expect(@t.sleep_level).to(eq(10))
      expect(@t.activity_level).to(eq(10))
    end
  end

  describe("#is_alive?") do
    it('should check levels and return true if all above 0') do
      @t.sleep_level -= 2
      expect(@t.is_alive?).to(eq(true))
      @t.food_level -= 10
      expect(@t.is_alive?).to(eq(false))
    end
  end
end
