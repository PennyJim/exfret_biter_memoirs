function show_memoir(event)
    local biter_memoir = global.biter_memoirs[math.random(1, #global.biter_memoirs)]

    local my_name = global.units_to_names[event.entity.unit_number] or global.biter_names[math.random(1, #global.biter_names)]

    -- Test if the biter has a special memoir
    if global.biter_memoirs_special[my_name] ~= nil then
        game.print(global.biter_memoirs_special[my_name])
        return
    end

    local pronouns = global.biter_name_pronouns[my_name] or "their"
    if pronouns ~= "male" and pronouns ~= "female" and pronouns ~= "their" then
        local possible_pronouns = {"male", "female", "their"}
        prounouns = possible_pronouns[math.random(3)]
    end
    local possessive, subject, object
    if pronouns == "their" then
        possessive = "their"
        subject = "they"
        object = "them"
    elseif pronouns == "male" then
        possessive = "his"
        subject = "he"
        object = "him"
    elseif pronouns == "female" then
        possessive = "her"
        subject = "she"
        object = "her"
    end

    game.print(my_name .. " " .. string.gsub(string.gsub(string.gsub(biter_memoir, "PRONOUN_POSSESSIVE", possessive), "PRONOUN_SUBJECT", subject), "PRONOUN_OBJECT", object))
end