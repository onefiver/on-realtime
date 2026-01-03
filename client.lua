local Hour = 0
local Minute = 0
local Second = 0
local Synced = false

RegisterNetEvent("RealTime:UpdateTime")
AddEventHandler("RealTime:UpdateTime", function(h, m, s)
    Hour = h
    Minute = m
    Second = s
    Synced = true
    
    NetworkOverrideClockTime(Hour, Minute, Second)
end)

Citizen.CreateThread(function()
    while true do
        if Synced then
            Second = Second + 1

            if Second >= 60 then
                Second = 0
                Minute = Minute + 1
            end

            if Minute >= 60 then
                Minute = 0
                Hour = Hour + 1
            end

            if Hour >= 24 then
                Hour = 0
            end

            NetworkOverrideClockTime(Hour, Minute, Second)
        end

        Citizen.Wait(1000)
    end
end)
