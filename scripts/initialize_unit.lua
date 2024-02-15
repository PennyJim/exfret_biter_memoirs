function initialize_unit(event)
    if event.entity.type == "unit" then
        local biter_name = global.biter_names[math.random(1, #global.biter_names)]
        local show_name = false
        if (not event.keep_hidden) and math.random() < settings.global["exfret-biter-memoirs-name-chance"].value then
            show_name = true
        end

        global.unit_info[event.entity.unit_number] = {
            name = biter_name,
            show_name = show_name,
            entity = event.entity,
            birth = game.tick
        }
    end
end