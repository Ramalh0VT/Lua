game.Players.PlayerAdded:Connect(function(player)
	local success, error = pcall(function()
		-- initial config 	
		
		local dss = game:GetService("DataStoreService")
		local player_info = dss:GetDataStore("PlayerInfo")
		local money_data = dss:GetDataStore("PlayerInfo", "Money")
		local damage_data = dss:GetDataStore("PlayerInfo", "Damage")
		local ownerships_data = dss:GetDataStore("PlayerInfo", "Ownerships")
		
		local exec = script:WaitForChild("item_amount")
		local item_amount = exec.Value
		local user_id = tostring(player.UserId)

		local player_money = money_data:GetAsync(user_id)
		local player_damage = damage_data:GetAsync(user_id)
		local player_ownerships = ownerships_data:GetAsync(user_id)
		
		if player_money == nil then
			player_money = 0
		end
		
		if player_damage == nil then
			player_damage = 0
		end
		
		if player_ownerships == nil then
			player_ownerships = {}
		end
		
		local leaderstats = player:FindFirstChild("leaderstats")
		local money = leaderstats:FindFirstChild("Money")
		local damage = leaderstats:FindFirstChild("Damage")
	
		money.Value = player_money
		damage.Value = player_damage
		
		money_data:SetAsync(user_id, money.Value)
		damage_data:SetAsync(user_id, damage.Value)
		ownerships_data:SetAsync(user_id, player_ownerships)
		
	end)
	if not success then
		print(error)
	end
end)
