wait(1)
while true do
	local sounds = script:GetChildren()
	local rindex = math.random(1, #sounds)
	local rsound = sounds[rindex]
	rsound:Play()
	wait(rsound.TimeLength)
end
