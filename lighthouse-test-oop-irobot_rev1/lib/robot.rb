class Robot

  class DeadObject < StandardError; end
  class InvalidTarget < StandardError; end

  MAX_HEALTH = 100
  MAX_WEIGHT = 250
  DEFAULT_RANGE = 1
  DEFAULT_SHIELD = 50

  @@list = []

  attr_reader :x, :y, :items, :health, :shield, :list
  attr_accessor :equipped_weapon

  def initialize(x = 0, y = 0, items = [])
    #@position = [0,0]
    @x = x
    @y = y
    @items = []
    @total_weight = 0
    @max_weight = MAX_WEIGHT
    @health = MAX_HEALTH
    @shield = DEFAULT_SHIELD
    @attack_power = 5
    @equipped_weapon = nil
    @@list << self
  end

  def self.list
    list = @@list
    list
  end

  def self.robots_at(x, y)
    list = @@list.select {|robot| robot.position == [x, y]}
    if list == []
      return false
      #could raise "Not robots found"
    end
    list
  end

  def position
    position = [self.x, self.y]
  end

  def scanning
    @@list.select {|target| near_by?(target) unless target == self}
  end

  def move_left
    @x -= 1
  end

  def move_right
    @x += 1
  end

  def move_up
    @y += 1
  end

  def move_down
    @y -= 1
  end

  def pick_up(item)
    if (item.weight + self.items_weight) <= @max_weight
      if item.is_a? Weapon
        @equipped_weapon = item
      elsif item.is_a?(BoxOfBolts) && self.health <= 80
        item.feed(self)
      end
      @items << item
    end
  end

  def items_weight
    unless @items == []
      @total_weight = 0
      @items.each {|item| @total_weight += item.weight}
      return @total_weight
    end
    @total_weight
  end


  def wound(damage)
    if self.shield == 0
      @health = [@health - damage, 0].max
    else
      @shield = [@shield - damage, 0].max
    end
  end

  def heal(heal)
    @health = [self.health + heal, MAX_HEALTH].min
  end

  def heal!(heal)
    raise DeadObject, "You Are Dead" if self.health <= 0
    @health = [self.health + heal, MAX_HEALTH].min
  end

  def shield=(shield)
    @shield = [@shield + shield, DEFAULT_SHIELD].min
  end

  def in_range?(target)
    ((target.x - self.x).abs <= display_range && target.y == self.y) || ((target.y - self.y).abs <= display_range && target.x == self.x)
  end

  def near_by?(target)
    ((target.x - self.x).abs <= 1 && target.y == self.y) || ((target.y - self.y).abs <= 1 && target.x == self.x)
  end

  def display_range
    if self.equipped_weapon.nil?
      DEFAULT_RANGE
    else
      self.equipped_weapon.range
    end
  end

  def despense_weapon
    if @equipped_weapon.is_a? Grenade
      @equipped_weapon = nil
    end
  end

  def attack(target)
    if in_range?(target)
      if @equipped_weapon
        @equipped_weapon.hit(target)
        despense_weapon
      else
        target.wound(@attack_power)
      end
    end
  end

  def attack!(target)
    raise InvalidTarget, "Object is not a Robot" if !target.is_a? Robot
    if @equipped_weapon
      @equipped_weapon.hit(target)
    else
      target.wound(@attack_power)
    end
  end
end
