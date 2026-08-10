game.Players.PlayerRemoving:Connect(function(player)
	local sucess, error = pcall(function()
		local dss = game:GetService("DataStoreService")
		local money_data = dss:GetDataStore("PlayerInfo", "Money")
		local damage_data = dss:GetDataStore("PlayerInfo", "Damage")
		local ownerships_data = dss:GetDataStore("PlayerInfo", "ownerships")
		money_data:SetAsync(user_id, money.Value)
		damage_data:SetAsync(user_id, damage.Value)
	end)
	if not sucess then
		print(error)
	end
end)
