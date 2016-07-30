class Item

  attr_reader :name, :weight

  def initialize(name = nil, weight = 0)
    @name = name
    @weight = weight
  end

end
