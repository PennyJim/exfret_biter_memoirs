function show_biter_gui(player, biter)
    if global.units_to_names[biter.unit_number] == nil then
        initialize_unit({entity = biter}) -- TODO: Still keep name hidden so it doesn't look weird
    end
    local biter_name = global.units_to_names[biter.unit_number]

    local wellbeing = "Happy and Carefree"
    if biter.surface.get_pollution(biter.position) >= 40 then
        wellbeing = "Anxious about the future"
    end
    if biter.surface.get_pollution(biter.position) >= 100 then
        wellbeing = "Feeling down about the haziness"
    end
    if biter.surface.get_pollution(biter.position) >= 200 then
        wellbeing = "Sickly from the pollution"
    end
    if biter.surface.get_pollution(biter.position) >= 500 then
        wellbeing = "Falling deeply ill from the smoke"
    end
    if biter.surface.get_pollution(biter.position) >= 1000 then
        wellbeing = "Desperate... will do anything... for fresh air"
    end

    player.gui.screen.add({type = "frame", name = "biter_stats_panel", caption = "Biter Stats Panel", direction = "vertical"})
    player.gui.screen.biter_stats_panel.add({type = "label", name = "biter_stats_panel_name", caption = "Biter name: " .. biter_name})
    player.gui.screen.biter_stats_panel.add({type = "label", name = "biter_stats_panel_wellbeing", caption = "Wellbeing: " .. wellbeing})
end