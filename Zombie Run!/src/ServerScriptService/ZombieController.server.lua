-- Services
local ServerStorage = game:GetService("ServerStorage")

-- Constans
local ENEMY_POPULATION = 5

-- Members
local enemies:Folder = ServerStorage.Enemies
local zombie:Model = enemies:FindFirstChild("Zombie")
local spawnedEnemies = workspace.spawnEnemies

local function spawnZombie()
	
	-- Clona o zombie
	local zombieCloned = zombie:Clone()

	-- Move o zombie clonado para a workspace
	zombieCloned.Parent = spawnedEnemies
end
-- Adiciona os primeiros inimigos no mundo
for count=1, ENEMY_POPULATION do
	spawnZombie()
end

while true do 
	local population = #spawnedEnemies:GetChildren()
	if population < ENEMY_POPULATION then
		print("Zombie spawned")
		spawnZombie()
	end
	
	wait(1)
end