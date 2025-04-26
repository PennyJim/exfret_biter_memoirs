---@type boolean?
local has_better_chat

---@param unit_info unit_info
function show_memoir(unit_info)
    local name = unit_info.name
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
        -- This also means we don't have to migrate the old names to all have a special_memoir of exactly this
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
        has_better_chat = better_chat and better_chat["send"] or false
    end

    if has_better_chat then
        remote.call("better-chat", "send", {
            message = message,
            send_level = "global",
            clear = false,
            color = name.color
        })
    else
        game.print(message, {
            color = name.color
        })
    end
end