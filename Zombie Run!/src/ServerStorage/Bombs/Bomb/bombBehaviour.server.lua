-- Constants
local EXPLOSION_TIME = 1

-- Members
local bomb = script.Parent
local owner = bomb:GetAttribute("Owner")
local power = bomb:GetAttribute("Power")
local bombExplosionSound = game:GetService("SoundService").BombExplosion

-- Bomb behaviour
delay(EXPLOSION_TIME, function()
	local explosion = Instance.new("Explosion")
	explosion.BlastRadius = 20
	explosion.BlastPressure = 0
	explosion.DestroyJointRadiusPercent = 0
	explosion.Position = bomb.Position

	local bombExplosionSoundClone = bombExplosionSound:Clone()
	bombExplosionSoundClone.Parent = workspace
	bombExplosionSoundClone:Play()
	
	local collider = bomb.Collider
	collider.Touched:Connect(function(hit) end)
	
	local parts = collider:GetTouchingParts()
	
	local humanoids = {}
	
	for _, part in parts do
		local success, message = pcall(function()
			local character = part.Parent 
			if character then
				local humanoid = character:FindFirstChild("Humanoid")
				if humanoid then
					if not humanoids[humanoid] then
						humanoids[humanoid] = true
						humanoid.Health -= power
						
						
						humanoid:SetAttribute("LastDamageBy", owner)
					end
				end
			end
			
		end)
		if not success then
			warn(message)
		end
	end
	
	explosion.Parent = workspace
	bomb:Destroy()
end)