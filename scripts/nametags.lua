function update_nametags()
    for unit, name in pairs(global.units_to_names) do
        if not global.units_to_entities[unit].valid then
            global.units_to_names[unit] = nil
            global.units_to_entities[unit] = nil
        else
            global.units_to_entities[unit].surface.create_entity({name = "biter-name", position = global.units_to_entities[unit].position, force = "player", text = name or "Bob"})
        end
    end
end