# 8-Bit RPG the fully playable zygote? powered by Ruby!
# written and coded by Jackson Kisling
# This version update: 4-25-12
require 'debugger'
require_relative 'player'
require_relative 'treasure'
require_relative 'monster'

require_relative 'seeds'
module FIGHTER
  class Game
    def rolld (x)
      (rand(x) + 1)
    end

    def play()
      notreasure = Treasure.new('none', 0, 'alltypes', 0, 0, 0, 0, false, false)

      treasures  = SEEDS.treasures
      allarmor   = treasures[:armor].values
      allweapons = treasures[:weapons].values
      allhelmets = treasures[:helmets].values
      allgloves  = treasures[:gloves].values
      allboots   = treasures[:boots].values
      allrings   = treasures[:rings].values
      allamulets = treasures[:amulets].values


      monsters   = SEEDS.monsters
      lowmonster = monsters[:low].values
      medmonster = lowmonster + monsters[:medium].values

      highmonster = medmonster + monsters[:high].values

      frillyunderwear = treasures[:armor][:frillyunderwear]
      stick           = treasures[:weapons][:stick]
      shinybauble     = treasures[:amulets][:shinybauble]
      playerinventory = [notreasure, frillyunderwear, stick, notreasure, notreasure, notreasure, notreasure, shinybauble]

      badass    = 0
      storeopen = true
      puts 'What is your name, mighty warrior?'
      you      = Player.new(nil, 1, 0, 0, 1, 10, 10, 0, 0, false)
      you.name = gets.chomp
      puts
      puts you.name.to_s + ' is a weakling\'s name.  Prepare to die in my arena!  Bwahahaaaa! <cough>'
      frillyunderwear.equip
      stick.equip; shinybauble.equip
      puts
      you.tellstats
      puts

#testing apparatus--delete for final version
      if you.name == 'tester'
        puts 'Oh, pardon me master Jackson.  I did not realize it was you.'
        puts 'Your real stats are:'
        you.hp   = 1
        you.gold = 10
        you.tellstats
      end

          # GAME STARTS HERE FOR REAL

      until you.dead # This is my favorite line of code thus far.
        action = ''
        until action == 'G' or action == 'I' or action == 'S' or action == 'F' or action == 'D'
          puts
          puts 'Select from one of the following actions.  You can:'
          puts '(F)ight in the arena'
          puts 'Check your(I)nventory'
          puts 'Check your vital (S)tatistics'
          puts 'Visit the (D)octor'
          puts 'or wander through our (G)ift shop'
          action = gets.chomp.upcase
        end

        if action == 'S'
          puts
          you.tellstats
        end

        if action == 'D'
          badass = 0
          puts
          guildmember = false
          guildmember = true if treasures[:amulets][:medicammy].equipped == true
          doctors = ['Feelgood', 'McGillicudy', 'Murderchop', 'Frank-N-Furter', 'Scarydoctorname', 'Shmockter']
          puts 'Doctor ' + doctors[rand(6)].to_s + ' will see you now.'
          healme = 10000
          puts 'You currently have ' + you.gold.to_s + ' gold.'
          docsays = 'The Doctor will cast a healing spell on you for three gold.'
          docsays.sub!('three', 'one') if guildmember
          puts docsays
          puts 'You can be healed a total of ' + (you.maxhp - you.hp).to_s + ' hit points.'
          if not guildmember
            until healme == Integer and you.gold >= (healme * 3)
              puts 'How many healing spells would you like to buy?'
              healme = gets.chomp.to_i
              puts 'You cannot afford that.' if you.gold < (healme * 3)
            end
          end
          if guildmember
            until healme == Integer and you.gold >= healme
              puts 'How many healing spells would you like to buy?'
              healme = gets.chomp.to_i
              puts 'You cannot afford that.' if (you.gold < healme)
            end
          end
          h = 0
          (healme).times do
            spell = rolld(6)
            h     = h + spell
          end
          you.gold = you.gold - (healme * 3) if not guildmember
          you.gold = (you.gold - healme) if guildmember

          you.hp = you.hp + h
          if you.hp >= you.maxhp
            you.hp = you.maxhp
            puts 'The Doctor has returned you to full health'
          else
            puts 'The Doctor has healed ' + h.to_s + ' hit points.'
          end
        end

        if action == 'I'
          puts
          puts 'You are carrying the following items:'
          playerinventory.each do |x|
            items = x.name.to_s
            puts items + "\n" unless x == notreasure
          end
        end

        if action == 'G' and not storeopen
          puts
          puts 'The store is closed.  Come back after your next battle.'
        end

        if action == 'G' and storeopen
          puts
          badass      = 0
          buy         = 0
          armorstock  = allarmor[rand(7)]
          weaponstock = allweapons[rand(8)]
          helmetstock = allhelmets[rand(7)]
          glovesstock = allgloves[rand(6)]
          bootstock   = allboots[rand(5)]
          ringstock   = allrings[rand(8)]
          amuletstock = allamulets[rand(3)]
          storestock  = [notreasure, armorstock, weaponstock, helmetstock, glovesstock, bootstock, ringstock, amuletstock]
          puts 'Welcome to the arena gift shop.  Here is what we have for sale today:'
          puts
          puts '1. ' + armorstock.name + '     ---' + armorstock.value.to_s + ' gold'
          puts '2. ' + weaponstock.name + '     ---' + weaponstock.value.to_s + ' gold'
          puts '3. ' + helmetstock.name + '     ---' + helmetstock.value.to_s + ' gold'
          puts '4. ' + glovesstock.name + '     ---' + glovesstock.value.to_s + ' gold'
          puts '5. ' + bootstock.name + '     ---' + bootstock.value.to_s + ' gold'
          puts '6. ' + ringstock.name + '     ---' + ringstock.value.to_s + ' gold'
          puts '7. ' + amuletstock.name + '     ---' + amuletstock.value.to_s + ' gold'
          puts
          puts 'You currently have ' + you.gold.to_s + ' gold.'
          until buy==1 or buy==2 or buy==3 or buy==4 or buy==5 or buy==6 or buy==7 or buy==8
            puts 'You may purchase one item, or enter 8 to leave the store.'
            buy = gets.chomp.to_i
          end
          unless buy==8
            if you.gold >= (storestock[buy]).value
              if playerinventory[buy] == notreasure
                puts 'You have purchased the ' + (storestock[buy]).name.to_s
                you.gold = you.gold - (storestock[buy]).value
                (storestock[buy]).equip
                playerinventory[buy] = storestock[buy]
              else
                puts 'You are already carrying ' + (playerinventory[buy]).name.to_s + '.'
                replace = ''
                until replace == 'Y' or replace == 'N'
                  puts 'Do you wish to replace it with ' + (storestock[buy]).name.to_s + '? (Y/N)'
                  replace = gets.chomp.upcase
                end
                if replace == 'Y'
                  puts 'You have purchased the ' + (storestock[buy]).name.to_s
                  you.gold = you.gold - (storestock[buy]).value
                  (playerinventory[buy]).unequip
                  (storestock[buy]).equip
                  playerinventory[buy] = storestock[buy]
                else
                  puts 'Okay then, get out of my store!'
                end
              end
            else
              puts 'You cannot afford that.'
            end
          end
          puts 'You may come back again after your next battle.' if buy==8
          storeopen = false
        end

        if action == 'F'
          thismonster = lowmonster[rand(7)] if (you.lvl < 4)
          thismonster = medmonster[rand(14)] if (you.lvl > 3) and (you.lvl < 7)
          thismonster = highmonster[rand(14)] if (you.lvl > 6)
          thismonster.lvl = (you.lvl + rand(3) - 1)
          (thismonster.lvl).times do
            x = rolld(4)
            if x == 4
              thismonster.attack = thismonster.attack + 1
            elsif x == 3
              thismonster.defense = thismonster.defense + 1
            elsif x == 2
              thismonster.initiative = thismonster.initiative + 1
            else
              thismonster.hp = thismonster.hp + 3
            end
          end
          thismonster.attack = 0 if thismonster.attack < 0
          thismonster.defense = 0 if thismonster.defense < 0
          thismonster.initiative = 0 if thismonster.initiative < 0

          myarmor=0; myhelmet=0; mygloves=0; myboots=0; myring=0; myamulet=0; myweapon=0
          allarmor.each do |x|
            ; myarmor = x.defensebonus if x.equipped;
          end
          allhelmets.each do |x|
            ; myhelmet = x.defensebonus if x.equipped;
          end
          allgloves.each do |x|
            ; mygloves = x.defensebonus if x.equipped;
          end
          allboots.each do |x|
            ; myboots = x.defensebonus if x.equipped;
          end
          allrings.each do |x|
            ; myring = x.defensebonus if x.equipped;
          end
          allweapons.each do |x|
            ; myweapon = x.defensebonus if x.equipped;
          end
          allamulets.each do |x|
            ; myamulet = x.defensebonus if x.equipped;
          end
          totaldefense = (myarmor + myhelmet + mygloves + myboots + myring + myamulet + myweapon + you.defense)

          allarmor.each do |x|
            ; myarmor = x.attackbonus if x.equipped;
          end
          allhelmets.each do |x|
            ; myhelmet = x.attackbonus if x.equipped;
          end
          allgloves.each do |x|
            ; mygloves = x.attackbonus if x.equipped;
          end
          allboots.each do |x|
            ; myboots = x.attackbonus if x.equipped;
          end
          allrings.each do |x|
            ; myring = x.attackbonus if x.equipped;
          end
          allweapons.each do |x|
            ; myweapon = x.attackbonus if x.equipped;
          end
          allamulets.each do |x|
            ; myamulet = x.attackbonus if x.equipped;
          end
          totalattack = (myarmor + myhelmet + mygloves + myboots + myring + myamulet + myweapon + you.attack)

          allarmor.each do |x|
            ; myarmor = x.initbonus if x.equipped;
          end
          allhelmets.each do |x|
            ; myhelmet = x.initbonus if x.equipped;
          end
          allgloves.each do |x|
            ; mygloves = x.initbonus if x.equipped;
          end
          allboots.each do |x|
            ; myboots = x.initbonus if x.equipped;
          end
          allrings.each do |x|
            ; myring = x.initbonus if x.equipped;
          end
          allweapons.each do |x|
            ; myweapon = x.initbonus if x.equipped;
          end
          allamulets.each do |x|
            ; myamulet = x.initbonus if x.equipped;
          end
          totalinitiative = (myarmor + myhelmet + mygloves + myboots + myring + myamulet + myweapon + you.initiative)

          yousurprise = false; msurprise = false
          yousurprise = true if (totalinitiative >= (thismonster.initiative * 2))
          msurprise = true if (thismonster.initiative >= (totalinitiative * 2))
          puts
          puts 'Prepare yourself for combat, weakling!'
          puts 'You have been attacked by a level ' + thismonster.lvl.to_s + ' ' + thismonster.name.to_s + '!'
          puts
          puts 'The ' + thismonster.name.to_s + '\'s stats are:'
          puts 'Attack: ' + thismonster.attack.to_s + '   Defense:' + thismonster.defense.to_s + '   Initiative:' + thismonster.initiative.to_s + '   HP:' + thismonster.hp.to_s
          puts 'Your stats are:'
          puts 'Attack: ' + totalattack.to_s + '   Defense:' + totaldefense.to_s + '   Initiative:' + totalinitiative.to_s + '   HP:' + you.hp.to_s
          puts 'You have the element of surprise.' if yousurprise
          puts 'The ' + thismonster.name.to_s + ' has surprised you.' if msurprise
          puts 'READY?  FIGHT!'
          puts
          damage          = 0
          lowexclamations = ['Whuff!', 'Blerp', 'Ting!', 'Oooh, big man!', 'Lame.', 'You like dat?', 'What a pansy.', 'Wimpy.', 'Grandma, is that you?']
          hiexclamations  = ['Crack!', 'Bang!', 'Oooh, ouch!', 'That\'s gotta hurt.', 'Smash!', 'Whoa, take it easy!', 'Holy crap, dude!', 'Kaboom!', 'Hurt me daddy!']

          if yousurprise
            damage = (you.attack + rolld(6) - thismonster.defense - rolld(6))
            damage = 0 if damage < 0
            exclam = lowexclamations[rand(8)].to_s if (damage < 5)
            exclam = hiexclamations[rand(8)].to_s if (damage >= 5)
            puts 'You deal ' + damage.to_s + ' damage to the ' + thismonster.name.to_s + '.  ' + exclam
            thismonster.hp = thismonster.hp - damage
          end
          if msurprise
            damage = (thismonster.attack + rolld(6) - you.defense - rolld(6))
            damage = 0 if damage < 0
            exclam = lowexclamations[rand(8)].to_s if (damage < 5)
            exclam = hiexclamations[rand(8)].to_s if (damage >= 5)
            puts 'The ' + thismonster.name.to_s + ' deals ' + damage.to_s + ' damage to you. ' + exclam
            you.hp = you.hp - damage
          end

          until you.hp < 1 or thismonster.hp < 1
            if you.initiative >= thismonster.initiative
              damage = (you.attack + rolld(6) - thismonster.defense - rolld(6))
              damage = 0 if damage < 0
              exclam = lowexclamations[rand(8)].to_s if (damage < 5)
              exclam = hiexclamations[rand(8)].to_s if (damage >= 5)
              puts 'You deal ' + damage.to_s + ' to the ' + thismonster.name.to_s + '.  ' + exclam
              thismonster.hp = thismonster.hp - damage
              break if thismonster.hp < 1
              damage = (thismonster.attack + rolld(6) - you.defense - rolld(6))
              damage = 0 if damage < 0
              exclam = lowexclamations[rand(8)].to_s if (damage < 5)
              exclam = hiexclamations[rand(8)].to_s if (damage >= 5)
              puts 'The ' + thismonster.name.to_s + ' deals ' + damage.to_s + ' damage to you. ' + exclam
              you.hp = you.hp - damage
            end
            if thismonster.initiative > you.initiative
              damage = (thismonster.attack + rolld(6) - you.defense - rolld(6))
              damage = 0 if damage < 0
              exclam = lowexclamations[rand(8)].to_s if (damage < 5)
              exclam = hiexclamations[rand(8)].to_s if (damage >= 5)
              puts 'The ' + thismonster.name.to_s + ' deals ' + damage.to_s + ' damage to you. ' + exclam
              you.hp = you.hp - damage
              break if you.hp < 1
              damage = (you.attack + rolld(6) - thismonster.defense - rolld(6))
              damage = 0 if damage < 0
              exclam = lowexclamations[rand(8)].to_s if (damage < 5)
              exclam = hiexclamations[rand(8)].to_s if (damage >= 5)
              puts 'You deal ' + damage.to_s + ' to the ' + thismonster.name.to_s + '.  ' + exclam
              thismonster.hp = thismonster.hp - damage
            end
          end
          if thismonster.hp < 1
            puts
            puts 'You have defeated the ' + thismonster.name.to_s + '!'
            xpreward   = (thismonster.lvl + rolld(3))
            goldreward = (thismonster.lvl + rolld(6))
            you.gold   = you.gold + goldreward
            you.xp     = you.xp + xpreward
            puts 'You gain ' + xpreward.to_s + ' experience points, bringing your total to ' + you.xp.to_s
            puts 'You gain ' + goldreward.to_s + ' gold pieces, bringing your total up to ' + you.gold.to_s
            badass = badass + 1
            if treasures[:rings][:ringofregeneration].equipped
              you.hp = you.hp + rolld(6)
              you.hp = you.maxhp if you.hp > you.maxhp
              puts
              puts 'You are healed by your ring!'
            end
            if treasures[:rings][:ringofwealth].equipped
              poof = rolld(6)
              puts
              puts 'An extra ' + poof.to_s + ' gold magically appears!'
              you.gold = you.gold + poof
            end
            if treasures[:gloves][:glovesofthievery].equipped
              steal = rolld(3)
              puts
              puts 'You pinch an extra ' + steal.to_s + ' gold off of the corpse.'
              you.gold = you.gold + steal
            end
            if treasures[:amulets][:periaptoflearning].equipped
              learn = rolld(3)
              puts
              puts 'You have learned extra tactics from this battle.'
              you.xp = you.xp + learn
            end
            if treasures[:helmets][:helmofwisdom].equipped
              learn = rolld(3)
              puts
              puts 'You have learned extra tactics from this battle.'
              you.xp = you.xp + learn
            end
            if badass >= 3
              puts
              puts 'You have defeated three opponents in a row without stopping.  What a badass!'
              badassgold = rolld(6)
              badassxp   = rolld(6)
              you.gold   = you.gold + badassgold
              you.xp     = you.xp + badassxp
              puts 'You gain an extra ' + badassgold.to_s + ' gold, bringing your total up to to ' + you.gold.to_s
              puts 'You gain an extra ' + badassxp.to_s + ' experience, bringing your total up to to ' + you.xp.to_s
              puts
            end
            you.levelup
            storeopen = true
          end
          if you.hp < 1
            if shinybauble.equipped
              puts
              puts 'You have been defeated by the ' + thismonster.name.to_s + '!'
              puts 'The ' + thismonster.name.to_s + ' is entranced by your Shiny Bauble.'
              puts 'He takes it in return for your life.'
              puts
              shinybauble.unequip
              playerinventory[7] = notreasure
              you.hp             = (you.maxhp / 2).to_i
              storeopen          = true
            else
              you.dead = true
            end # shiny bauble
          end # of combat transition
        end # end of the Action==F statement
      end # end of the until you.dead
      puts
      puts 'You have been skullfucked by the ' + thismonster.name.to_s + '!'
      puts
      puts 'Game Over, motherfucker.'
      exit

    end

  end

end

def game_on
  game = FIGHTER::Game.new
  game.play
end