game:GetService("Players").PlayerAdded:Connect(function(player)
	local sucess, error = pcall(function()
		local user_id = tostring(player.UserId)
		local backpack = player:FindFirstChild("Backpack", true)
		local dss = game:GetService("DataStoreService")
		local ownership_data = dss:GetDataStore("PlayerInfo", "Ownerships")
		local player_ownerships = ownership_data:GetAsync(user_id)
		
		local cur_gear
		local gears = player:FindFirstChild("store_gears", true)
		local maybe_owned = gears:GetChildren()
		
		player.CharacterAdded:Connect(function(character)
			if player_ownerships ~= {} then
				for _, oi in player_ownerships do
					for _, a_thing in maybe_owned do
						cur_gear = maybe_owned:FindFirstChild(tostring(oi))
						if cur_gear then
							if tostring(oi) == cur_gear.Name then
								cur_gear.Parent = backpack
							end
						end
					end
				end
			end
		end)
	end)
	if not sucess then
		print(error)
	end
end)
