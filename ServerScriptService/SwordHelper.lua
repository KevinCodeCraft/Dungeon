local SwordHandler = require(game.ServerScriptService.SwordHandler);
local ReplicatedStorage = game:GetService("ReplicatedStorage");

local SwordEvent = ReplicatedStorage.SwordEvent;

local function GiveItems(Player)
	local Sword = SwordHandler.new(Player);
	
	local SwordHolderUGC = game.ServerStorage.SwordHolder:Clone();
	SwordHolderUGC.Parent = Player.Character
	
	Sword.Tool.Activated:Connect(function()
		Sword:Attack();
	end)
end

local function PlayerAdded(Player :  Player)
	local Character = Player.Character;

	if not Character then
		Character = Player.CharacterAdded:Wait();
	end

	GiveItems(Player);

	Player.CharacterAdded:Connect(function()
		GiveItems(Player);
	end)
end

local function OnServer(Player : Player, Type :string)
	local Sword = SwordHandler.Swords[Player.Name];
	
	if not Sword then
		GiveItems(Player);
		return;
	end
	
	if Type == "StateChange" then
		if Sword.Equipped == false then
			Sword:Equip();
		else
			Sword:Unequip();
		end
	end
end

game.Players.PlayerAdded:Connect(PlayerAdded);
SwordEvent.OnServerEvent:Connect(OnServer)