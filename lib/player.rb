class Player
  def initialize (name, lvl, attack, defense, initiative, hp, maxhp, xp, gold, dead)
    @name      =name.to_s
    @lvl       =lvl
    @attack    =attack
    @defense   =defense
    @initiative=initiative
    @hp        =hp
    @maxhp     =maxhp
    @xp        =xp
    @gold      =gold
    @dead      =dead
  end

  attr_reader :name, :lvl, :attack, :defense, :initiative, :hp, :maxhp, :xp, :gold, :dead
  attr_writer :name, :lvl, :attack, :defense, :initiative, :hp, :maxhp, :xp, :gold, :dead

  def tellstats
    puts self.name + ', your stats are as follows:'
    puts 'You have '+ self.hp.to_s + ' hit points out of ' + self.maxhp.to_s + '.'
    puts 'Your base Attack is ' + self.attack.to_s + ', your base Defense is ' + self.defense.to_s + ', and your base Initiative is ' + self.initiative.to_s + '.'
    levelgoals=[0, 10, 30, 60, 100, 150, 210, 280, 360, 450]
    xpneeded  =(levelgoals[self.lvl.to_i] - self.xp.to_i)
    if self.lvl==10
      puts 'You are at the maximum level of ten--well done, weakling!'
    else
      puts 'You are on level ' + self.lvl.to_s + ' with ' + self.xp.to_s + ' XP. For your next level you need ' + xpneeded.to_s + ' more.'
    end
    puts 'You have ' + self.gold.to_s + ' gold. Your poverty embarrasses me.' if self.gold.to_i < 5
    puts 'You have ' + self.gold.to_s + ' gold. Get a job, hippy!' if (self.gold.to_i >= 5) and (self.gold.to_i < 10)
    puts 'You have ' + self.gold.to_s + ' gold. We have a store, you know.' if self.gold.to_i >= 10
  end

  def levelup
    levelgoals=[0, 10, 30, 60, 100, 150, 210, 280, 360, 450, 10000]
    #noinspection RubyUnusedLocalVariable
    if self.xp >= levelgoals[self.lvl]
      puts
      self.lvl = self.lvl + 1
      puts 'You have advanced to level ' + self.lvl.to_s + '!'
      self.maxhp = self.maxhp + self.lvl + 5
      self.hp    = self.maxhp
      puts 'Your maximum number of hit points is now ' + self.maxhp.to_s
      choice=''
      until choice == 'A' or choice == 'D' or choice == 'I'
        puts 'Choose one to permanently increase: (A)ttack, (D)efense, or (I)nitiative'
        choice = gets.chomp.upcase
      end
      if choice == 'A'
        self.attack = self.attack + 1
        puts 'Your Attack score is now ' + self.attack.to_s + '. Good job, weakling!'
      end
      if choice == 'D'
        self.defense = self.defense + 1
        puts 'Your Defense score is now ' + self.defense.to_s + '. Way to go, weakling!'
      end
      if choice == 'I'
        self.initiative = self.initiative + 1
        puts 'Your Initiative score is now ' + self.initiative.to_s + '. Weakling--wooo!'
      end
    end
  end
end