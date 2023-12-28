local pedInVehicle = false

-- Function to set high-speed bump severity multiplier
local function SetBumpMultiplier()
    SetCarHighSpeedBumpSeverityMultiplier(0, 0)
end

-- Event handler for when the player enters a vehicle
RegisterNetEvent('onClientVehicleEnter')
AddEventHandler('onClientVehicleEnter', function()
    pedInVehicle = true
    SetBumpMultiplier()
end)

-- Event handler for when the player exits a vehicle
RegisterNetEvent('onClientVehicleExit')
AddEventHandler('onClientVehicleExit', function()
    pedInVehicle = false
end)

-- Main loop to check if the player is in a vehicle
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)  -- Yield the thread

        local ped = GetPlayerPed(-1)

        if DoesEntityExist(ped) and not IsEntityDead(ped) then
            local isInVehicle = IsPedInAnyVehicle(ped, false)
            
            if isInVehicle and not pedInVehicle then
                TriggerEvent('onClientVehicleEnter')
            elseif not isInVehicle and pedInVehicle then
                TriggerEvent('onClientVehicleExit')
            end
        end
    end
end)
