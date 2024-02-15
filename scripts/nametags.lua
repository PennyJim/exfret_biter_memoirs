function update_nametags()
    for unit_number, info_table in pairs(global.unit_info) do
        if info_table.entity ~= nil then
            validate_unit(info_table.entity)

            if info_table.show_name then
                if info_table.entity == nil or not info_table.entity.valid then
                    global.unit_info[unit_number] = nil
                    global.unit_info[unit_number] = nil
                else
                    info_table.entity.surface.create_entity({name = "biter-name", position = info_table.entity.position, force = "player", text = info_table.name or "Bob"})
                end
            end
        end
    end
end