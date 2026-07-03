local part = script.Parent
part.ClickDetector.MouseClick:Connect(function(player)
	local leaderstats = player:FindFirstChild("leaderstats")
	local moneys = leaderstats:FindFirstChild("Money")
	moneys.Value += 1
end)
