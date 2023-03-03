local ped

Citizen.CreateThread( function()
	while true do
		Wait(1)
		ped = GetPlayerPed(-1)

		if IsPedInAnyVehicle(ped) then
			SetCarHighSpeedBumpSeverityMultiplier(0,0)
		end
	end
end)
