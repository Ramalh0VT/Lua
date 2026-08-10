local tool = script.Parent
local id = "rbxassetid://101114102659371"

local track

tool.Equipped:Connect(function()
	local character = tool.Parent
	local humanoid = character:FindFirstChildOfClass("Humanoid")
	if humanoid then
		local animation = Instance.new("Animation")
		animation.AnimationId = id
		track = humanoid:LoadAnimation(animation)
	end
end)

local playing = false

tool.Activated:Connect(function()
	if track and not playing then
		track:Play()
		playing = true
		task.wait(0.5)
		playing = false
	end
end)

