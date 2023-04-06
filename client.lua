local speed = 20.0 -- Max speed for Autopilot
local flag = 447 -- Ai rules for Autopilot
local stop = 2.0 -- Distance for vehicle to stop at destination

local models = { -- Allowed vehicle models
    "raiden"
}

local trigger = 246 -- Key to activate autopilot
local abort = {32, 34, 8, 9, 73} -- Keys to abort Autopilot

local active = false
local coords
local player
local vehicle

function notify(text)
	SetNotificationTextEntry("STRING")
	AddTextComponentString(text)
	DrawNotification(false, false)
end

function valid(model)
    for k, v in ipairs(models) do
        if string.upper(model) == string.upper(v) then
            return true
        end
    end
    return false
end

function start()
    local blip = GetFirstBlipInfoId(8)
    if blip ~= nil and blip ~= 0 then
        coords = GetBlipCoords(blip)
        TaskVehicleDriveToCoordLongrange(player, vehicle, coords.x, coords.y, coords.z, speed, flag, stop)
        active = true
    else
        notify("Hedef bulunamadi")
    end
end

Citizen.CreateThread(function()
    while true do
        if active then
            local coord = GetEntityCoords(GetPlayerPed(-1))
            local distance = Vdist(coord.x, coord.y, coord.z, coords.x, coords.y, coord.z)
            if distance <= 10 then
                ClearPedTasks(player)
                SetVehicleForwardSpeed(vehicle, 19.0)
                Citizen.Wait(200)
                SetVehicleForwardSpeed(vehicle, 15.0)
                Citizen.Wait(200)
                SetVehicleForwardSpeed(vehicle, 11.0)
                Citizen.Wait(200)
                SetVehicleForwardSpeed(vehicle, 6.0)
                Citizen.Wait(200)
                SetVehicleForwardSpeed(vehicle, 0.0)
                notify("Hedefe ulasildi")
                active = false
            end
        end
        Citizen.Wait(200)
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if active then
            for k, v in ipairs(abort) do
                if IsControlJustPressed(0, v) or isDead then
                    ClearPedTasks(player)
                    active = false
                end
            end
        elseif IsControlJustPressed(0, trigger) then
            player = GetPlayerPed(-1)
            vehicle = GetVehiclePedIsIn(player)
            local model = GetEntityModel(vehicle)
            if valid(GetDisplayNameFromVehicleModel(model)) then
                start()
            end
            Citizen.Wait(1000)
        end
    end
end)