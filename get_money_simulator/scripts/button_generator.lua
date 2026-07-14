local items = {"Paintball", "Firebrand"}
local prices = {150, 190} 
local img_ids = {"rbxassetid://93740376", "rbxassetid://77392688"}
_G.items = items
local buy = script.Parent.Parent.Parent.item_desc.Frame.buy
local bye = script.Parent.Parent.Parent.item_desc.Frame.bye
local price = 0
local name = ''
local img_id = ''
local id = ''
local desc = ''
for n, item in items do
	local newButton = Instance.new("ImageButton")	
	newButton.Parent = script.Parent
	newButton.Name = n
	newButton.Size = UDim2.new(0.2,0,0.2,0)
	newButton.SizeConstraint = Enum.SizeConstraint.RelativeXX
	local UIStroke = Instance.new("UIStroke")
	local UICorner = Instance.new("UICorner")
	UICorner.Parent = newButton
	UIStroke.Parent = newButton
	UIStroke.Thickness = 4
	img_id = img_ids[n]
	newButton.Image = img_id
	newButton.BackgroundTransparency = 0.5
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
			desc = item_desc.Frame.desc.Text
		end)
	end
end
bye.MouseButton1Down:Connect(function()
	local to_disable = bye.Parent.Parent
	to_disable.Enabled = false
end)
buy.MouseButton1Down:Connect(function()
	if _G.ownerships[id] then
		item_desc.Frame.desc.Text = "You already have this!"
		wait(1.4)
		item_desc.Frame.desc.Text = desc
	elseif _G.money >= price and not _G.ownerships[id] then
		_G.money -= price
		_G.ownerships[id] = true
		item_desc.Frame.desc.Text = name.." Sucessfully bought!"
		wait(1.4)
		item_desc.Frame.desc.Text = desc
	elseif _G.money < price and not _G.ownerships[id] then
		item_desc.Frame.desc.Text = "You don't have enough money!"
		wait(1.4)
		item_desc.Frame.desc.Text = desc
	end
end)

