require("names")
require("scripts/show_biter_stats")
require("scripts/initialize_unit")
require("scripts/memoir")

---@class MemoirGlobal
---@field last_memoir_tick integer
---@field unit_info table<integer,unit_info>
global = {}

---@class unit_info
---@field show_name boolean
---@field name string
---@field entity LuaEntity
---@field birth integer
---@field nametag_id integer? The id of its render object if it has one

local function ensure_globals()
    if global.last_memoir_tick == nil then
        global.last_memoir_tick = 0
    end

    if global.unit_info == nil then
        global.unit_info = {}
    end
end

---@param entity LuaEntity
---@param unit_number integer
function validate_unit(entity, unit_number)

    --- Remove entry if the entity is invalid in any way
    if not entity or not entity.valid or entity.type ~= "unit" then
        global.unit_info[unit_number] = nil
        return
    end

    local table_info = global.unit_info[unit_number]
    --- Initialize the unit if it's valid, but has no entry
    if not table_info then
        initialize_unit({entity = entity, keep_hidden = true})
        return
    end

    if not table_info.name then
        table_info.name = global.biter_names[math.random(1, #global.biter_names)]
    end
    if not table_info.entity then
        table_info.entity = entity
    end
    if not table_info.birth then
        table_info.birth = game.tick
    end
    if table_info.show_name and not table_info.nametag_id then
        table_info.nametag_id = rendering.draw_text{
            text = table_info.name,
            color = {1,1,1},
            surface = entity.surface_index,
            target = entity,
            alignment = "center",
            vertical_alignment = "top",
            use_rich_text = true,
        }
    end
end

script.on_init(function ()
    add_names()

    ensure_globals()
end)

script.on_configuration_changed(function()
    game.print("Biter Memoirs: Mod configuration changed, loading names list.")
    add_names()

    for unit_number, unit_table in pairs(global.unit_info) do
        validate_unit(unit_table.entity, unit_number)
    end

    ensure_globals()
end)

---@param event EventData.on_entity_spawned
script.on_event(defines.events.on_entity_spawned, function(event)
    initialize_unit(event)
end)

---@param event EventData.on_entity_died
script.on_event(defines.events.on_entity_died, function(event)
    local entity= event.entity
    local unit_number = entity.unit_number --[[@as integer]]
    validate_unit(entity, unit_number)

    -- Ignore units without an entry in the table
    local unit_table = global.unit_info[unit_number]
    -- if not unit_table then return end -- Not necessary as validate_unit makes sure it exists
    global.unit_info[unit_number] = nil

    -- Don't do anything else for units that we don't handle names on
    if not unit_table.show_name then return end

    local do_memoir = (
        game.tick - global.last_memoir_tick >= settings.global["exfret-biter-memoirs-min-message-delay"].value
        and math.random() < settings.global["exfret-biter-memoirs-message-chance"].value
    )

    -- I just want to make very sure the pikachu memoir shows up, so it's hardcoded for now
    if do_memoir
    or unit_table.name == "Pikachu"
    or unit_table.name == "Pikachu2" then
        show_memoir(event)
    end
end, {
    {filter = "type", type = "unit"}
})

-- ---@param event EventData.on_tick
-- script.on_event(defines.events.on_tick, function(event)
--     update_nametags()
-- end)

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
                validate_unit(closest_unit, closest_unit.unit_number)
                show_biter_gui(game.players[event.player_index], closest_unit)
            end
        end
    else
        game.players[event.player_index].gui.screen.biter_stats_panel.destroy()
    end
end)