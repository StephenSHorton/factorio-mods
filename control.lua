
function initPlayer(player)
	if player.character == nil then return end
	if global == nil then
		global = {}
	end
	if global.donePlayers == nil then
		global.donePlayers = {}
	end
	if global.donePlayers[player] ~= nil then return end
	global.donePlayers[player] = true

	player.get_inventory(defines.inventory.character_main).clear()
	player.get_inventory(defines.inventory.character_armor).clear()
	player.get_inventory(defines.inventory.character_guns).clear()
	player.get_inventory(defines.inventory.character_ammo).clear()

	local items = {
		-- resources
		{"coal", 150},
		{"iron-plate", 150},
		{"copper-plate", 75},
		-- buildings
		{"burner-mining-drill", 1},
		{"stone-furnace", 1},
		-- other logistic
		{"fusion-construction-robot", 50},
		{"car", 1}
	}
	for _, v in pairs(items) do
		player.insert{name = v[1], count = v[2]}
	end

	local armorInventory = player.get_inventory(defines.inventory.character_armor)
	armorInventory.insert("power-armor")
	local armorGrid = armorInventory.find_item_stack("power-armor").grid

	local equipment = {
		"fusion-reactor-equipment",
		"exoskeleton-equipment",
		"personal-roboport-mk2-equipment",
		"personal-roboport-mk2-equipment",
	}
	for _, v in pairs(equipment) do
		armorGrid.put{name = v}
	end

	player.get_inventory(defines.inventory.character_guns).insert{name = "submachine-gun", count = 1}
	player.get_inventory(defines.inventory.character_ammo).insert{name = "firearm-magazine", count = 100}
end

function onPlayerJoined(event)
	local player = game.players[event.player_index]
	initPlayer(player)
end

script.on_event({defines.events.on_player_joined_game, defines.events.on_player_created}, onPlayerJoined)

function onModInit()
	if remote.interfaces["freeplay"] then
		remote.call("freeplay", "set_disable_crashsite", true)
		remote.call("freeplay", "set_skip_intro", true)
	end
end

script.on_init(onModInit)
