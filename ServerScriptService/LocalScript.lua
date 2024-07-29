local ReplicatedStorage = game:GetService("ReplicatedStorage");
local SwordEvent = ReplicatedStorage:WaitForChild("SwordEvent");

game.StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.Backpack, false);
game.StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.Health, false);

script.Parent.Activated:Connect(function()
	SwordEvent:FireServer("StateChange");
end)