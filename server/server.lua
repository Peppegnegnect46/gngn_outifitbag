local ox = exports.ox_inventory

local outfitbag = 'outfitbag'

ESX.RegisterUsableItem(outfitbag, function(source)
    local src = source
    ox:RemoveItem(src, outfitbag, 1)
    TriggerClientEvent('gngn_outfitbag:removeItems', src)  -- Rimuovi l'argomento outfitbag, poiché non è necessario
end)

RegisterNetEvent('gngn_outfitbag:addItems', function()
    local src = source
    ox:AddItem(src, outfitbag, 1)
end)
