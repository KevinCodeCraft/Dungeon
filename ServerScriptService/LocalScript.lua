local Player = game.Players.LocalPlayer;
local OldCoins = Player:WaitForChild("leaderstats").Coins.Value;

local StartRemote = game.ReplicatedStorage:WaitForChild("StartEvent");
local Remote = game.ReplicatedStorage:WaitForChild("FinishEvent");

local Start = 0;

Remote.OnClientEvent:Connect(function()
	script.Parent.Main.Visible = true;
	Player.PlayerGui.HUD.Enabled = false;
	Player.PlayerGui.HealthBar.Enabled = false;
	
	local CoinDifference = Player.leaderstats.Coins.Value - OldCoins;
	script.Parent.Main.CoinsEarnt.Text = `You won ${CoinDifference} coins this round.`
	script.Parent.Main.TimeSpent.Text = `You spent {math.round(os.clock() - Start)} seconds.`
end)

script.Parent.Start.Activated:Once(function()
	Player.PlayerGui.HUD.Enabled = true;
	Player.PlayerGui.HealthBar.Enabled = true;

	StartRemote:FireServer();
	script.Parent.Start:Destroy();
	
	Start = os.clock();
end)