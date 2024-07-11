---@type boolean?
local has_better_chat

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

    ---@type string
    local locale_key
    -- Test if the biter has a special memoir
    if global.biter_memoirs_special[my_name] then
        locale_key = "biter-memoirs-special."..my_name
    else
        locale_key = "biter-memoirs."..math.random(1, global.biter_memoir_count)
    end

    local pronouns = global.biter_name_pronouns[my_name] or "their"
    if pronouns == "either" then
        ---@type support_pronouns[]
        local possible_pronouns = {"male", "female", "their"}
        pronouns = possible_pronouns[math.random(1, 3)]
    end

    ---@type LocalisedString
    local message = {
        locale_key,
        my_name,
        {"biter-pronouns."..pronouns.."-possessive"},
        {"biter-pronouns."..pronouns.."-subject"},
        {"biter-pronouns."..pronouns.."-object"},
    }

    if has_better_chat == nil then
        local better_chat = remote.interfaces["better-chat"]
        has_better_chat = better_chat and better_chat["send"]
    end

    if has_better_chat then
        -- Every time I use this remote, I realize I hate all
        -- all the arguments and it should be a table parameter,
        -- but I don't want to make that breaking change --@PennyJim
        remote.call("better-chat", "send", message, nil, "global", nil, false)
    else
        game.print(message)
    end
end