# def start
#     puts "You wake up in a dark room."
#     puts "It feels like you've slept for a century."
#     puts "You can't remember much, but you can remember your name."

#     get_name

# end

# def get_name
#     puts "What is your name?"

#     print "> "

#     name = $stdin.gets.chomp

#     puts "Your name is #{name}. Is this correct?"
#     puts "1. Yes 2. No"
#     choice = Integer(gets) rescue false

#     if choice == 1
#         puts "Your name is #{name}."
#         find_egg
#     elsif choice == 2
#         get_name
#     else
#         puts "I'm sorry, I did not understand."
#         get_name
#     end

# end

# def find_egg
#     puts "You stumble around the dark room until your eyes adjust."
#     puts "There is a brilliant egg-shaped white stone emitting a faint light close by."
#     puts "There is also a leather bag on the floor."

#     grab_stone
# end

# def grab_stone

#     puts "Do you grab the stone?"
#     puts "1. Yes 2. No"

#     choice = Integer(gets) rescue false

#     if choice == 1
#         puts "You grab the bag and stuff the stone in it, and decide to walk outside."
#         walk_outside
#     elsif choice == 2
#         puts "There's not much else to do in this place."
#         puts "You realize you are very hungry."

#         grab_stone
#     else
#         puts "I'm sorry, I did not understand."
#         grab_stone
#     end
# end

# def walk_outside
#     puts "You walk outside, and the bright sun hurts your eyes."
# end

# start


############################################################################################


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

class StartRoom < Scene

    def enter()

        puts "\n"
        puts "The Kingdom's most valuable treasure has been stolen."
        puts "It is up to you, the King's most courageous knight, to seek it and bring it back."
        puts "In your quest, you have found that the treasure has been taken to a secret cave, "
        puts "where powerful magic reigns and dragons block your path."
        puts "In order to get past the Guardian Dragons, you must successfully solve each of their "
        puts "puzzles and riddles - or else encounter certain death."
        puts "\n"
        puts "You enter the cave and are immediately greeted by a gigantic Dragon statue, "
        puts "cold and gray but yet with brilliant eyes that seemed to stare into your soul."
        puts "You barely have enough time to fully take in the sight, before a voice booms "
        puts "throughout the cave, making the walls slightly tremble and the hairs on your arms "
        puts "stand up, sending a cold shiver down your spine."
        puts "\n"
        puts "'Ye who seeks passage through these cursed rooms, beware;', you heard the voice say, "
        puts "as it echoed and bounced off the stone walls."
        puts "'Solve the riddle given to ye and be granted passage, or face certain death."
        puts "Five tries shall be given, five opportunities to march forward;"
        puts "If none are correct, your life shall be the price."
        puts "I grant thee one last opportunity to turn back and be spared;"
        puts "Will ye agree to these terms? Or will ye leave this place?'"
        puts "You immediately realize you must tell the stone dragon your choice;"
        puts "What will it be? Will you 'leave'? Or will you 'stay'?"
        puts "> "

        get_choice
    end

    def get_choice

        action = $stdin.gets.chomp

        if action == "leave"
            puts "More afraid to lose your life than to lose your honor, you tell the dragon "
            puts "your choice and turn to walk out of the cave, to live to see another day."
            exit(1)

        elsif action == "stay"
            puts "You courageously tell the dragon you will stay and face its challenges, "
            puts "without missing a beat."
            puts "\n"
            return 'riddle_1'

        else
            puts "The dragon rumbles, and you can sense the door to the outside won't stay "
            puts "open for much longer; You must give an answer that is understood by this "
            puts "giant stone beast."
            puts "Will you 'leave'? Or will you 'stay'?"
            puts "\n"
            get_choice
        end
    end
end

class Riddle1 < Scene

    def enter()
        puts "You hear the large stone doors shut behind you, eliminating your only exit, "
        puts "and you know there's no turning back now."
        puts "Without missing a beat, the voice booms again."
        puts "'Forwards I am heavy.'"
        puts "'Backwards I am not.'"
        puts "'What am I?'"

        guess = $stdin.gets.chomp

        guesses = 0

        while (guess != 'ton' && guess != 'a ton') && guesses < 4
            guesses += 1
            puts "You wait after your answer, but there is no response."
            puts "You know you have given the wrong answer, and that you are one step "
            puts "closer to your untimely death."

            if guesses == 4
                puts "You still have #{5 - guesses} try left."
                puts "> "
            else
                puts "You still have #{5 - guesses} tries left."
            end
                
            guess = $stdin.gets.chomp
        end

        if guess == 'ton' || guess == 'a ton'
            puts "You hear a low rumbling which gradually gets louder."
            puts "As the walls and the ground beneath your feet shake, "
            puts "the great dragon statue begins to crack, and as big pieces of "
            puts "stone fall heavily to the floor by its great clawed feet, "
            puts "a brilliant ruby red dragon comes to life right before your eyes."
            puts "It opens its wings, which span the entire length of the stone room, "
            puts "and shakes off the rest of the debris from its body."
            puts "Its big, glowing yellow eyes focus on you, and you can't help but "
            puts "notice its huge white teeth on each side of its mouth, each as thick and "
            puts "long as a man's arm."
            puts "\n"
            puts "After a moment of silence that felt like an eternity, the voice booms "
            puts "against the walls of the room again, and you knew you had answered the "
            puts "dragon's riddle correctly."
            puts "'You may pass.', is all the dragon had to say to you, as it slowly walked "
            puts "to the side on four paws, revealing another immensely tall stone door behind it, "
            puts "which loudly creaked open, granting you access to the next room."
            puts "\n"
            return 'riddle_2'
        else
            puts "You confidently give your last answer, but hear silence in return, and you "
            puts "know this is the end. There is no use in pleading, as you know "
            puts "the stone dragon would not respond."
            puts "After a moment of silence that felt like an eternity, you hear a low rumbling "
            puts "which seemed to be coming from the floor, which slowly got louder and louder."
            puts "You feel the temperature in the stone room quickly shoot up, getting hotter and "
            puts "hotter each passing second, and you hear a nauseating gurgling noise - lava starts "
            puts "pouring in from each and every crack on the floor, walls, and ceiling, dripping "
            puts "and splattering. You accept your fate as lava slowly fills the room, and you can't "
            puts "tell what ends up killing you in the end - the lava itself, the immense heat "
            puts "generated by it, or the toxic fumes that fill your lungs until no oxygen is left."
            puts "The world goes dark."
            exit(1)
        end

    end
end

class Riddle2 < Scene

    def enter()
        puts "\n"
        puts "You cautiously walk past the red dragon as it stares at you, and find yourself in "
        puts "this long, dark corridor. You valiantly stride forward until you reach another "
        puts "room much like the last one."
        puts "\n"
        puts "This room also contains a gigantic stone dragon with eyes that seem to follow your "
        puts "every move."
        puts "Unsure what comes next, you wait anxiously. Thankfully not much time passes before "
        puts "you hear a familiar booming voice, somewhat deeper than the last dragon's."
        puts "'You have done well to reach me here.', says the dragon."
        puts "'Solve the riddle given to ye and be granted passage, or face certain death."
        puts "Five tries shall be given, five opportunities to march forward;"
        puts "If none are correct, your life shall be the price.'"
        puts "You don't expect the dragon to linger, and sure enough, the riddle quickly follows: "
        puts "'As a traveler travels to St. Ives,"
        puts "He meets a man with seven wives;"
        puts "Every wife had seven sacks,"
        puts "Every sack had seven cats,"
        puts "Every cat had seven kits."
        puts "Kits, cats, sacks, wives."
        puts "How many were going to St. Ives?"
        puts "> "

        # A dagger thrust at my own heart, Dictates the way I'm swayed. Left I stand, and right I yield, To the twisting of the blade. What am I?
        
        # You can use me to say hello,
        # You can use me to say goodbye.
        # I'm no good when I'm too dry,
        # I can be quick or I can be slow.
        # What am I?

        # Double my number, I'm less than a score, half of my number is less than four. Add one to my double when bakers are near, days of the week are still greater, I fear.
        # What am I?

        guess = $stdin.gets.chomp

        guesses = 0

        while (guess != 'one' && guess != '1') && guesses < 4
            guesses += 1
            puts "You wait after your answer, but there is no response."
            puts "You know you have given the wrong answer, and that you are one step "
            puts "closer to your untimely death."

            if guesses == 4
                puts "You still have #{5 - guesses} try left."
                puts "> "
            else
                puts "You still have #{5 - guesses} tries left."
            end
                
            guess = $stdin.gets.chomp
        end

        if guess == "one" || guess == "1"
            puts "You hear the same familar rumbling noise again, and watch in awe as the "
            puts "stone dragon comes to life much like the last one did."
            puts "As the debris falls off its body and the dirt clears, you can see this huge "
            puts "beast is a magnificent sapphire blue, with eyes like the clear blue sky."
            puts "It shakes its wings as if grateful to not be trapped within stone any longer, "
            puts "and says, 'You may pass' in its deep voice, as it slowly moves aside to reveal "
            puts "yet another great stone door."
            return 'riddle_3'
        else
            puts "Death"
            exit(1)
        end
    end
end

class Riddle3 < Scene

    def enter()
        puts "Riddle room 3"
        exit(1)
    end
end

class Map
    @@scenes = {
        'start_room' => StartRoom.new(),
        'riddle_1' =>   Riddle1.new(),
        'riddle_2' =>   Riddle2.new(),
        'riddle_3' =>   Riddle3.new(),
    }

    def initialize(start_scene)
        @start_scene = start_scene
    end

    def next_scene(scene_name)
        val = @@scenes[scene_name]
        return val
    end

    def opening_scene
        return next_scene(@start_scene)
    end
end

a_map = Map.new('start_room')
a_game = Engine.new(a_map)
a_game.play()