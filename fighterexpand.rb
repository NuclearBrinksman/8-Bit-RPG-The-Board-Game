class Player
  def initialize (name, lvl, charclass, initiative, resist, hp, maxhp, mana, maxmana, xp, gold, strength, will, intel, finesse, poison, disease, injury, dead)
    @name=name.to_s ; @lvl=lvl
    @initiative=initiative ; @resist=resist
    @hp=hp ; @maxhp=maxhp ; @mana=mana ; @maxmana=maxmana
    @xp=xp ; @gold=gold
    @strength=strength ; @will=will ; @intel=intel ; @finesse=finesse
    @poison=poison ; @disease=disease ; @injury=injury
    @dead=dead
  end
  attr_reader :name, :lvl, :charclass, :initiative, :resist, :hp, :maxhp, :mana, :maxmana, :xp, :gold, :strength, :will, :intel, :finesse, :poison, :disease, :injury, :dead
  attr_writer :name, :lvl, :charclass, :initiative, :resist, :hp, :maxhp, :mana, :maxmana, :xp, :gold, :strength, :will, :intel, :finesse, :poison, :disease, :injury, :dead
  def updatestats
    self.initiative = (self.finesse + self.will)
    self.resist = (self.will + self.intel)
    self.maxhp = (self.lvl*(self.strength + self.will) + 5)
    self.maxmana = (self.lvl*(self.intel + self.finesse))
  end  
  def tellstats
    puts self.name + ', your stats are as follows:'
    puts 'Hit points: '+ self.hp.to_s + '/' + self.maxhp.to_s + '   Mana points: ' + self.mana.to_s + '/' + self.maxmana.to_s
    puts 'Strength: ' + self.strength.to_s + '   Will: ' + self.will.to_s + '   Intelligence: ' + self.intel.to_s + '   Finesse: ' + self.finesse.to_s
    levelgoals=[0,10,30,60,100,150,210,280,360,450]
    xpneeded=(levelgoals[self.lvl.to_i] - self.xp.to_i)
    if self.lvl==10
      puts 'You are at the maximum level of ten--well done, weakling!'
    else
      puts 'You are on level ' + self.lvl.to_s + ' with ' + self.xp.to_s + ' XP. For your next level you need ' + xpneeded.to_s + ' more.'
    end
    puts 'You have ' + self.gold.to_s + ' gold. Your poverty embarrasses me.' if self.gold.to_i < 5
    puts 'You have ' + self.gold.to_s + ' gold. Get a job, hippy!' if (self.gold.to_i >= 5) and (self.gold.to_i < 10)
    puts 'You have ' + self.gold.to_s + ' gold. Ooh, fancypants!' if self.gold.to_i >= 10
  end
  def levelup
    levelgoals=[0,10,30,60,100,150,210,280,360,450,10000]
    if self.xp >= levelgoals[self.lvl]
      puts
      self.lvl = self.lvl + 1
      puts 'You have advanced to level ' + self.lvl.to_s + '!'
      choice=''
      until choice == 'S' or choice == 'W' or choice == 'I' or choice == 'F'
      puts 'Choose one to permanently increase: (S)trength, (W)ill, (I)ntelligence, or (F)inesse.'
      choice = gets.chomp.upcase
      end
      if choice == 'S'
        self.strength = self.strength + 1
        puts 'Your Strength score is now ' + self.strength.to_s + '. Good job, weakling!'
      end  
      if choice == 'W'
        self.will = self.will + 1
        puts 'Your Will score is now ' + self.will.to_s + '. Way to go, weakling!'
      end  
      if choice == 'I'
        self.intel = self.intel + 1
        puts 'Your Intelligence score is now ' + self.intel.to_s + '. Weakling--wooo!'
      end
      if choice == 'F'
        self.finesse = self.finesse + 1
        puts 'Your Finesse score is now ' + self.finesse.to_s + '. Weakling, you astound me.'      
      end
    end
  end
  def makecharacter
    choice = ''
    puts 'What is your name, player?'
    self.name = gets.chomp
    puts
    until choice == 'W' or choice == 'C' or choice == 'M' or choice == 'R'
      puts 'Are you a (W)arrior, a (C)leric, a (M)age, or a (R)ogue?'
      choice = gets.chomp.upcase
    end
    if choice == 'W'
      self.charclass = 'Warrior'
      self.strength = 3
      self.will = 1
      self.intel = 0
      self.finesse = 2
      puts 'Welcome, ' + self.name.to_s + ' the warrior!'
    end
    if choice == 'C'
      self.charclass = 'Cleric'
      self.strength = 1
      self.will = 3
      self.intel = 2
      self.finesse = 0
      puts 'Welcome, ' + self.name.to_s + ' the cleric!'
    end
    if choice == 'M'
      self.charclass = 'Mage'
      self.strength = 0
      self.will = 2
      self.intel = 3
      self.finesse = 1
      puts 'Welcome, ' + self.name.to_s + ' the mage!'
    end
    if choice == 'R'
      self.charclass = 'Rogue'
      self.strength = 2
      self.will = 0
      self.intel = 1
      self.finesse = 3
      puts 'Welcome, ' + self.name.to_s + ' the rogue!'
    end
    self.initiative = (self.finesse + self.will)
    self.resist = (self.will + self.intel)
    self.maxhp = (self.lvl*(self.strength + self.will) + 5)
    self.maxmana = (self.lvl*(self.intel + self.finesse)) 
  end
end

# tester (name, lvl, charclass, initiative, resist, hp, maxhp, mana, maxmana, xp, gold, strength, will, intel, finesse, poison, disease, injury, dead)
you = Player.new(nil,1,nil,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,false)
you.makecharacter
puts
you.tellstats
exit



  
    
    
    
    
    
    
    