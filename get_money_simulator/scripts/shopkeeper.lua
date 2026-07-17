_G.gregaozao = script.Parent
local prox = script.Parent:WaitForChild("ProximityPrompt")
prox.Triggered:Connect(function(player) 
local pgui = player:WaitForChild("PlayerGui")
local storegui = pgui:WaitForChild("loja")
storegui.Enabled = true
end)
