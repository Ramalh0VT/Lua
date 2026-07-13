wait(10)
local extra_desc = ''


print(workspace.
local desc = ''
local button = script.Parent
local gui = script.Parent.Parent.Parent.Parent.item_desc
local buy = gui.Frame.buy
local bye = gui.Frame.bye
local item_price = 0
local item_number = 0
local item_name = ''
button.MouseButton1Down:Connect(function()
	gui.Enabled = true
	item_name = button.Name
	if item_name == "Paintball" then
		item_price = 150
		item_number = 1
	end
	desc = item_name.." - "..item_price.." Moneys"
	gui.Frame.desc.Text = desc
	gui.Frame.item_img.Image = button.Image
end)
buy.MouseButton1Down:Connect(function()
	desc = item_name.." - "..item_price.." Moneys"
	if _G.money >= item_price and not _G.ownerships[item_number] then
		table.insert(_G.ownerships, item_name)
		_G.money -= item_price
		
	elseif _G.money < item_price and not _G.ownerships[item_number] then
		extra_desc = desc
		desc = 'You dont have enough money!'
		gui.Frame.desc.Text = desc
		wait(3.2)
		desc = extra_desc
		gui.Frame.desc.Text = desc
	elseif _G.ownerships[item_number] then
		extra_desc = desc
		desc = 'You already have this item!'
		wait(2)
		desc = extra_desc
	end
end)
bye.MouseButton1Down:Connect(function()
	gui.Enabled = false
end)



