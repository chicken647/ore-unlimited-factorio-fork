local function get_random_amount(rng, name, set_unlimted)
	if set_unlimted then
		if name == "crude-oil" or name == "sulfuric-acid-geyser" or name == "fluorine-vent" then
			return settings.startup["ore-unlimited-yield-fluid"].value
		else
			return settings.startup["ore-unlimited-yield"].value
		end
	else
		if name == "crude-oil" or name == "sulfuric-acid-geyser" or name == "fluorine-vent" then
			return settings.startup["ore-unlimited-normal-fluid"].value * 1000
		else
			return settings.startup["ore-unlimited-normal"].value
		end
	end
end


local function logic_on_player_selected_area(event, set_unlimted)
	local player = game.players[event.player_index]
	local item = event.item
	local entities = event.entities

	if item == "ore-unlimited" then
		for _, entity in pairs(entities) do
			
			if entity.valid and entity.type == "resource" then
				-- Cannot figure out these ones
				if not string.find(entity.name, "se-core-fragment", 1, true) then
					local cleanName = string.gsub(entity.name, "unlimited%-", "")

					--player.print(entity.name .. " -- " .. cleanName)
					player.print(cleanName .. " processed!")
					player.print(entity.prototype.resource_category)

					local alternativeMode = settings.startup["ore-unlimited-alternative-mode"].value
					local newAmount = entity.amount
					
					if not alternativeMode then
						newAmount = get_random_amount(rng, cleanName, set_unlimted)
					end

					if set_unlimted then
						if not string.match(entity.name, "unlimited-") then
							local resEntity = {
								name="unlimited-" .. entity.name,
								position=entity.position
							}

							local initialAmount = nil

							if not alternativeMode then
								resEntity.amount = get_random_amount(rng, cleanName, set_unlimted)
							else
								resEntity.amount = entity.amount

								if entity.prototype.resource_category == "basic-solid" then
									initialAmount = entity.amount
									resEntity.amount = 1
								end
							end

							local createdEntity = player.surface.create_entity(resEntity)

							if not (initialAmount == nil) then
								createdEntity.initial_amount = initialAmount
							end

							entity.destroy()
						end
					else 
						if string.match(entity.name, "unlimited-") then
							local resEntity = {
								name=cleanName,
								position=entity.position
							}

							if not alternativeMode then
								resEntity.amount = get_random_amount(rng, cleanName, set_unlimted)
							else
								resEntity.amount = entity.amount

								if entity.prototype.resource_category == "basic-solid" then
									resEntity.amount = entity.initial_amount
								end
							end

							player.surface.create_entity(resEntity)
							
							entity.destroy()
						end
					end
				end
			end
		end
	end
end

script.on_event(defines.events.on_player_selected_area, function(event)
	logic_on_player_selected_area(event, true)
end)

script.on_event(defines.events.on_player_alt_selected_area, function(event)
	logic_on_player_selected_area(event, false)
end)

script.on_event(defines.events.on_player_dropped_item, function(event)
	if event.entity ~= nil then
		if event.entity.stack ~= nil then
			if event.entity.stack.name == "ore-unlimited" then
				event.entity.stack.clear()
			end
		end
	end
end)