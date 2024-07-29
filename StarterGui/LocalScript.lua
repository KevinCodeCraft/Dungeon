local ReplicatedStorage = game:GetService("ReplicatedStorage");
local TPRemote = ReplicatedStorage:WaitForChild("TeleportRemote");

local Debounce = os.clock() - 30;

script.Parent.Activated:Connect(function()
	if os.clock() - Debounce < 30 then
		return	
	end
	
	Debounce = os.clock();
	TPRemote:FireServer(18452655500);
end)