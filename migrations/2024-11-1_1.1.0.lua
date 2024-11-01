for _, unit in pairs(storage.unit_info) do
	if unit.nametag_id then
		unit.nametag = rendering.get_object_by_id(unit.nametag_id)
		unit.nametag_id = nil
	end
end