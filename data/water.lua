local isInRoxwood = false

local roxwoodZone = CircleZone:Create(vector3(-1833.236816, 7848.669434, 118.561996), 2600.0, {
    name = "roxwood",
    debugPoly = true,
    useZ = false
})

AddEventHandler('playerSpawned', function()
    Wait(500)
    local coords = GetEntityCoords(PlayerPedId())

    if roxwoodZone:isPointInside(coords) then
        isInRoxwood = true
        SetWind(0.1)
        WaterOverrideSetStrength(0.0)
    end
end)

roxwoodZone:onPlayerInOut(function(isInside)
    if isInside and not isInRoxwood then
        isInRoxwood = true
        --SetWind(0.1)
        WaterOverrideSetStrength(0.8)
    elseif not isInside and isInRoxwood then
        isInRoxwood = false
        --SetWind(0.0)
        WaterOverrideSetStrength(0.0)
    end
end)
