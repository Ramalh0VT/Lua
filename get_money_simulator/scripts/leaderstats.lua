_G.player_name = ''
_G.dss = ''
game.Players.PlayerAdded:Connect(function(player)
	local money_t = 0
	local damage_t = 0
	_G.player_name = player.Name
	_G.dss = game:GetService("DataStoreService")
	wait(3)
	local player_info = _G.dss:getDataStore("PlayerInfo")
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
	local money_ts = _G.dss:GetDataStore("PlayerInfo", "Money")
	local damage_ts = _G.dss:GetDataStore("PlayerInfo", "Damage")
	local sucess, ErrorMsg = pcall(function() 
		money_t = money_ts:GetAsync(_G.player_name) 
	end)
	if not sucess then
		print(ErrorMsg)
	end
	local sucess, ErrorMsg = pcall(function()
		damage_t = damage_ts:GetAsync(_G.player_name)
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
		wait(1)
		damage.Value = _G.damage
		local cv_money = money.Value
		local cv_damage = damage.Value
		local sucess, ErrorMsg = pcall(function()
			return money_ts:setAsync(_G.player_name, cv_money)
		end)
		if not sucess then
			print(ErrorMsg)
		end
		local sucess, ErrorMsg = pcall(function()
			return damage_ts:setAsync(_G.player_name, cv_damage)
		end)
	end
end)

