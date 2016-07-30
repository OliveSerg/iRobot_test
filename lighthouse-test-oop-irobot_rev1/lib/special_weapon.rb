class SpecialWeapon < Weapon

  def initialize
    super("Special Weapon", 40, 30)
  end

  def hit(target)
    target.heal(-(self.damage))
    blast_targets = target.scanning
    blast_targets.each {|blast_target| blast_target.heal(-(self.damage))}
  end

end
