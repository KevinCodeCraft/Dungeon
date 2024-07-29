local Player = game.Players.LocalPlayer;

local Humanoid = Player.Character:WaitForChild("Humanoid") :: Humanoid;

Humanoid.HealthChanged:Connect(function()
	local HealthPercentageFraction = Humanoid.Health / Humanoid.MaxHealth;
	
	if HealthPercentageFraction < 0 then
		HealthPercentageFraction = 0
	end

	script.Parent:TweenSize(UDim2.new(HealthPercentageFraction, 0, 1, 0), Enum.EasingDirection.In, Enum.EasingStyle.Quad, 0.1);
end)