local RunService = game:GetService("RunService");

script.Parent.Parent:GetPropertyChangedSignal("Enabled"):Wait();

local Time = 0;

local function SecondsToMinutes()
	local Seconds = math.round(Time % 60);
	local Minutes = Time // 60;
	
	if Seconds < 10 then
		Seconds = `0{Seconds}`;
	else
		Seconds = tostring(Seconds);
	end
	
	if Minutes < 10 then
		Minutes = `0{Minutes}`;
	else
		Minutes = tostring(Minutes);
	end
	
	script.Parent.Text = `{Minutes}:{Seconds}`;
end

local function OnHeartBeat(DeltaTime)
	Time = Time + DeltaTime;
	SecondsToMinutes()
end

RunService.Heartbeat:Connect(OnHeartBeat) 