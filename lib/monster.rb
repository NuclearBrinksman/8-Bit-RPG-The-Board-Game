class Monster
  def initialize (name, lvl, attack, defense, initiative, hp)
    @name      =name.to_s
    @lvl       =lvl
    @attack    =attack
    @defense   =defense
    @initiative=initiative
    @hp        =hp
  end

  attr_reader :name, :lvl, :attack, :defense, :initiative, :hp
  attr_writer :name, :lvl, :attack, :defense, :initiative, :hp
end