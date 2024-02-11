function add_names()
    global.biter_names = {
        "George",
        "Sue",
        "Mary",
        "Bob",
        "Cho",
        "Lee",
        "Henry",
        "Alice",
        "Amanda",
        "Tyler",
        "Kyle",
        "Sam",
        "Greg",
        "Varik",
        "Liz",
        "Lauren",
        "Eve",
        "Cathy",
        "Hao",
        "Indy",
        "Buster",
        "Buddy",
        "Chomps",
        "EmilyFlambe",
        "Nilaus",
        "Nefrums",
        "AntiElitz",
        "NotExfret",
        "Killer",
        "NomNoms",
        "Hungerz",
        "Taylor",
        "Bill",
        "Chad",
        "Carson",
        "Olivia",
        "_CodeGreen",
        "Periklis",
        "Jazlene",
        "Noah",
        "Liam",
        "Emerald",
        "Ruby",
        "Ymir",
        "Meow",
        "Aria",
        "Katrina",
        "Scott",
        "Mr. Bitter",
        "Johny",
        "Tommy",
        "Mrs. Bitter",
        "Bitter Jr.",
        "Bitey",
        "Ipsum Lorem",
        "Bob Ross",
        "Kid",
        "Alien",
        "Unit",
        "Amelia",
        "John Smith",
        "Charlotte",
        "Amy",
        "Rose",
        "Daisy",
        "Bubbles",
        "Ava",
        "Asher",
        "Isaiah",
        "Juan",
        "Maria",
        "Julio",
        "Ivy",
        "Ella",
        "Eli",
        "Nathan",
        "Random",
        "nullptr",
        "Megan",
        "Cueball",
        "Rex",
        "Ale",
        "Good Boi",
        "Soto",
        "I Hungerz",
        "Bug",
        "Zoe",
        "Kehlani",
        "Iris",
        "Chase",
        "Jacob",
        "Caroline",
        "Beau",
        "Claire",
        "Vivian",
        "Mr. Spitz",
        "Drop Tables",
        "Bud",
        "Coronavirus",
        "Derpy",
        "DinnerBone",
        "SoonToBeDead",
        "Lizzy",
        "Wavetrex",
        "Brevven",
        "Citizen 1",
        "Citizen 2",
        "Citizen 4",
        "GGs",
        "Klonan",
        "Kovarex",
        "Factorio",
        "Scorpion",
        "DoshDoshington",
        "Comkat",
        "1000x tech cost",
        "Earendel",
        "Pupper",
        "Doggo",
        "Bork",
        "Garath",
        "Max",
        "Minnie",
        "Mac",
        "Wilt",
        "King",
        "Prince",
        "Loki",
        "Chen",
        "Michelle",
        "Jenny",
        "Forest",
        "Bilka",
        "Fred Rogers",
        "Dasher",
        "Rudolph",
        "Raiguard",
        "Bobingabout",
        "TravisSucks",
        "Demi Lovato",
        "[item=iron-plate]",
        "quirky",
        "[item=pistol]",
        "[item=artillery-wagon-cannon]",
        "[item=submachine-gun]",
        "Sparticus",
        "Monty Python",
        "Majesty",
        "Mae",
        "Smith",
        "Tao",
        "Buddha",
        "Jesus",
        "Obama",
        "boskid",
        "Erythion",
        "Rseding",
        "Loren",
        "mikelat",
        "damzl",
        "alcari",
        "friendcalledfive",
        "Moridrex",
        "GT:NH",
        "\"Quotes\"",
        "Biter no. 457098q709827092457",
        ":)",
        "Fourier Transform",
        "Galous",
        "Everiste",
        "Abel",
        "Tony",
        "SquidCoder",
        "Michal",
        "Tomas",
        "Albert",
        "Twinsen",
        "Robert",
        "Nick",
        "Wube",
        "Person",
        "Batman",
        "Ken",
        "Scoob"
    }

    global.biter_memoirs = {
        "was the only one to take the trash out back at base.",
        "had a kid who wanted to be an engineer one day.",
        "was hoping to run off with their lover in an expansion party tomorrow.",
        "will never see their pet dog again.",
        "was making an overhaul mod that will never see the light of day.",
        "had hopes and dreams that they'll never achieve.",
        "was on the brink of a scientific discovery.",
        "will be remembered for their long career in nest creep management.",
        "was actually low-key a dick, but also felt deeply alone.",
        "forgives you.",
        "wishes you were playing on peaceful mode so that it didn't have to be this way.",
        "is sorry to burden you with this chat message.",
        "was saving up money to buy factorio themselves.",
        "told mom that it would just be a second to do the raid and then they'd be back.",
        "had medical problems from the pollution.",
        "wanted to be a pacifist but was conscripted into the biter attack group.",
        "screamed as they met a painful death.",
        "wishes there was a heaven for biters and not just a void of nothingness.",
        "just wanted to visit the rocket crash site as a tourist.",
        "was the last of a long line of silversmiths.",
        "was happy since they just made friends with a worm back at base.",
        "sorta wanted to die anyways, just not like this.",
        "loved to take the crust off the bread before eating their PB & J's.",
        "liked to listen to classical music.",
        "was going to get married tomorrow.",
        "wants you to tell the biters back at base that they're loved.",
        "is understanding about your mistakes in life.",
        "just wanted to chat.",
        "wants you to know that you're loved, even if they aren't.",
        "had a pet cat named Aria.",
        "was writing a novel that will never be published.",
        "forgot to take their dog for a walk and was planning to do it when they got back.",
        "was wondering when you'd stop playing... when the pain would end...",
        "doesn't wish this upon you even though you wished it upon them.",
        "thinks of their pet hamster back at base in their final moments.",
        "was vice president of the 'Charity for Free Biter Housing', which helped biters in unfortunate circumstances find a home.",
        "left a secret love card for a worm back at base.",
        "was looking forward to Christmas.",
        "was about to finish a 50 hour work week and buy a house.",
        "will never finish their model train set.",
        "was going to visit their grandma this weekend.",
        "was trying their best.",
        "is disappointed in you, just like your parents.",
        "wonders who will take care of their parrot now that they're gone.",
        "rehabilitated stray kittens.",
        "was the proud owner of a pet goat named bailey.",
        "has a wife named Anna who doesn't know how to explain to the kids why her partner isn't coming home."
    }
end

script.on_init(function ()
    add_names()

    global.units_to_names = {}
    global.units_to_entities = {}
end)

script.on_configuration_changed(function ()
    add_names()
end)

script.on_event(defines.events.on_entity_spawned, function(event)
    if event.entity.type == "unit" and math.random() < settings.global["exfret-biter-memoirs-name-chance"].value then
        local biter_name = global.biter_names[math.random(1, #global.biter_names)]

        global.units_to_names[event.entity.unit_number] = biter_name
        global.units_to_entities[event.entity.unit_number] = event.entity
    end
end)

script.on_event(defines.events.on_entity_died, function(event)
    if event.entity.type == "unit" then
        if math.random() < settings.global["exfret-biter-memoirs-message-chance"].value then
            local biter_memoir = global.biter_memoirs[math.random(1, #global.biter_memoirs)]

            local my_name = global.units_to_names[event.entity.unit_number]
            if my_name == nil then
                my_name = global.biter_names[math.random(1, #global.biter_names)]
            end

            game.print(my_name .. " " .. biter_memoir)
        end

        global.units_to_names[event.entity.unit_number] = nil
        global.units_to_entities[event.entity.unit_number] = nil
    end
end)

script.on_event(defines.events.on_tick, function(event)
    for unit, name in pairs(global.units_to_names) do
        if not global.units_to_entities[unit].valid then
            global.units_to_names[unit] = nil
            global.units_to_entities[unit] = nil
        else
            global.units_to_entities[unit].surface.create_entity({name = "biter-name", position = global.units_to_entities[unit].position, force = "player", text = name or "Bob"})
        end
    end
end)