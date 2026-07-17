local Players = game:GetService("Players")
local function onCharacterAdded(character)
	local player = Game.Players:FindFirstChild(_G.player_name)
	local backpack = player:FindFirstChild("Backpack")
	for n, v in _G.ownerships do
		local item = backpack.store_gears:FindFirstChild(n)
		if item then
			if _G.ownerships[n] then
				item.Parent = backpack
			end
		end
	end
end
local function onPlayerAdded(player)
	player.CharacterAdded:Connect(onCharacterAdded)
end
Players.PlayerAdded:Connect(onPlayerAdded)
