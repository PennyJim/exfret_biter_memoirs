
---@class MigrationMemoirGlobal : MemoirGlobal
---@field biter_name_pronouns table<string, support_pronouns|"either">
local storage = storage

if not storage.biter_name_pronouns then
	return log("Skipping migration, no pronoun map")
end

for _, info in pairs(storage.unit_info) do
	local name = info.name --[[@as string]]
	local pronouns = storage.biter_name_pronouns[name] or "their"

	info.name = {
		name = name,
		pronouns = pronouns
	}
end