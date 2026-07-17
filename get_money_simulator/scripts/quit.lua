local button = script.Parent
local gui = script.Parent.Parent
button.MouseButton1Down:Connect(function()
	gui.Enabled = false
	gui.item_desc.Enabled = false
end)
