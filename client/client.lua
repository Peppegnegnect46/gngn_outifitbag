local function openOutfitBag()
    local playerPed = cache.ped or PlayerPedId()

    TaskStartScenarioInPlace(playerPed, "CODE_HUMAN_MEDIC_TEND_TO_DEAD")

    if Config.Appearance == 'illenium-appearance' then
        TriggerEvent("illenium-appearance:client:openOutfitMenu", function()  -- Cambiare il trigger in base all'appearance utilizzato'
            OpenMenu(nil, "outfit")
        end)
    end 
end


local function placeOutfitBag()

    lib.requestAnimDict("pickup_object")
    lib.requestModel(Config.Prop)

    local playerPed = cache.ped or PlayerPedId()
    
    local coords = GetOffsetFromEntityInWorldCoords(playerPed, 0.0, 0.5, 0.0)

    TaskPlayAnim(playerPed, "pickup_object", "pickup_low", 8.0, 8.0, 1000, 50, 0, false, false, false)

    Wait(900)

    outfitbag = CreateObjectNoOffset(Config.Prop, coords.x, coords.y, coords.z, true, false)
    PlaceObjectOnGroundProperly(outfitbag)
        exports.ox_target:addLocalEntity(outfitbag, {
        {
            name = 'takeBag' .. outfitbag,
            label = Config.LabelTake,
            icon = Config.IconShirt,
            onSelect = function(data)
                openOutfitBag()
            end
        },
        {
            name = 'closeBag' .. outfitbag,
            label = Config.LabelPickupBag,
            icon = Config.IconHand,
            onSelect = function(data)
                TaskPlayAnim(playerPed, "pickup_object", "pickup_low", 8.0, 8.0, 1000, 50, 0, false, false, false)
                Wait(900)
                DeleteEntity(data.entity)
                ClearPedTasks(playerPed)
                TriggerServerEvent('gngn_outfitbag:addItems', 1)
            end
        },
    })
end

RegisterNetEvent("gngn_outfitbag:removeItems", function()
    placeOutfitBag()
end)