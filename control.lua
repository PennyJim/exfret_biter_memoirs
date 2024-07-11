require("names")
require("scripts/show_biter_stats")
require("scripts/initialize_unit")
require("scripts/memoir")
require("scripts/nametags")

---@class MemoirGlobal
---@field last_memoir_tick integer
---@field unit_info table<integer,unit_info>
global = {}

---@class unit_info
---@field show_name boolean
---@field name string
---@field entity LuaEntity
---@field birth integer

local function ensure_globals()
    if global.last_memoir_tick == nil then
        global.last_memoir_tick = 0
    end

    if global.unit_info == nil then
        global.unit_info = {}
    end
end

---@param entity LuaEntity
function validate_unit(entity)
    if not entity.valid then
        local unit_number = entity.unit_number
        if unit_number ~= nil then
            global.unit_info[unit_number] = nil
        end
        return
    elseif entity.type ~= "unit" then
        return
    end
    local unit_number = entity.unit_number --[[@as integer]]

    if global.unit_info[entity.unit_number] == nil then
        initialize_unit({entity = entity, keep_hidden = true})
    end

    local table_info = global.unit_info[unit_number]

    if table_info.name == nil then
        table_info.name = global.biter_names[math.random(1, #global.biter_names)]
    end
    if table_info.entity == nil then
        table_info.entity = entity
    end
    if table_info.birth == nil then
        table_info.birth = game.tick
    end
end

script.on_init(function ()
    add_names()

    ensure_globals()
end)

script.on_configuration_changed(function()
    game.print("Biter Memoirs: Mod configuration changed, loading names list.")
    add_names()

    ensure_globals()
end)

---@param event EventData.on_entity_spawned
script.on_event(defines.events.on_entity_spawned, function(event)
    initialize_unit(event)
end)

---@param event EventData.on_entity_died
script.on_event(defines.events.on_entity_died, function(event)
    validate_unit(event.entity)

    if event.entity.type == "unit" then
        local unit_number = event.entity.unit_number --[[@as integer]]
        if global.unit_info[unit_number] ~= nil and global.unit_info[unit_number].show_name then
            -- I just want to make very sure the pikachu memoir shows up, so it's hardcoded for now
            if global.unit_info[unit_number] ~= nil and (global.unit_info[unit_number].name == "Pikachu" or global.unit_info[unit_number].name == "Pikachu2") then
                show_memoir(event)
            elseif game.tick - global.last_memoir_tick >= settings.global["exfret-biter-memoirs-min-message-delay"].value and math.random() < settings.global["exfret-biter-memoirs-message-chance"].value then
                show_memoir(event)
            end

            global.unit_info[unit_number] = nil
        end
    end
end)

---@param event EventData.on_tick
script.on_event(defines.events.on_tick, function(event)
    update_nametags()
end)

---@param event EventData.CustomInputEvent
script.on_event("show-biter-info", function(event)
    if not game.players[event.player_index].gui.screen.biter_stats_panel then
        if event.selected_prototype ~= nil and event.selected_prototype.derived_type == "unit" then
            local search_distance = 10
            local possible_selections = game.players[event.player_index].surface.find_entities_filtered({position = event.cursor_position, radius = search_distance, type = "unit"})
            ---@type LuaEntity
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
                validate_unit(closest_unit)
                show_biter_gui(game.players[event.player_index], closest_unit)
            end
        end
    else
        game.players[event.player_index].gui.screen.biter_stats_panel.destroy()
    end
end)