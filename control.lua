require("names")
require("scripts/initialize_unit")
require("scripts/memoir")
require("scripts/nametags")

script.on_init(function ()
    add_names()

    global.units_to_names = {}
    global.units_to_entities = {}
end)

script.on_configuration_changed(function()
    game.print("Configuration changed... reloading names")
    add_names()
end)

script.on_event(defines.events.on_entity_spawned, function(event)
    initialize_unit(event)
end)

script.on_event(defines.events.on_entity_died, function(event)
    if event.entity.type == "unit" then
        -- I just want to make very sure the pikachu memoir shows up, so it's hardcoded for now
        if global.units_to_names[event.entity.unit_number] == "Pikachu" or global.units_to_names[event.entity.unit_number] == "Pikachu2" then
            show_memoir(event)
        elseif math.random() < settings.global["exfret-biter-memoirs-message-chance"].value then
            show_memoir(event)
        end

        global.units_to_names[event.entity.unit_number] = nil
        global.units_to_entities[event.entity.unit_number] = nil
    end
end)

script.on_event(defines.events.on_tick, function(event)
    update_nametags(event)
end)