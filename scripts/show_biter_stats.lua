function show_biter_gui(player, biter)
    local biter_name = global.unit_info[biter.unit_number].name

    local wellbeing = "Happy and Carefree"
    if biter.surface.get_pollution(biter.position) > 0 then
        wellbeing = "Anxious about the future"
    end
    if biter.surface.get_pollution(biter.position) >= 10 then
        wellbeing = "Feeling down about the haziness"
    end
    if biter.surface.get_pollution(biter.position) >= 30 then
        wellbeing = "Sickly from the pollution"
    end
    if biter.surface.get_pollution(biter.position) >= 80 then
        wellbeing = "Falling deeply ill from the smoke"
    end
    if biter.surface.get_pollution(biter.position) >= 200 then
        wellbeing = "Desperate... will do anything... for fresh air"
    end

    player.gui.screen.add({type = "frame", name = "biter_stats_panel", caption = "Biter Stats Panel", direction = "vertical"})
    player.gui.screen.biter_stats_panel.add({type = "label", name = "biter_stats_panel_name", caption = "Biter name: " .. biter_name})
    player.gui.screen.biter_stats_panel.add({type = "label", name = "biter_stats_panel_age", caption = "Age: " .. math.floor(math.pow(((game.tick - global.unit_info[biter.unit_number].birth) / 500), 2/3)) .. " biter years"})
    player.gui.screen.biter_stats_panel.add({type = "label", name = "biter_stats_panel_wellbeing", caption = "Wellbeing: " .. wellbeing})
end