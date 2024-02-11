function initialize_unit(event)
	if event.entity.type == "unit" and math.random() < settings.global["exfret-biter-memoirs-name-chance"].value then
        local biter_name = global.biter_names[math.random(1, #global.biter_names)]

        global.units_to_names[event.entity.unit_number] = biter_name
        global.units_to_entities[event.entity.unit_number] = event.entity
    end
end