-- Run this in data-final-fixes to ensure all mod resources are loaded
local oreNames = {}

for key, name in pairs(data.raw.resource) do
	table.insert(oreNames, key)
end

for i, name in ipairs(oreNames) do
	local unlimitedOre = table.deepcopy(data.raw.resource[name])

	unlimitedOre.name = "unlimited-" .. name
	unlimitedOre.localised_name =
	{
		"resource-name.unlimited",        
		{
			"entity-name." .. name
		}
	}
	unlimitedOre.infinite = true
	unlimitedOre.infinite_depletion_amount = 0
	unlimitedOre.minimum = 100
	unlimitedOre.autoplace = nil

	if not settings.startup["ore-unlimited-alternative-mode"].value then 
		unlimitedOre.normal = 100
	end

	if unlimitedOre.stage_counts then
		-- #foo is like foo.length
		for i = 1, #unlimitedOre.stage_counts do
            unlimitedOre.stage_counts[i] = 0
        end
	end

	if mods["Krastorio2"] and name == "crude-oil" then
		unlimitedOre.collision_box = { { -1.4, -1.4 }, { 1.4, 1.4 } }
		unlimitedOre.selection_box = { { -1, -1 }, { 1, 1 } }
		unlimitedOre.category = "oil"
	end

	data:extend({unlimitedOre})
end