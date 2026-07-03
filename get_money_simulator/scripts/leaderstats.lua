game.Players.PlayerAdded:Connect(function(player)
	local leaderstats = Instance.new("Folder")
	leaderstats.Name = "leaderstats"
	leaderstats.Parent = player	
	local moneys = Instance.new("IntValue")
	moneys.Name = "Money"
	moneys.Value = "0"
	moneys.Parent = leaderstats
	local kills = Instance.new("IntValue")
	kills.name = "Kills"
	kills.Value = "0"
	kills.Parent = leaderstats
end)
	
