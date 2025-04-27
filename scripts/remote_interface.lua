--MARK: Name Validation

---@param name name_info
local function validate_name(name)
	if not name.name then
		error("The name did not have a name!")
	end
	if not name.pronouns then
		log("The given name '"..name.name.."' did not have a pronoun. Using a default of 'any' which will randomly choose one")
		name.pronouns = PRONOUNS.any
	end

	-- Validate the special_memoir and color?
end

--MARK: Memoir Validation

local function validate_memoir(memoir)
	local memoir_type = type(memoir)
	-- A string is valid, no further checking needed
	if memoir_type == "string" then return end

	if memoir_type ~= "table" then
		error("The memoir was not a string or a table. Only strings or LocalisedStrings are allowed")
	end

	if memoir[2] or memoir[3] then
		error("The memoir had a value in the 2nd or 3rd index. The first two parameters are always autofilled with the name and pronoun id. These *will* get squashed.")
	end
end

-- MARK: Array Contiguity Check

---@param array any[]
---@param validate_func fun(any:any)
local function validate_array_contiguity(array, validate_func)
	local expected_index = 1
	for index, value in pairs(array) do
		if type(index) ~= "number" then
			error("Array had a non-number index. Is it missing a pair of brackets?")
		end

		if index ~= expected_index then
			error("Array indexes don't rise continually. Sparse arrays are not supported")
		end
		expected_index = expected_index + 1

		validate_func(value)
	end
end

remote.add_interface("biter-memoirs", {
	--MARK: Get Defaults & Counts

	get_default_names = default_names,
	---@nodiscard
	---@return MemoirString[]
	get_default_memoirs = function ()
		return default_memoirs(DEFAULT_MEMOIR_COUNT)
	end,
	generate_default_memoirs = default_memoirs,

	---@nodiscard
	get_name_count = function ()
		return storage.biter_name_count
	end,
	---@nodiscard
	---@return integer
	get_memoir_count = function ()
		return storage.biter_memoir_count
	end,

	--MARK: Get/Set

	---@nodiscard
	---@return name_info[]
	get_names = function ()
		return storage.biter_names
	end,
	---@param names name_info[]
	set_names = function (names)
		validate_array_contiguity(names, validate_name)
		storage.biter_names = names
		storage.biter_name_count = #names
	end,

	---@nodiscard
	---@return MemoirString[]
	get_memoirs = function ()
		return storage.biter_memoirs
	end,
	---@param memoirs MemoirString[]
	set_memoirs = function (memoirs)
		validate_array_contiguity(memoirs, validate_memoir)
		storage.biter_memoirs = memoirs
		storage.biter_memoir_count = #memoirs
	end,

	--MARK: Add/Remove

	---@param name name_info
	---@return integer new_index
	add_name = function (name)
		validate_name(name)
		local count = storage.biter_name_count + 1
		storage.biter_name_count = count
		storage.biter_names[count] = name
		return count
	end,
	---@param index integer
	remove_name = function (index)
		table.remove(storage.biter_names, index)
		storage.biter_name_count = storage.biter_name_count - 1
	end,

	---@param memoir MemoirString
	---@return integer
	add_memoir = function (memoir)
		validate_memoir(memoir)
		local count = storage.biter_memoir_count + 1
		storage.biter_memoir_count = count
		storage.biter_memoirs[count] = memoir
		return count
	end,
	---@param index integer
	remove_memoir = function (index)
		table.remove(storage.biter_memoirs, index)
		storage.biter_memoir_count = storage.biter_memoir_count - 1
	end
})