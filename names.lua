---@class MemoirGlobal
---@field biter_names string[]
---@field biter_name_pronouns table<string,support_pronouns|"either">
---@field biter_memoir_count integer
---@field biter_memoirs_special table<string,true>

---@alias support_pronouns "male"|"female"|"their"

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
        "Scoob",
        "Nemesis",
        "SPM",
        "The factory must grow",
        "r/factoriohno",
        "Abby",
        "Mike",
        "Pyanodon",
        "Demi",
        "Dominus_Pullum",
        "FatalOwl",
        "SkyeOfBreeze",
        "Brad",
        "Bradley",
        "Ronald",
        "Harry",
        "Hermione",
        "PokTux",
        "Pikachu",
        "Pikachu2",
        "Vaporeon",
        "Steve",
        "Elon Musk",
        "Fermat",
        "Nova",
        "Isabelle",
        "Foxabilo",
        "Carl Sagan",
        "Cobai",
        "BlackATM",
        "Lebothegizebo",
        "sassxolotl",
        "Randall",
        "Sun Tzu",
        "Debbie",
        "Shelby",
        "Jeison",
        "Tragedeigh",
        "Kynnedee",
        "Emeilla",
        "Jmily",
        "Phaedra",
        "Deyzi",
        "Mom",
        "fren",
        "Spongebob",
        "Rasputin",
        "Bitertron 3000",
        "Archangel666",
        "propertyrandomizer",
        "Bluey",
        "Blackbeard",
        "Sophia",
        "Aiden",
        "Emma",
        "Lucas",
        "Mason",
        "Harper",
        "Caleb",
        "Samuel",
        "Grace",
        "Paige",
        "Scarlett",
        "Riley",
        "Natalie",
        "Victoria",
        "Doubt",
        "Guilt",
        "Sarah",
        "Bonita",
        "Bonnie",
        "engelbert",
        "Casper",
        "Caspian",
        "Coffee",
        "Reggie",
        "Walter",
        "Joe",
        "Bach",
        "Myrna",
        "Bertha",
        "Boris",
        "Hillary",
        "Margaret",
        "Catherine",
        "Peter",
        "Yousaf",
        "Leonard",
        "Newton",
        "Einstein",
        "Fear",
        "Bessie",
        "Tabitha",
        "Ron",
        "Melvin",
        "Angelica",
        "Egg",
        "Javier",
        "Simona",
        "The Knight",
        "Thanos",
        "Thor",
        "Stark",
        "The Little Prince",
        "Senator Bites",
        "Doctor Johnson",
        "Ferb",
        "e",
        "Big Bertha",
        "Katniss",
        "Geranium",
        "Jolina",
        "Juanito",
        "Eigenvector",
        "Perry",
        "chatGPT",
        "Chris",
        "Anush",
        "Nidhi",
        "Dwayne",
        "Emperor",
        "Empress",
        "Khan",
        "Billy",
        "Little Billy",
        "James",
        "John",
        "Jay",
        "Paisley",
        "Naomi",
        "Swifty",
        "Carolyn",
        "Ash",
        "Luca"
    }

    global.biter_name_pronouns = {
        ["George"] = "male",
        ["Sue"] = "female",
        ["Mary"] = "female",
        ["Bob"] = "male",
        ["Cho"] = "male",
        ["Lee"] = "male",
        ["Henry"] = "male",
        ["Alice"] = "female",
        ["Amanda"] = "female",
        ["Tyler"] = "either",
        ["Kyle"] = "male",
        ["Sam"] = "male",
        ["Greg"] = "male",
        ["Varik"] = "male",
        ["Liz"] = "female",
        ["Lauren"] = "female",
        ["Eve"] = "female",
        ["Cathy"] = "female",
        ["Hao"] = "male",
        ["Indy"] = "either",
        ["Buster"] = "male",
        ["Buddy"] = "male",
        ["Chomps"] = "either",
        ["EmilyFlambe"] = "female",
        ["Nilaus"] = "male",
        ["Nefrums"] = "male",
        ["AntiElitz"] = "male",
        ["NotExfret"] = "male",
        ["Killer"] = "either",
        ["NomNoms"] = "either",
        ["Hungerz"] = "either",
        ["Taylor"] = "either",
        ["Bill"] = "male",
        ["Chad"] = "male",
        ["Carson"] = "male",
        ["Olivia"] = "female",
        ["_CodeGreen"] = "male",
        ["Periklis"] = "male",
        ["Jazlene"] = "female",
        ["Noah"] = "male",
        ["Liam"] = "male",
        ["Emerald"] = "female",
        ["Ruby"] = "female",
        ["Ymir"] = "either",
        ["Meow"] = "either",
        ["Aria"] = "female",
        ["Katrina"] = "female",
        ["Scott"] = "female",
        ["Mr. Bitter"] = "male",
        ["Johny"] = "male",
        ["Tommy"] = "male",
        ["Mrs. Bitter"] = "female",
        ["Bitter Jr."] = "male",
        ["Bitey"] = "either",
        ["Ipsum Lorem"] = "either",
        ["Bob Ross"] = "male",
        ["Kid"] = "either",
        ["Alien"] = "their",
        ["Unit"] = "their",
        ["Amelia"] = "female",
        ["John Smith"] = "male",
        ["Charlotte"] = "female",
        ["Amy"] = "female",
        ["Rose"] = "female",
        ["Daisy"] = "female",
        ["Bubbles"] = "female",
        ["Ava"] = "female",
        ["Asher"] = "their",
        ["Isaiah"] = "male",
        ["Juan"] = "male",
        ["Maria"] = "female",
        ["Julio"] = "male",
        ["Ivy"] = "female",
        ["Ella"] = "female",
        ["Eli"] = "male",
        ["Nathan"] = "male",
        ["Random"] = "their",
        ["nullptr"] = "their",
        ["Megan"] = "their",
        ["Cueball"] = "male",
        ["Rex"] = "male",
        ["Ale"] = "either",
        ["Good Boi"] = "male",
        ["Soto"] = "male",
        ["I Hungerz"] = "either",
        ["Bug"] = "their",
        ["Zoe"] = "female",
        ["Kehlani"] = "male",
        ["Iris"] = "female",
        ["Chase"] = "male",
        ["Jacob"] = "male",
        ["Caroline"] = "female",
        ["Beau"] = "male",
        ["Claire"] = "female",
        ["Vivian"] = "female",
        ["Mr. Spitz"] = "male",
        ["Drop Tables"] = "male",
        ["Bud"] = "male",
        ["Coronavirus"] = "their",
        ["Derpy"] = "female",
        ["DinnerBone"] = "male",
        ["SoonToBeDead"] = "either",
        ["Lizzy"] = "female",
        ["Wavetrex"] = "male",
        ["Brevven"] = "male",
        ["Citizen 1"] = "either",
        ["Citizen 2"] = "either",
        ["Citizen 4"] = "either",
        ["GGs"] = "either",
        ["Klonan"] = "male",
        ["Kovarex"] = "male",
        ["Factorio"] = "their",
        ["Scorpion"] = "either",
        ["DoshDoshington"] = "male",
        ["Comkat"] = "male",
        ["1000x tech cost"] = "their",
        ["Earendel"] = "male",
        ["Pupper"] = "either",
        ["Doggo"] = "either",
        ["Bork"] = "either",
        ["Garath"] = "male",
        ["Max"] = "male",
        ["Minnie"] = "female",
        ["Mac"] = "male",
        ["Wilt"] = "female",
        ["King"] = "male",
        ["Prince"] = "male",
        ["Loki"] = "male",
        ["Chen"] = "female",
        ["Michelle"] = "female",
        ["Jenny"] = "female",
        ["Forest"] = "male",
        ["Bilka"] = "male",
        ["Fred Rogers"] = "male",
        ["Dasher"] = "male",
        ["Rudolph"] = "male",
        ["Raiguard"] = "male",
        ["Bobingabout"] = "male",
        ["TravisSucks"] = "male",
        ["Demi Lovato"] = "female",
        ["[item=iron-plate]"] = "their",
        ["quirky"] = "either",
        ["[item=pistol]"] = "their",
        ["[item=artillery-wagon-cannon]"] = "their",
        ["[item=submachine-gun]"] = "their",
        ["Sparticus"] = "male",
        ["Monty Python"] = "male",
        ["Majesty"] = "female",
        ["Mae"] = "female",
        ["Smith"] = "male",
        ["Tao"] = "male",
        ["Buddha"] = "male",
        ["Jesus"] = "male",
        ["Obama"] = "male",
        ["boskid"] = "male",
        ["Erythion"] = "male",
        ["Rseding"] = "male",
        ["Loren"] = "male",
        ["mikelat"] = "male",
        ["damzl"] = "female",
        ["alcari"] = "male",
        ["friendcalledfive"] = "male",
        ["Moridrex"] = "male",
        ["GT:NH"] = "their",
        ["\"Quotes\""] = "either",
        ["Biter no. 457098q709827092457"] = "either",
        [":)"] = "either",
        ["Fourier Transform"] = "their",
        ["Galous"] = "male",
        ["Everiste"] = "male",
        ["Abel"] = "male",
        ["Tony"] = "male",
        ["SquidCoder"] = "male",
        ["Michal"] = "male",
        ["Tomas"] = "male",
        ["Albert"] = "male",
        ["Twinsen"] = "male",
        ["Robert"] = "male",
        ["Nick"] = "male",
        ["Wube"] = "female",
        ["Person"] = "either",
        ["Batman"] = "male",
        ["Ken"] = "male",
        ["Scoob"] = "male",
        ["Nemesis"] = "either",
        ["SPM"] = "their",
        ["The factory must grow"] = "either",
        ["r/factoriohno"] = "their",
        ["Abby"] = "female",
        ["Mike"] = "male",
        ["Pyanodon"] = "male",
        ["Demi"] = "female",
        ["Dominus_Pullum"] = "male",
        ["FatalOwl"] = "male",
        ["SkyeOfBreeze"] = "female",
        ["Brad"] = "male",
        ["Bradley"] = "male",
        ["Ronald"] = "male",
        ["Harry"] = "male",
        ["Hermione"] = "female",
        ["PokTux"] = "male",
        ["Pikachu"] = "male",
        ["Pikachu2"] = "male",
        ["Vaporeon"] = "female",
        ["Steve"] = "male",
        ["Elon Musk"] = "male",
        ["Fermat"] = "male",
        ["Nova"] = "male",
        ["Isabelle"] = "female",
        ["Foxabilo"] = "male",
        ["Carl Sagan"] = "male",
        ["Cobai"] = "male",
        ["BlackATM"] = "male",
        ["sassxolotl"] = "male",
        ["Lebothegizebo"] = "male",
        ["Randall"] = "male",
        ["Sun Tzu"] = "male",
        ["Debbie"] = "female",
        ["Shelby"] = "female",
        ["Jeison"] = "male",
        ["Tragedeigh"] = "female",
        ["Kynnedee"] = "female",
        ["Emeilla"] = "female",
        ["Jmily"] = "female",
        ["Phaedra"] = "female",
        ["Deyzi"] = "female",
        ["Mom"] = "female",
        ["fren"] = "either",
        ["Spongebob"] = "male",
        ["Rasputin"] = "male",
        ["Bitertron 3000"] = "their",
        ["Archangel666"] = "their",
        ["propertyrandomizer"] = "their",
        ["Bluey"] = "male",
        ["Blackbeard"] = "male",
        ["Sophia"] = "female",
        ["Aiden"] = "male",
        ["Emma"] = "female",
        ["Lucas"] = "male",
        ["Mason"] = "male",
        ["Harper"] = "female",
        ["Caleb"] = "male",
        ["Samuel"] = "male",
        ["Grace"] = "female",
        ["Paige"] = "female",
        ["Scarlett"] = "female",
        ["Riley"] = "male",
        ["Natalie"] = "female",
        ["Victoria"] = "female",
        ["Doubt"] = "either",
        ["Guilt"] = "either",
        ["Sarah"] = "female",
        ["Bonita"] = "female",
        ["Bonnie"] = "female",
        ["engelbert"] = "male",
        ["Casper"] = "male",
        ["Caspian"] = "male",
        ["Coffee"] = "either",
        ["Reggie"] = "male",
        ["Walter"] = "male",
        ["Joe"] = "male",
        ["Bach"] = "male",
        ["Myrna"] = "female",
        ["Bertha"] = "female",
        ["Boris"] = "male",
        ["Hillary"] = "female",
        ["Margaret"] = "female",
        ["Catherine"] = "female",
        ["Peter"] = "male",
        ["Yousaf"] = "male",
        ["Leonard"] = "male",
        ["Newton"] = "male",
        ["Einstein"] = "male",
        ["Fear"] = "either",
        ["Bessie"] = "male",
        ["Tabitha"] = "female",
        ["Ron"] = "male",
        ["Melvin"] = "male",
        ["Angelica"] = "female",
        ["Egg"] = "their",
        ["Javier"] = "male",
        ["Simona"] = "female",
        ["The Knight"] = "their",
        ["Thanos"] = "male",
        ["Thor"] = "male",
        ["Stark"] = "male",
        ["The Little Prince"] = "male",
        ["Senator Bites"] = "male",
        ["Doctor Johnson"] = "male",
        ["Ferb"] = "male",
        ["e"] = "their",
        ["Big Bertha"] = "female",
        ["Katniss"] = "female",
        ["Geranium"] = "female",
        ["Jolina"] = "female",
        ["Juanito"] = "male",
        ["Eigenvector"] = "their",
        ["Perry"] = "male",
        ["chatGPT"] = "their",
        ["Chris"] = "male",
        ["Anush"] = "male",
        ["Nidhi"] = "female",
        ["Dwayne"] = "male",
        ["Emperor"] = "male",
        ["Empress"] = "female",
        ["Khan"] = "male",
        ["Billy"] = "male",
        ["Little Billy"] = "male",
        ["James"] = "male",
        ["John"] = "male",
        ["Jay"] = "male",
        ["Paisley"] = "female",
        ["Naomi"] = "female",
        ["Swifty"] = "either",
        ["Carolyn"] = "female",
        ["Ash"] = "male",
        ["Luca"] = "male"
    }

    --- The number here should match the highest locale number
    global.biter_memoir_count = 75 + 1

    global.biter_memoirs_special = {
        ["EmilyFlambe"] = true,
        ["Nefrums"] = true,
        ["Nilaus"] = true,
        ["Fermat"] = true,
        ["Scoob"] = true,
        ["friendcalledfive"] = true,
        ["Factorio"] = true,
        ["Good Boi"] = true,
        ["Pikachu"] = true,
        ["Pikachu2"] = true,
        ["Varik"] = true,
        ["Asher"] = true,
        ["DoshDoshington"] = true,
        ["Elon Musk"] = true,
        ["Carl Sagan"] = true,
        ["Lebothegizebo"] = true,
        ["BlackATM"] = true,
        ["Cobai"] = true,
        ["sassxolotl"] = true,
        ["Earendel"] = true,
        ["Randall"] = true,
        ["Sun Tzu"] = true,
    }
end