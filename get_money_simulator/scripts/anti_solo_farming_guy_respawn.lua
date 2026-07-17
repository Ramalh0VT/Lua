name="Humanoid"
robo=script.Parent:clone()
local players = 1
while true do
	wait(10 * players)
	local sucess, _ = pcall(function()
	if script.Parent.Humanoid.Health<1 then
		robot=robo:clone()
		robot.Parent=script.Parent.Parent
		robot:makeJoints()
		script.Parent:remove()
	end
	end)
	players = 0
	for _, player in pairs(game.Players:GetChildren()) do
		if player:IsA("Player") then
				players += 1
		end
	end
end

		



