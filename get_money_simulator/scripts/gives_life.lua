
local tool = script.Parent
local handle = tool:FindFirstChild("Handle")
local model = tool:FindFirstChild("model")
local damage = 10
local equip_sound = tool:FindFirstChild("equip_sound")

local touch_detector = tool.model:FindFirstChild("Cone")

tool.Equipped:Connect(function()
	equip_sound:Play()
end)

touch_detector.Touched:Connect(function(hit)
	local humanoid = hit:FindFirstAncestorOfClass("Humanoid")
	if humanoid and humanoid ~= tool.Parent then
		humanoid:TakeDamage(damage)
	end
end)

