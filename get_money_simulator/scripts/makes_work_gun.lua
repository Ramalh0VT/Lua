local tool = script.Parent
local player = game.Players.LocalPlayer
local replicatedStorage = game:GetService("ReplicatedStorage")
local run_service = game:GetService("RunService")


local sss = game:GetService("ServerScriptService")
local damage_host = sss:WaitForChild("damage_host")
local adder = damage_host:FindFirstChild("adder")
local dealer = damage_host:FindFirstChild("dealer")

local leaderstats = player:FindFirstChild("leaderstats")
local player_damage = leaderstats:FindFirstChild("Damage")


local damage = 20
local bullet_speed = 350
local range = 350

local mouse = nil


tool.Equipped:Connect(function()
	mouse = player:GetMouse()
end)

local on_cooldown = false

tool.Activated:Connect(function()
	if not mouse then
		return
	end
	local barrel = tool.model:FindFirstChild("barrel")
	local base_bullet = replicatedStorage:FindFirstChild("Bullet")
	local used_bullet = base_bullet:Clone()
	used_bullet.Parent = workspace
	
	local shoot_sound = tool:FindFirstChild("firing")
	shoot_sound:Play()
	local direction = (mouse.Hit.Position - barrel.Position).Unit
	local bullet_part
	
	if used_bullet:IsA("Part") then 
		used_bullet.CFrame = CFrame.new(barrel.Position, barrel.Position + direction)
		used_bullet.Anchored = false
		bullet_part = used_bullet
	end
	
	local bv = Instance.new("BodyVelocity")
	bv.Velocity = direction * bullet_speed
	bv.MaxForce = Vector3.new(1e6,1e6,1e6)
	bv.Parent = bullet_part
	
	local travelled = 0
	local touch
	
	local on_cooldown = false
	
	touch = run_service.Heartbeat:Connect(function(dt)
			if bullet_part and bullet_part.Parent then
				local ray = Ray.new(bullet_part.Position, direction * 1)
				local hit_part = workspace:FindPartOnRayWithIgnoreList(ray, {player.Character, bullet})
				if hit_part and hit_part.Parent:FindFirstChild("Humanoid") then
					dealer:Fire(damage,hit_part.Parent.Humanoid)
					if hit_part.Parent.Humanoid.DisplayName ~= "Shopkeeper" and hit_part.Parent.Humanoid.Health >1 then
						adder:Fire(damage, player.Name)
					end
					used_bullet:Destroy()
					touch:Disconnect()
				else
					travelled += bullet_speed * dt
					if travelled >= range then
						used_bullet:Destroy()
						touch:Disconnect()
					end
				end
			else
				touch:Disconnect()
			end
 	end)
end)





