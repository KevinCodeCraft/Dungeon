local ReplicatedStorage = game:GetService("ReplicatedStorage");
local Remote = ReplicatedStorage:WaitForChild("CoinPopupEvent");

local Sample = script.Sample;

Remote.OnClientEvent:Connect(function(Amount : number)
	Amount = tostring(Amount);
	
	local Popup = Sample:Clone();
	Popup.Parent = script.Parent;
	
	Popup.TextLabel.Text = `+${Amount}`
	
	Popup.Position = UDim2.new(math.random(), 0, math.random(), 0);
	
	local Time = 2 * math.abs(Popup.Position.Y.Scale, -1.2);
	
	Popup:TweenPosition(
		UDim2.new(Popup.Position.X.Scale, 0, Popup.Position.Y.Scale - 1.2, 0), Enum.EasingDirection.In, Enum.EasingStyle.Quad, Time
	);
end)