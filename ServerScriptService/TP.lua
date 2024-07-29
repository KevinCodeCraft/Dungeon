local TeleportService = game:GetService("TeleportService");
local ReplicatedStorage = game:GetService("ReplicatedStorage");

local TPRemote = ReplicatedStorage.TeleportRemote;

local function Teleport(Player : Player, PlaceId: number, Reserved : boolean)
	if Reserved then
		local Code = TeleportService:ReserveServer(PlaceId);
		TeleportService:TeleportToPrivateServer(PlaceId, Code, {Player});
		return
	end
	
	TeleportService:Teleport(PlaceId, Player);
end

TPRemote.OnServerEvent:Connect(Teleport);