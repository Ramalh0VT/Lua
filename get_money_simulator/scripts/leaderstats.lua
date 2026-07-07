
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
game.Players.PlayerAdded:Connect(function(player)
	wait(5)
	local money_t = 0
	local damage_t = 0
	local player_name = player.Name
	local dss = game:GetService("DataStoreService")
	local player_info = dss:getDataStore("PlayerInfo")
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
	local money_ts = dss:GetDataStore("PlayerInfo", "Money")
	local damage_ts = dss:GetDataStore("PlayerInfo", "Damage")
	local sucess, ErrorMsg = pcall(function() 
		money_t = money_ts:GetAsync(player_name) 
	end)
	if not sucess then
		print(ErrorMsg)
	end
	local sucess, ErrorMsg = pcall(function()
		damage_t = damage_ts:GetAsync(player_name)
	end)
	if not sucess then
		print(ErrorMsg)
	end
	if money_t then
		money.Value = money_t
	end
	if damage_t then	
		damage.Value = damage_t
	end
	while true do
		wait(2)
		damage.Value = _G.damage
		local cv_money = money.Value
		local cv_damage = damage.Value
		local sucess, ErrorMsg = pcall(function()
			return money_ts:setAsync(player_name, cv_money)
		end)
		if not sucess then
			print(ErrorMsg)
		end
		local sucess, ErrorMsg = pcall(function()
			return damage_ts:setAsync(player_name, cv_damage)
		end)
	end
end)

