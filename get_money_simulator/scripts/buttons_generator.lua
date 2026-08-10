game.Players.PlayerAdded:Connect(function(player)
	local items = {
		{"Super mega powerful gun", 250, "rbxassetid://5381454270", 1},
		{"Dagger", 150, "rbxassetid://287869411", 2}
	}
	 table.sort(items, 
		function(a,b)
			return a[2]<b[2] 
		end
	 )
	
	local count = 0
	for n, item in items do
		count += 1
	end
	
	local item_amount = Instance.new("IntValue")
	item_amount.Name = "item_amount"
	item_amount.Value = count
	item_amount.Parent = game.ServerScriptService.pdata_loading
	
	local exec = game.Players[player.Name].PlayerGui:WaitForChild("loja")
	
	local player_name = player.Name
	local buy = game.Players[player_name].PlayerGui.loja.item_desc.Frame.buy
	local bye = game.Players[player_name].PlayerGui.loja.item_desc.Frame.bye
	local price = 0
	local name = ''
	local img_id = ''
	local id = ''
	local desc = ''
	
	bye.MouseButton1Down:Connect(function()
		local to_disable = bye.Parent.Parent
		to_disable.Enabled = false
	end)
	
	for n, item in items do
		local newButton = Instance.new("ImageButton")	
		newButton.Parent = bye.Parent.Parent.Parent.items_scrollframe.buttons
		newButton.Name = tostring(items[n][4])
		newButton.Size = UDim2.new(0.2,0,0.2,0)
		newButton.SizeConstraint = Enum.SizeConstraint.RelativeXY
		local UIStroke = Instance.new("UIStroke")
		local UICorner = Instance.new("UICorner")
		UICorner.Parent = newButton
		UIStroke.Parent = newButton
		UIStroke.Thickness = 4
		img_id = items[n][3]
		newButton.Image = img_id
		newButton.BackgroundTransparency = 0.5
	end
	
	local item_desc = bye.Parent.Parent
	
	local buttons = item_desc.Parent.items_scrollframe.buttons:GetChildren()
	
	local cur_item = {}
	
	for n, button in buttons do
		if button:IsA("ImageButton") then
			button.MouseButton1Down:Connect(function()
				id = tonumber(button.Name)
				for _, item in items do
					if item[4] == id then
						cur_item = item
					end
				end
				item_desc.Enabled = true
				name = cur_item[1]
				price = cur_item[2]
				img_id = cur_item[3]
				item_desc.Frame.desc.Text = name.." - "..price.." moneys"
				item_desc.Frame.item_img.Image = img_id
				desc = item_desc.Frame.desc.Text
			end)
		end
	end
	
	local function has_value(owned_table, item_index)
		for i, v in ipairs(owned_table) do
			if v == item_index then
				return true
			end
		end
		return false
	end
		
	buy.MouseButton1Down:Connect(function()
		local sucess, error = pcall(function()
			local dss = game:GetService("DataStoreService")
			local ownerships_data = dss:GetDataStore("PlayerInfo", "Ownerships")
			local user_id = tostring(player.UserId)
			local player_ownerships = ownerships_data:GetAsync(user_id)
			
			
			local ls = player:FindFirstChild("leaderstats")
			local money = ls:FindFirstChild("Money")
			
			
			if has_value(player_ownerships, id) then
				item_desc.Frame.desc.Text = "You already have this!"
				task.wait(1.4)
				item_desc.Frame.desc.Text = desc
			elseif money.Value >= price and not has_value(player_ownerships, id) then
				money.Value -= price
				table.insert(player_ownerships, id)
				ownerships_data:SetAsync(user_id, player_ownerships)
				local backpack = player:FindFirstChild("Backpack")
				local item = backpack.store_gears:FindFirstChild(tostring(id))
				if item then
					item.Parent = backpack
				end
				item_desc.Frame.desc.Text = name.." Sucessfully bought!"
				task.wait(1.4)
				item_desc.Frame.desc.Text = desc
			elseif money.Value < price and not has_value(player_ownerships, id) then
				item_desc.Frame.desc.Text = "You don't have enough money!"
				task.wait(1.4)
				item_desc.Frame.desc.Text = desc
			end
		end)
		if not sucess then
			print(error)
		end
	end)
end)
