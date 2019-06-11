# class Scene
#     def enter()
#         puts "This scene is not yet configured. Subclass it and implement enter()"
#         exit(1)
#     end
# end

# class Engine

#     def initialize(scene_map)
#         @scene_map = scene_map
#     end

#     def play()
#         current_scene = @scene_map.opening_scene()
#         last_scene = @scene_map.next_scene('finished')

#         while current_scene != last_scene
#             next_scene_name = current_scene.enter()
#             current_scene = @scene_map.next_scene(next_scene_name)
#     end

#     #be sure to print out the last scene
#     current_scene.enter()

# end

# # Variable preceded by @ is an instance variable
# # Variable preceded by @@ is a class variable.

# class Death < Scene

#     @@quips = [
#         "You died. You kinda suck at this.",
#         "You died. I have a small puppy that's better at this.",
#         "You died. You might have to consider switching careers at this point.",
#         "You died. Have you thought about asking your little sister for help?"
#     ]

#     def enter()
#         puts @@quips[rand(0..(@@quips.length - 1))]
#         exit(1)
#     end

# end

# class Sleeping_Room < Scene

#     def start()
#         puts "You wake up in a dark room."
#         puts "It feels like you've slept for a century."
#         puts "You can't remember much, but you can remember your name."
    
#         get_name
    
#     end
    
#     def get_name()
#         puts "What is your name?"
    
#         print "> "
    
#         name = $stdin.gets.chomp
    
#         puts "Your name is #{name}. Is this correct?"
#         puts "1. Yes 2. No"
#         choice = Integer(gets) rescue false
    
#         if choice == 1
#             puts "Your name is #{name}."
#             find_egg
#         elsif choice == 2
#             get_name
#         else
#             puts "I'm sorry, I did not understand."
#             get_name
#         end
    
#     end
    
#     def find_egg()
#         puts "You stumble around the dark room until your eyes adjust."
#         puts "There is a brilliant egg-shaped white stone emitting a faint light close by."
#         puts "There is also a leather bag on the floor."
    
#         grab_stone
#     end
    
#     def grab_stone()
    
#         puts "Do you grab the stone?"
#         puts "1. Yes 2. No"
    
#         choice = Integer(gets) rescue false
    
#         if choice == 1
#             puts "You grab the bag and stuff the stone in it, and decide to walk outside."
#             walk_outside
#         elsif choice == 2
#             puts "There's not much else to do in this place."
#             puts "You realize you are very hungry."
    
#             grab_stone
#         else
#             puts "I'm sorry, I did not understand."
#             grab_stone
#         end
#     end
    
#     def walk_outside()
#         puts "You walk outside, and the bright sun hurts your eyes."
#     end

#     # return 'riddle_room_1'

# end

# class Riddle_Room_1 < Scene

#     def enter()
#         puts "You are in riddle room 1."
#     end

# end

# class Riddle_Room_2 < Scene
   
#     def enter()
#         puts "You are in riddle room 2."
#     end

# end

# class Riddle_Room_3 < Scene

#     def enter()
#         puts "You are in riddle room 3."
#     end

# end

# class Secret_Room < Scene

#     def enter()
#         puts "You are in the secret room. You win!"
#     end
# end

# class Map

#     @@scenes = {
#         'sleeping_room' => Sleeping_Room.new(),
#         'riddle_room_1' => Riddle_Room_1.new(),
#         'riddle_room_2' => Riddle_Room_2.new(),
#         'riddle_room_3' => Riddle_Room_3.new(),
#         'death' => Death.new(),
#         'secret_room' => Secret_Room.new(),
#     }

#     def initialize(start_scene)
#         @start_scene = start_scene
#     end

#     def next_scene(scene_name)
#         val = @@scenes[scene_name]
#         return val
#     end

#     def opening_scene()
#         return next_scene(@start_scene)
#     end

# end

# a_map = Map.new('sleeping_room')
# a_game = Engine.new(a_game)
# a_game.play()



###########################################################################################

class Scene
    def enter()
        puts "This scene is not yet configured. Subclass and implement enter()."
        exit(1)
    end
end

class Engine
    
    def initialize(scene_map)
        @scene_map = scene_map
    end

    def play()
        current_scene = @scene_map.opening_scene()
        last_scene = @scene_map.next_scene('finished')

        while current_scene != last_scene
            next_scene_name = current_scene.enter()
            current_scene = @scene_map.next_scene(next_scene_name)
        end

        # be sure to print out the last scene
        current_scene.enter() # breaks here??
    end

end

class Death < Scene

    @@quips = [
        "You died. You kinda suck at this.",
        "You died. I have a small puppy that's better at this.",
        "You died. You might have to consider switching careers at this point.",
        "You died. Have you thought about asking your little sister for help?"
    ]

    def enter()
        puts @@quips[rand(0..(@@quips.length - 1))]
        exit(1)
    end
end

class CentralCorridor < Scene

    def enter()
      puts "The Gothons of Planet Percal #25 have invaded your ship and destroyed"
      puts "your entire crew.  You are the last surviving member and your last"
      puts "mission is to get the neutron destruct bomb from the Weapons Armory,"
      puts "put it in the bridge, and blow the ship up after getting into an "
      puts "escape pod."
      puts "\n"
      puts "You're running down the central corridor to the Weapons Armory when"
      puts "a Gothon jumps out, red scaly skin, dark grimy teeth, and evil clown costume"
      puts "flowing around his hate filled body.  He's blocking the door to the"
      puts "Armory and about to pull a weapon to blast you."
      print "> "
  
      action = $stdin.gets.chomp
  
      if action == "shoot!"
        puts "Quick on the draw you yank out your blaster and fire it at the Gothon."
        puts "His clown costume is flowing and moving around his body, which throws"
        puts "off your aim.  Your laser hits his costume but misses him entirely.  This"
        puts "completely ruins his brand new costume his mother bought him, which"
        puts "makes him fly into an insane rage and blast you repeatedly in the face until"
        puts "you are dead.  Then he eats you."
        return 'death'
  
      elsif action == "dodge!"
        puts "Like a world class boxer you dodge, weave, slip and slide right"
        puts "as the Gothon's blaster cranks a laser past your head."
        puts "In the middle of your artful dodge your foot slips and you"
        puts "bang your head on the metal wall and pass out."
        puts "You wake up shortly after only to die as the Gothon stomps on"
        puts "your head and eats you."
        return 'death'
  
      elsif action == "tell a joke"
        puts "Lucky for you they made you learn Gothon insults in the academy."
        puts "You tell the one Gothon joke you know:"
        puts "Lbhe zbgure vf fb sng, jura fur fvgf nebhaq gur ubhfr, fur fvgf nebhaq gur ubhfr."
        puts "The Gothon stops, tries not to laugh, then busts out laughing and can't move."
        puts "While he's laughing you run up and shoot him square in the head"
        puts "putting him down, then jump through the Weapon Armory door."
        return 'laser_weapon_armory'
  
      else
        puts "DOES NOT COMPUTE!"
        return 'central_corridor'
      end
    end
end

class LaserWeaponArmory < Scene

    def enter()
      puts "You do a dive roll into the Weapon Armory, crouch and scan the room"
      puts "for more Gothons that might be hiding.  It's dead quiet, too quiet."
      puts "You stand up and run to the far side of the room and find the"
      puts "neutron bomb in its container.  There's a keypad lock on the box"
      puts "and you need the code to get the bomb out.  If you get the code"
      puts "wrong 10 times then the lock closes forever and you can't"
      puts "get the bomb.  The code is 3 digits."
    #   code = "#{rand(1..9)}#{rand(1..9)}#{rand(1..9)}"
    code = 123
      print "[keypad]> "
    #   guess = $stdin.gets.chomp
    guess = Integer(gets) rescue false
      guesses = 0
  
      while guess != code && guesses < 10
        puts "BZZZZEDDD!"
        guesses += 1
        print "[keypad]> "
        guess = $stdin.gets.chomp
      end
  
      if guess == code
          puts "The container clicks open and the seal breaks, letting gas out."
          puts "You grab the neutron bomb and run as fast as you can to the"
          puts "bridge where you must place it in the right spot."
          return 'the_bridge'
      else
          puts "The lock buzzes one last time and then you hear a sickening"
          puts "melting sound as the mechanism is fused together."
          puts "You decide to sit there, and finally the Gothons blow up the"
          puts "ship from their ship and you die."
          return 'death'
      end
    end
end
  
  
class TheBridge < Scene
  
    def enter()
      puts "You burst onto the Bridge with the netron destruct bomb"
      puts "under your arm and surprise 5 Gothons who are trying to"
      puts "take control of the ship.  Each of them has an even uglier"
      puts "clown costume than the last.  They haven't pulled their"
      puts "weapons out yet, as they see the active bomb under your"
      puts "arm and don't want to set it off."
      print "> "
  
      action = $stdin.gets.chomp
  
      if action == "throw the bomb"
        puts "In a panic you throw the bomb at the group of Gothons"
        puts "and make a leap for the door.  Right as you drop it a"
        puts "Gothon shoots you right in the back killing you."
        puts "As you die you see another Gothon frantically try to disarm"
        puts "the bomb. You die knowing they will probably blow up when"
        puts "it goes off."
        return 'death'
  
      elsif action == "slowly place the bomb"
        puts "You point your blaster at the bomb under your arm"
        puts "and the Gothons put their hands up and start to sweat."
        puts "You inch backward to the door, open it, and then carefully"
        puts "place the bomb on the floor, pointing your blaster at it."
        puts "You then jump back through the door, punch the close button"
        puts "and blast the lock so the Gothons can't get out."
        puts "Now that the bomb is placed you run to the escape pod to"
        puts "get off this tin can."
        return 'escape_pod'
      else
        puts "DOES NOT COMPUTE!"
        return "the_bridge"
      end
    end
end
  
  
class EscapePod < Scene
  
    def enter()
      puts "You rush through the ship desperately trying to make it to"
      puts "the escape pod before the whole ship explodes.  It seems like"
      puts "hardly any Gothons are on the ship, so your run is clear of"
      puts "interference.  You get to the chamber with the escape pods, and"
      puts "now need to pick one to take.  Some of them could be damaged"
      puts "but you don't have time to look.  There's 5 pods, which one"
      puts "do you take?"
  
    #   good_pod = rand(1..5)
    good_pod = 3
      print "[pod #]> "
      guess = $stdin.gets.chomp.to_i
  
      if guess != good_pod
        puts "You jump into pod %s and hit the eject button." % guess
        puts "The pod escapes out into the void of space, then"
        puts "implodes as the hull ruptures, crushing your body"
        puts "into jam jelly."
        return 'death'
      else
        puts "You jump into pod %s and hit the eject button." % guess
        puts "The pod easily slides out into space heading to"
        puts "the planet below.  As it flies to the planet, you look"
        puts "back and see your ship implode then explode like a"
        puts "bright star, taking out the Gothon ship at the same"
        puts "time.  You won!"
  
  
        return 'finished'
      end
    end
end
  
class Finished < Scene
    def enter()
      puts "You won! Good job."
    end
end

class Map
    @@scenes = {
      'central_corridor' => CentralCorridor.new(),
      'laser_weapon_armory' => LaserWeaponArmory.new(),
      'the_bridge' => TheBridge.new(),
      'escape_pod' => EscapePod.new(),
      'death' => Death.new(),
      'finished' => Finished.new(),
    }
  
  
    def initialize(start_scene)
      @start_scene = start_scene
    end
  
  
    def next_scene(scene_name)
      val = @@scenes[scene_name]
      return val
    end
  
    def opening_scene()
      return next_scene(@start_scene)
    end
end

a_map = Map.new('central_corridor')
a_game = Engine.new(a_map)
a_game.play()


######################################################################################

# class StartRoom < Scene
#     def enter()
#     end
# end

# class Riddle1 < Scene
#     def enter()
#     end
# end

# class Riddle2 < Scene
#     def enter()
#     end
# end

# class Riddle3 < Scene
#     def enter()
#     end
# end

# class SecretRoom < Scene
#     def enter()
#     end
# end

# class Map

#     def initialize(start_scene)
#     end

#     def next_scene(scene_name)
#     end

#     def opening_scene
#     end

# end

# a_map = Map.new('StartRoom')
# a_game = Engine.new(a_map)
# a_game.play()