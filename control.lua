require("names")
require("scripts/show_biter_stats")
require("scripts/initialize_unit")
require("scripts/memoir")
require("scripts/nametags")

script.on_init(function ()
    add_names()

    global.units_to_names = {}
    global.units_to_entities = {}
end)

script.on_configuration_changed(function()
    game.print("Biter Memoirs: Configuration changed, reloading names list.")
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
    update_nametags()
end)

--[[script.on_event("show-biter-info", function(event)
    if not game.players[event.player_index].gui.screen.biter_stats_panel then
        global.biter_panel_already_shown = true

        if event.selected_prototype ~= nil and event.selected_prototype.derived_type == "unit" then
            local search_distance = 10
            local possible_selections = game.players[event.player_index].surface.find_entities_filtered({position = event.cursor_position, radius = search_distance, type = "unit"})
            local closest_unit
            local closest_unit_distance_squared = search_distance * search_distance
            for _, possible_selection in pairs(possible_selections) do
                local x_diff = possible_selection.position.x - event.cursor_position.x
                local y_diff = possible_selection.position.y - event.cursor_position.y
                if x_diff * x_diff + y_diff * y_diff < closest_unit_distance_squared then
                    closest_unit_distance_squared = x_diff * x_diff + y_diff * y_diff
                    closest_unit = possible_selection
                end
            end

            if closest_unit ~= nil then
                show_biter_gui(game.players[event.player_index], closest_unit)
            end
        end
    else
        game.players[event.player_index].gui.screen.biter_stats_panel.destroy()
    end
end)]]