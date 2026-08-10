-- This is to add it to the player DAMAGE DATA, not to add actual damage

local adder = Instance.new("BindableEvent")
adder.Parent = script
adder.Name = "adder"

local function add_damage(event_damage, player_name) 
	player = game.Players:FindFirstChild(player_name)
	local leaderstats = player:FindFirstChild("leaderstats")
	local damage = leaderstats:FindFirstChild("Damage")
	damage.Value += event_damage
end

local add_event = adder.Event:Connect(add_damage)

-- On the other hand, this actually deals damage

local dealer = Instance.new("BindableEvent")
dealer.Parent = script
dealer.Name = "dealer"

local function deal_damage(event_damage,to_damage)
	to_damage:TakeDamage(event_damage)
end

local deal_event = dealer.Event:Connect(deal_damage)
