---@type boolean?
local has_better_chat

---@param event EventData.on_entity_died
function show_memoir(event)
    local unit_number = event.entity.unit_number --[[@as integer]]

    ---@type string
    local my_name
    if storage.unit_info[unit_number] ~= nil then
        my_name = storage.unit_info[unit_number].name
    end
    if my_name == nil then
        my_name = storage.biter_names[math.random(#storage.biter_names)]
    end

    ---@type string
    local locale_key
    -- Test if the biter has a special memoir
    if storage.biter_memoirs_special[my_name] then
        locale_key = "biter-memoirs-special."..my_name
    else
        locale_key = "biter-memoirs."..math.random(storage.biter_memoir_count)
    end

    local pronouns = storage.biter_name_pronouns[my_name] or "their"
    if pronouns == "either" then
        ---@type support_pronouns[]
        local possible_pronouns = {"male", "female", "their"}
        pronouns = possible_pronouns[math.random(3)]
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
        remote.call("better-chat", "send", {
            message = message,
            send_level = "global",
            clear = false,
        })
    else
        game.print(message)
    end
end