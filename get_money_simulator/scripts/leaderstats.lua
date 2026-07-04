game.Players.PlayerAdded:Connect(function(player)
	wait(5)
	local leaderstats = Instance.new("Folder")
	leaderstats.Name = "leaderstats"
	leaderstats.Parent = player	
	local moneys = Instance.new("IntValue")
	moneys.Name = "Money"
	moneys.Value = "0"
	moneys.Parent = leaderstats
	local damage = Instance.new("IntValue")
	damage.Name = "Damage"
	damage.Value = _G.damage
	damage.Parent = leaderstats
	while true do
		wait(2)
		damage.Value = _G.damage
	end
end)
	
