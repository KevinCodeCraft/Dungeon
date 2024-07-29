script.Parent.Triggered:Once(function() 
	local Room = script.Parent.Parent.Parent;
	Room.DoorEnd:Destroy();
	script.Parent.Parent:Destroy();
end)