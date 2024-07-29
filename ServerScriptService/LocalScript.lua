local Player = game.Players.LocalPlayer;
local Leaderstats = Player:WaitForChild("leaderstats");

script.Parent.Text = `${Leaderstats.Coins.Value}`

Leaderstats.Coins.Changed:Connect(function()
	script.Parent.Text = `${Leaderstats.Coins.Value}`
end)