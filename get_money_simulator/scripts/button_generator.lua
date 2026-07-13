local items = {"Paintball", "Firebrand"}
local prices = {150,300}
local img_ids = {"rbxassetid://93740376", "rbxassetid://462830713"}
local id = ''
local pos = 1
local buy = script.Parent.Parent.Parent.item_desc.Frame.buy
local name = ''
local price = 0
local img_id = ''
for _, item in items do
	local newButton = Instance.new("ImageButton")	
	newButton.Parent = script.Parent
	newButton.Name = pos
	newButton.Size = UDim2.new(0.2,0,0.2,0)
	newButton.SizeConstraint = Enum.SizeConstraint.RelativeXX
	local UIStroke = Instance.new("UIStroke")
	local UICorner = Instance.new("UICorner")
	UICorner.Parent = newButton
	UIStroke.Parent = newButton
	UIStroke.Thickness = 4
	img_id = img_ids[pos]
	newButton.Image = img_id
	newButton.BackgroundTransparency = 0.5
	pos += 1
end
local item_desc = script.Parent.Parent.Parent.item_desc
local descendants = script.Parent:GetDescendants()
for _, descendant in descendants do
	if descendant:IsA("ImageButton") then
		descendant_setter = descendant.MouseButton1Down:Connect(function()
			id = tonumber(descendant.Name)
			item_desc.Enabled = true
			name = items[id]
			price = prices[id]
			img_id = img_ids[id]
			item_desc.Frame.desc.Text = name.." - "..price.." moneys"
			item_desc.Frame.item_img.Image = img_id
		end)
	end
end
buy.MouseButton1Down:Connect(function()
	print(_G.ownerships[id])
	if _G.money >= price and not _G.ownerships[id] then
		print("it's possible to buy")
	end
end)

