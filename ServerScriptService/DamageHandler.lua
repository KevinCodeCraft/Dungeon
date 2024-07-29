local CollectionService = game:GetService("CollectionService");

local function OnHit(Hit : BasePart, Damage : number)
	local Humanoid = Hit.Parent:FindFirstChild("Humanoid");
	
	if not Humanoid then
		return;
	end	
	
	if Damage > Humanoid.MaxHealth then
		Damage = Humanoid.MaxHealth;
	end
	
	Humanoid:TakeDamage(Damage);
end

for _, DamagePart : Part in CollectionService:GetTagged("Damage") do
	local Damage = DamagePart:GetAttribute("Damage");
	
	local LastHit = os.clock();
	DamagePart.Touched:Connect(function(Hit)
		if os.clock() - LastHit > 0.2 then
			LastHit = os.clock();
			OnHit(Hit, Damage);
		end
	end)
end