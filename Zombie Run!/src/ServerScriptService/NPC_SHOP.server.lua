local CollectionService = game:GetService("CollectionService")

for _, npc in CollectionService:GetTagged("Shop") do
	local animation = Instance.new("Animation")
	animation.AnimationId = `rbxassetid://{npc:GetAttribute("IdleAnimation")}`
	
	local idleAnimation: AnimationTrack = npc.Humanoid.Animator:LoadAnimation(animation)
	idleAnimation.Looped = true
	idleAnimation:Play()
	task.wait()
end