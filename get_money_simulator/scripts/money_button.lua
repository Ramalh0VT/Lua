local part = script.Parent
part.ClickDetector.MouseClick:Connect(function(player)
	local leaderstats = player:FindFirstChild("leaderstats")
	_G.money += 1
end)
