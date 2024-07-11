---@param event EventData.on_entity_died
function show_memoir(event)
    local unit_number = event.entity.unit_number --[[@as integer]]

    ---@type string
    local my_name
    if global.unit_info[unit_number] ~= nil then
        my_name = global.unit_info[unit_number].name
    end
    if my_name == nil then
        my_name = global.biter_names[math.random(1, #global.biter_names)]
    end

    -- Test if the biter has a special memoir
    if global.biter_memoirs_special[my_name] ~= nil then
        game.print(global.biter_memoirs_special[my_name])
        return
    end

    local pronouns = global.biter_name_pronouns[my_name] or "their"
    if pronouns == "either" then
        ---@type ("male"|"female"|"their")[]
        local possible_pronouns = {"male", "female", "their"}
        pronouns = possible_pronouns[math.random(1, 3)]
    end

    ---@type LocalisedString
    local message = {
        "biter-memoirs."..math.random(1, 76),
        my_name,
        {pronouns.."-possesive"},
        {pronouns.."-subject"},
        {pronouns.."-object"},
    }

    game.print(message)
end