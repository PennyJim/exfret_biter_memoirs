---@param event {entity:LuaEntity, keep_hidden:boolean}
function initialize_unit(event)
    local entity = event.entity
    if entity.type ~= "unit" then return end

    local biter_name = global.biter_names[math.random(1, #global.biter_names)]
    local show_name, renderID = false, nil

    if (not event.keep_hidden)
    and math.random() < settings.global["exfret-biter-memoirs-name-chance"].value then
        show_name = true
        renderID = rendering.draw_text{
            text = biter_name,
            color = {1,1,1},
            surface = entity.surface_index,
            target = entity,
            alignment = "center",
            vertical_alignment = "top",
            use_rich_text = true,
        }
    end

    global.unit_info[entity.unit_number--[[@as integer]]] = {
        name = biter_name,
        show_name = show_name,
        entity = event.entity,
        birth = game.tick
    }
end