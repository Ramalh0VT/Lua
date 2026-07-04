game.Players.PlayerAdded:Connect(function(player)
	wait(5)
	local player_name = player.Name
	local dss = game:GetService("DataStoreService")
	local leaderstats = Instance.new("Folder")
	leaderstats.Name = "leaderstats"
	leaderstats.Parent = player	
	local money = Instance.new("IntValue")
	money.Name = "Money"
	money.Value = 0
	money.Parent = leaderstats
	local damage = Instance.new("IntValue")
	damage.Name = "Damage"
	damage.Value = 0
	damage.Parent = leaderstats
	local money_ts = dss:GetDataStore("Money")
	local damage_ts = dss:GetDataStore("Damage")
	if money_ts:GetAsync(player_name) then
		money.Value = money_ts:GetAsync(player_name)
	end
	if damage_ts:GetAsync(player_name) then	
		damage.Value = damage_ts:GetAsync(player_name)
	end
	while true do
		wait(5)
		damage.Value = _G.damage
		local cv_money = money.Value
		local cv_damage = damage.Value
		money_ts:SetAsync(player_name, cv_money)
		damage_ts:SetAsync(player_name, cv_damage)
	end
end)

