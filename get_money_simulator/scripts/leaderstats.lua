_G.player_id = ''
_G.dss = ''
_G.player_name = ''
_G.ownerships = {}
_G.damage = 0
_G.money = 0
game.Players.PlayerAdded:Connect(function(player)
	_G.player_id = player.UserId
	_G.player_name = player.Name
	_G.dss = game:GetService("DataStoreService")
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
	local player_info = _G.dss:getDataStore("PlayerInfo")
	local money_ds = _G.dss:GetDataStore("PlayerInfo", "Money")
	local damage_ds = _G.dss:GetDataStore("PlayerInfo", "Damage")
	local ownerships_ds = _G.dss:GetDataStore("PlayerInfo", "Ownerships")
	local sucess, ErrorMsg = pcall(function() 
		_G.money = money_ds:GetAsync(_G.player_id) 
	end)
	if not sucess then
		print(ErrorMsg)
	end
	local sucess, ErrorMsg = pcall(function()
		_G.damage = damage_ds:GetAsync(_G.player_id)
	end)
	if not sucess then
		print(ErrorMsg)
	end
	local sucess, ErrorMsg = pcall(function()
		_G.ownerships = ownerships_ds:GetAsync(_G.player_id)
		if not _G.ownerships then
			_G.ownerships = {}
		end
	end)
	if not sucess then
		print(ErrorMsg)
	end
	if not _G.damage then
		_G.damage = 0
	end
	if not _G.money then
		_G.money = 0
	end
	for n, item in _G.items do
		if _G.ownerships[n] == nil then
			_G.ownerships[n] = false
		end
	end
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
	money.Value = _G.money
	damage.Value = _G.damage
	while true do
		wait(1)
		money.Value = _G.money
		damage.Value = _G.damage
		local sucess, ErrorMsg = pcall(function()
			return money_ds:setAsync(_G.player_id, _G.money)
		end)
		if not sucess then
			print(ErrorMsg)
		end
		local sucess, ErrorMsg = pcall(function()
			return damage_ds:setAsync(_G.player_id, _G.damage)
		end)
		if not sucess then
			print(ErrorMsg)
		end
		local sucess, ErrorMsg = pcall(function()
			return ownerships_ds:setAsync(_G.player_id, _G.ownerships)
		end)

	end
end)

