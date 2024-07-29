local Character = script.Parent.Parent

local Humanoid = Character.Humanoid :: Humanoid;

script.Parent.CharName.Text = Character.Name

Humanoid.HealthChanged:Connect(function()
	local HealthPercentageFraction = Humanoid.Health / Humanoid.MaxHealth;

	if HealthPercentageFraction < 0 then
		HealthPercentageFraction = 0
	end

	script.Parent.HealthBar.Holder.Frame:TweenSize(UDim2.new(HealthPercentageFraction, 0, 1, 0), Enum.EasingDirection.In, Enum.EasingStyle.Quad, 0.1);
end)