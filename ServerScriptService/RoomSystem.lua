local RunService = game:GetService("RunService");
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local TeleportService = game:GetService("TeleportService")

local CoinRemote = ReplicatedStorage.CoinPopupEvent;
local FinishRemote = ReplicatedStorage.FinishEvent;
local StartRemote = ReplicatedStorage.StartEvent;

local ZombieHandler = require(game.ServerScriptService.ZombieHandler);

local Rooms = game.Workspace.Rooms:GetChildren();

StartRemote.OnServerEvent:Once(function(Player : Player)
	local StartTime = os.clock();

	for i = 1, #Rooms do
		local Room = game.Workspace.Rooms:FindFirstChild("Room".. i)

		if i % 3 == 0 then
			Player.Character.Humanoid.Health = Player.Character.Humanoid.MaxHealth
		end

		if Room:FindFirstChild("Spawn") then
			local Hoard = ZombieHandler.CreateHoard();

			task.wait(1);

			local Zombies = Hoard:Begin(Room.Spawn);

			Hoard:ChangeState();

			local Ready = false;

			for index, Zombie in Zombies do			
				Zombie.Humanoid.Died:Once(function()
					Zombie:Destroy();

					local Coins = math.random(10, 30);
					Player.leaderstats.Coins.Value = Player.leaderstats.Coins.Value + Coins;
					CoinRemote:FireClient(Player, Coins);

					if #Zombies == 0 then
						Ready = true
					end
				end)
			end

			Hoard.HeartBeatConnection = RunService.Heartbeat:Connect(function()
				Hoard:Update();
			end)

			while not Ready do
				task.wait();
			end
			
			if i == #Rooms then
				local Coins = math.random(100, 150);
				Player.leaderstats.Coins.Value = Player.leaderstats.Coins.Value + Coins;
				CoinRemote:FireClient(Player, Coins);

				FinishRemote:FireClient(Player);
				
				local TotalTime = os.clock() - StartTime;
				if math.round(TotalTime) > Player.FastestTime.Value or Player.FastestTime.Value == 0 then
					Player.FastestTime.Value = math.round(TotalTime);
				end
				continue;
			end

			local Coins = math.random(50, 75);
			Player.leaderstats.Coins.Value = Player.leaderstats.Coins.Value + Coins;
			CoinRemote:FireClient(Player, Coins);

			Room.DoorEnd:Destroy();
			continue
		end

		local Coins = math.random(10, 30);
		Player.leaderstats.Coins.Value = Player.leaderstats.Coins.Value + Coins;
		CoinRemote:FireClient(Player, Coins);

		Room.DoorEnd.Destroying:Wait();
		continue
	end
end)