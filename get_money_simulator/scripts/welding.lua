local tool = script.Parent
local handle = tool:FindFirstChild("Handle")

if handle then
	for _, part in ipairs(tool:GetDescendants()) do
		if part:IsA("Part") or part:IsA("MeshPart") and part ~= handle then
			local weld = Instance.new("WeldConstraint")
			weld.Part0 = handle
			weld.Part1 = part
			weld.Parent = handle
			part.Anchored = false
		end
	end
	handle.Anchored = false
end
