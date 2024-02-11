function show_memoir(event)
    local biter_memoir = global.biter_memoirs[math.random(1, #global.biter_memoirs)]

    local my_name = global.units_to_names[event.entity.unit_number]
    if my_name == nil then
        my_name = global.biter_names[math.random(1, #global.biter_names)]
    end

    game.print(my_name .. " " .. biter_memoir)
end