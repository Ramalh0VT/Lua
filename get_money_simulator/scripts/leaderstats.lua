_G.player_id = ''
_G.dss = ''
_G.ownerships = {}
local cv_money = 0
local cv_damage = 0
game.Players.PlayerAdded:Connect(function(player)
	local money_t = 0
	local damage_t = 0
	_G.player_id = player.UserId
	_G.dss = game:GetService("DataStoreService")
	wait(4)
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
	local ownerships = _G.dss:GetDataStore("PlayerInfo", "Ownerships")
	local sucess, ErrorMsg = pcall(function() 
		money_t = money_ts:GetAsync(_G.player_id) 
	end)
	if not sucess then
		print(ErrorMsg)
	end
	local sucess, ErrorMsg = pcall(function()
		damage_t = damage_ts:GetAsync(_G.player_id)
	end)
	if not sucess then
		print(ErrorMsg)
	end
	local sucess, ErrorMsg = pcall(function()
		_G.ownerships = ownerships:GetAsync(_G.player_id)
		if not _G.ownerships then
			_G.ownerships = {}
		end
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
		wait(4)
		_G.money = money.Value
		damage.Value = _G.damage
		cv_money = money.Value
		cv_damage = damage.Value
		local sucess, ErrorMsg = pcall(function()
			return money_ts:setAsync(_G.player_id, cv_money)
		end)
		if not sucess then
			print(ErrorMsg)
		end
		local sucess, ErrorMsg = pcall(function()
			return damage_ts:setAsync(_G.player_id, cv_damage)
		end)
		if not sucess then
			print(ErrorMsg)
		end
		local sucess, ErrorMsg = pcall(function()
			return ownerships:setAsync(_G.player_id, _G.ownerships)
		end)
	end
end)

