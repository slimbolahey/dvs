local function SetShakeMultiplier()
    SetCarHighSpeedBumpSeverityMultiplier(0, 0)
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(500)

        local ped = GetPlayerPed(-1)
        if IsPedInAnyVehicle(ped, false) then
            SetShakeMultiplier()
        end
    end
end)
