---@type boolean?
local has_better_chat

---@param unit_info unit_info
function show_memoir(unit_info)
    local name = unit_info.name

    ---@type LocalisedString
    local message
    if name.special_memoir then
        message = name.special_memoir

    else
        local random_memoir = storage.biter_memoirs[math.random(storage.biter_memoir_count)]

        local pronouns = name.pronouns
        if pronouns == PRONOUNS.any then
            pronouns = math.random(3) - 1
        elseif pronouns == PRONOUNS.either then
            pronouns = math.random(2)
        end

        -- If the memoir is a LocalisedString, fill in the parameters
        if type(random_memoir) == "table" then
            random_memoir[2] = name.name
            random_memoir[3] = pronouns

        else
            -- Otherwise prepend the name to the string
            random_memoir = name.name .. random_memoir
        end

        message = {"?",
            -- Should be defined in the name_info, but if they exist at all, we should use them.
            -- This also means we don't have to migrate the old names to all have a special_memoir of exactly this
            {"biter-memoirs-special."..name.name, name.name},
            random_memoir
        }
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