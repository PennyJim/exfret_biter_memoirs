---@param name name_info
local function validate_name(name)
	if not name.name then
		error("The name did not have a name!")
	end
	if not name.pronouns then
		log("The given name '"..name.name.."' did not have a pronoun. Using a default of 'either' which will randomly choose one")
		name.pronouns = "either"
	end

	-- Validate the special_memoir and color?
end

---@param array name_info[]
local function validate_name_array(array)
	local expected_index = 1
	for index, name in pairs(array) do
		if type(index) ~= "number" then
			error("Name array had a non-number index. Is it missing a pair of brackets?")
		end

		if index ~= expected_index then
			error("Array indexes don't rise continually. Sparse arrays are not supported")
		end
		expected_index = expected_index + 1

		validate_name(name)
	end
end

remote.add_interface("biter-memoirs", {
	get_default_names = default_names,
	---@nodiscard
	get_name_count = function ()
		return storage.biter_name_count
	end,

	---@return integer
	get_memoir_count = function ()
		return storage.biter_memoir_count
	end,
	---Do not set unless you have affected the locale externally!
	---@param count integer
	set_memoir_count = function (count)
		storage.biter_memoir_count = count
	end,

	---@nodiscard
	---@return name_info[]
	get_names = function ()
		return storage.biter_names
	end,
	---@param names name_info[]
	set_names = function (names)
		validate_name_array(names)
		storage.biter_names = names
		storage.biter_name_count = #names
	end,

	---@param name name_info
	add_name = function (name)
		validate_name(name)
		storage.biter_name_count = storage.biter_name_count + 1
		storage.biter_names[#storage.biter_name_count] = name
	end,
	---@param bad_name string
	remove_name = function (bad_name)
		--TODO: make sure this isn't garbage

		---@type integer[]
		local bad_indexes, bad_count = {}, 0

		for index, name in pairs(storage.biter_names) do
			if name.name == bad_name then
				bad_count = bad_count + 1
				bad_indexes[bad_count] = index
			end
		end

		for i = bad_count, 0, -1 do
			table.remove(storage.biter_names, bad_indexes[i])
		end
	end
})