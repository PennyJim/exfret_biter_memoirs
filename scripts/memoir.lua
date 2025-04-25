---@type boolean?
local has_better_chat

---@param event EventData.on_entity_died
function show_memoir(event)
    local unit_number = event.entity.unit_number --[[@as integer]]

    ---@type name_info
    local name
    if storage.unit_info[unit_number] ~= nil then
        name = storage.unit_info[unit_number].name
    end
    if not name then
        name = storage.biter_names[math.random(storage.biter_name_count)]
    end

    local locale_index = math.random(storage.biter_memoir_count)

    local pronouns = name.pronouns
    if pronouns == "either" then
        ---@type support_pronouns[]
        local possible_pronouns = {"male", "female", "their"}
        pronouns = possible_pronouns[math.random(3)]
    end

    ---@type LocalisedString
    local message = {"?",
        -- Should be defined in the name_info, but if they exist at all, we should use them.
        {"biter-memoirs-special."..name.name, name.name},
        -- Try the pronoun'd version before using the ungendered version
        {"biter-memoirs."..pronouns.."-"..locale_index, name.name},
        {"biter-memoirs."..locale_index, name.name},
    }
    if name.special_memoir then
        message = name.special_memoir
    end

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