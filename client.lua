local function SetShakeMultiplier()
    SetCarHighSpeedBumpSeverityMultiplier(0, 0)
end

Citizen.CreateThread(function()
    local wasInVehicle = false

    while true do
        Citizen.Wait(500)

        local ped = GetPlayerPed(-1)
        local isInVehicle = DoesEntityExist(ped) and not IsEntityDead(ped) and IsPedInAnyVehicle(ped, false)

        if isInVehicle and not wasInVehicle then
            SetShakeMultiplier()
            wasInVehicle = true
        elseif not isInVehicle and wasInVehicle then
            wasInVehicle = false
        end
    end
end)
