---@param player LuaPlayer
---@param biter LuaEntity
function show_biter_gui(player, biter)
    local unit_info = storage.unit_info[biter.unit_number--[[@as int]]]

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

    local stats_panel = player.gui.screen.add({type = "frame", name = "biter_stats_panel", caption = "Biter Stats Panel", direction = "vertical"})
    stats_panel.add({type = "label", name = "biter_stats_panel_name", caption = "Biter name: " .. unit_info.name.name})
    stats_panel.add({type = "label", name = "biter_stats_panel_age", caption = "Age: " .. math.floor(math.pow(((game.tick - unit_info.birth) / 500), 2/3)) .. " biter years"})
    stats_panel.add({type = "label", name = "biter_stats_panel_wellbeing", caption = "Wellbeing: " .. wellbeing})
end