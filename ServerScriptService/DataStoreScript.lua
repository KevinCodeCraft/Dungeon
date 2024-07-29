local DataStoreService = game:GetService("DataStoreService")
local LeaderstatsDataStore = DataStoreService:GetDataStore("LeaderstatsDataStore")

local function Save(Player : Player)
	local playerUserId = "Player_".. Player.UserId

	local data = {
		Coins = Player.leaderstats.Coins.Value;
		Time = Player.FastestTime.Value;
	}

	local succes, errormessage = pcall(function()
		LeaderstatsDataStore:SetAsync(playerUserId, data)
	end)

	if succes then
		print("Data Saved")
	else
		print("There Was An Error")
		warn(errormessage)
	end
end

game.Players.PlayerAdded:Connect(function(player)
	local leaderstats = Instance.new("Folder", player)
	leaderstats.Name = "leaderstats"

	local Coins = Instance.new("IntValue", leaderstats)
	Coins.Name = "Coins"

	local Time = Instance.new("IntValue", player)
	Time.Name = "FastestTime"

	local playerUserId = "Player_".. player.UserId

	local data
	local succes, errormessage = pcall(function()
		data = LeaderstatsDataStore:GetAsync(playerUserId)
	end)

	if succes then
		if data then
			Coins.Value = data.Coins or 0;
			Time.Value = data.Time or 0;
		end
	end
end)

game.Players.PlayerRemoving:Connect(Save)

game:BindToClose(function()
	for _, Player : Player in game.Players:GetPlayers() do
		Save(Player);
	end
end)
