local function UpdateTime()
    local url = "https://worldtimeapi.org/api/timezone/" .. Config.Timezone

    PerformHttpRequest(url, function(code, data)
        if code ~= 200 then
            print("^1[on-realtime] Error getting time from the API. Code: " .. code .. "^0")
            return
        end

        local json = json.decode(data)
        if not json or not json.datetime then
            print("^1[on-realtime] API response invalid^0")
            return
        end

        -- Format 2024-01-05T21:33:14.123+01:00
        local hour = tonumber(string.sub(json.datetime, 12, 13))
        local minute = tonumber(string.sub(json.datetime, 15, 16))

        TriggerClientEvent("RealTime:UpdateTime", -1, hour, minute)
    end)
end

CreateThread(function()
    while true do
        UpdateTime()
        Wait(Config.Update * 60 * 1000)
    end
end)