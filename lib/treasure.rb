class Treasure
  def initialize (name, value, type, attackbonus, defensebonus, initbonus, healamount, useup, equipped)
    @name        =name.to_s
    @value       =value
    @type        =type.to_s
    @attackbonus =attackbonus
    @defensebonus=defensebonus
    @initbonus   =initbonus
    @healamount  =healamount
    @useup       =useup
    @equipped    =equipped
  end

  attr_reader :name, :value, :type, :attackbonus, :defensebonus, :initbonus, :healamount, :useup, :equipped
  attr_writer :value, :attackbonus, :defensebonus, :initbonus, :healamount, :useup, :equipped

  def equip
    self.equipped = true
    puts 'You have equipped the ' + self.name.to_s
  end

  def unequip
    self.equipped = false
    puts 'You have removed the ' + self.name.to_s
  end
end