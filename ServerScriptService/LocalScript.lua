local Player = game.Players.LocalPlayer;
local FastestTime = Player:WaitForChild("FastestTime");

script.Parent.Text = `Fastest time: {FastestTime.Value}s`;