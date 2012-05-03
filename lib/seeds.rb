module SEEDS
  def self.treasures
    t           = Hash.new()
    t[:armor]   = {
      :frillyunderwear => Treasure.new('Frilly Underwear', 1, 'armor', 0, 1, 0, 0, false, false),
      :leatherjerkin   => Treasure.new('Leather Jerkin', 3, 'armor', 0, 2, 0, 0, false, false),
      :ringmail        => Treasure.new('Ring Mail', 6, 'armor', 0, 3, 0, 0, false, false),
      :elvenleather    => Treasure.new('Elven Leather', 3, 'armor', 0, 1, 1, 0, false, false),
      :elvenchainmail  => Treasure.new('Elven Chain Mail', 8, 'armor', 0, 3, 1, 0, false, false),
      :platemail       => Treasure.new('Ring Mail', 10, 'armor', 0, 4, 0, 0, false, false),
      :elvenplate      => Treasure.new('Elven Plate Mail', 15, 'armor', 0, 4, 2, 0, false, false)
    }
    t[:weapons] = {
      :stick        => Treasure.new('Stick', 1, 'weapon', 1, 0, 0, 0, false, false),
      :dagger       => Treasure.new('Dagger', 3, 'weapon', 2, 0, 0, 0, false, false),
      :mace         => Treasure.new('Mace', 6, 'weapon', 3, 0, 0, 0, false, false),
      :sabre        => Treasure.new('Sabre', 5, 'weapon', 2, 0, 1, 0, false, false),
      :longsword    => Treasure.new('Long Sword', 10, 'weapon', 4, 0, 0, 0, false, false),
      :magicsabre   => Treasure.new('Magic Sabre', 11, 'weapon', 3, 0, 2, 0, false, false),
      :mightyaxe    => Treasure.new('Mighty Axe', 15, 'weapon', 5, 0, 0, 0, false, false),
      :flamingsword => Treasure.new('Flaming Sword', 25, 'weapon', 6, 0, 1, 0, false, false)
    }
    t[:helmets] = {
      :jauntyhat    => Treasure.new('Jaunty Hat', 1, 'helmet', 0, 1, 0, 0, false, false),
      :chaincoif    => Treasure.new('Chain Coif', 3, 'helmet', 0, 2, 0, 0, false, false),
      :ironhelmet   => Treasure.new('Iron Helmet', 6, 'helmet', 0, 3, 0, 0, false, false),
      :elvenhelmet  => Treasure.new('Elven Helmet', 8, 'helmet', 0, 2, 2, 0, false, false),
      :magichelm    => Treasure.new('Magic Helm', 10, 'helmet', 0, 3, 2, 0, false, false),
      :hornedhelm   => Treasure.new('Horned Helm', 13, 'helmet', 2, 4, 0, 0, false, false),
      :helmofwisdom => Treasure.new('Helm Of Wisdom', 20, 'helmet', 0, 3, 2, 0, false, false)
    }
    t[:gloves]  = {
      :onemitten         => Treasure.new('One Purple Mitten', 1, 'gloves', 0, 1, 0, 0, false, false),
      :leathergloves     => Treasure.new('Leather Gloves', 3, 'gloves', 0, 1, 1, 0, false, false),
      :chaingloves       => Treasure.new('Chain Gloves', 6, 'gloves', 0, 3, 0, 0, false, false),
      :mailedfist        => Treasure.new('Mailed Fist', 10, 'gloves', 1, 3, 0, 0, false, false),
      :glovesofquickness => Treasure.new('Gloves Of Quickness', 12, 'gloves', 0, 1, 3, 0, false, false),
      :glovesofthievery  => Treasure.new('Gloves Of Thievery', 12, 'gloves', 0, 1, 1, 0, false, false)
    }
    t[:boots]   = {
      :bundleofrags  => Treasure.new('A Bundle Of Rags', 1, 'boots', 0, 1, 0, 0, false, false),
      :leatherboots  => Treasure.new('Leather Boots', 3, 'boots', 0, 1, 1, 0, false, false),
      :chainboots    => Treasure.new('Chain Boots', 6, 'boots', 0, 2, 1, 0, false, false),
      :bootsofspeed  => Treasure.new('Boots of Speed', 10, 'boots', 0, 1, 4, 0, false, false),
      :spikedgreaves => Treasure.new('Spiked Greaves', 10, 'boots', 2, 3, 0, 0, false, false)
    }
    t[:rings]   = {
      :ringofprot1        => Treasure.new('Ring Of Protection +1', 2, 'ring', 0, 1, 0, 0, false, false),
      :ringofprot2        => Treasure.new('Ring Of Protection +2', 4, 'ring', 0, 2, 0, 0, false, false),
      :ringofprot3        => Treasure.new('Ring Of Protection +3', 7, 'ring', 0, 3, 0, 0, false, false),
      :ringofspeed1       => Treasure.new('Ring Of Speed +1', 2, 'ring', 0, 0, 1, 0, false, false),
      :ringofspeed2       => Treasure.new('Ring Of Speed +2', 4, 'ring', 0, 0, 2, 0, false, false),
      :ringofspeed3       => Treasure.new('Ring Of Speed +3', 7, 'ring', 0, 0, 3, 0, false, false),
      :ringofregeneration => Treasure.new('Ring Of Regeneration', 10, 'ring', 0, 0, 0, 0, false, false),
      :ringofwealth       => Treasure.new('Ring Of Wealth', 10, 'ring', 0, 0, 0, 0, false, false)
    }
    t[:amulets] = {
      :shinybauble       => Treasure.new('A shiny bauble your mother gave you', 1, 'amulet', 0, 0, 0, 0, false, false),
      :medicammy         => Treasure.new('A pendant from the medical guild', 8, 'amulet', 0, 0, 0, 0, false, false),
      :periaptoflearning => Treasure.new('Periapt of Learning (Nerd!)', 8, 'amulet', 0, 0, 0, 0, false, false)
    }
    t
  end

  def self.monsters
    m = Hash.new()

    m[:low]    = {
      :goblin    => Monster.new('Goblin', 0, 0, 0, 0, 5),
      :kobold    => Monster.new('Kobold', 0, -1, -1, 2, 5),
      :giantrat  => Monster.new('Giant Rat', 0, 1, 0, 0, 2),
      :lizardman => Monster.new('Lizard Man', 0, 0, 2, -1, 5),
      :bandit    => Monster.new('Bandit', 0, 1, -2, 1, 5),
      :centipede => Monster.new('Centipede', 0, -1, 1, -1, 8),
      :skeleton  => Monster.new('Skeleton', 0, 2, 0, -1, 2)
    }
    m[:medium] = {
      :hobgoblin  => Monster.new('Hobgoblin', 0, 0, 0, 0, 11),
      :manticore  => Monster.new('Manticore', 0, -1, 0, 3, 5),
      :tiger      => Monster.new('Tiger', 0, 2, 0, 0, 8),
      :bugbear    => Monster.new('Bugbear', 0, 0, 3, -1, 8),
      :swordsman  => Monster.new('Swordsman', 0, 1, -1, 1, 8),
      :giantsnake => Monster.new('Giant Snake', 0, 1, 1, -2, 8),
      :ghoul      => Monster.new('Ghoul', 0, 4, -1, -1, 5)
    }
    m[:high] = {
      :giant     => Monster.new('Giant', 0, 0, 0, 0, 17),
      :quickling => Monster.new('Quickling', 0, -1, 0, 4, 8),
      :lion      => Monster.new('Lion', 0, 3, 0, 0, 11),
      :golem     => Monster.new('Golem', 0, 1, 4, -2, 11),
      :knight    => Monster.new('Knight', 0, 2, 1, 1, 5),
      :dragon    => Monster.new('Dragon', 0, 1, 1, -1, 14),
      :vampire   => Monster.new('Vampire', 0, 4, 0, -1, 8)
    }
    m
  end
end
