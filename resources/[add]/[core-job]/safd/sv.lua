ESX = exports["es_extended"]:getSharedObject()
local deadPlayers = {}





ESX.RegisterServerCallback('Emysams:checkitem', function(source, cb, item)
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer.getInventoryItem(item).count > 0 then        
        cb(true)
    else
        TriggerClientEvent("esx:ShowNotification", xPlayer, "Vous n'en n'avez pas sur vous !")
        cb(false)
    end
end)
RegisterNetEvent("Emysams:delitem")
AddEventHandler("Emysams:delitem", function(item)
    local xPlayer = ESX.GetPlayerFromId(source)
    xPlayer.removeInventoryItem(item, 1)
end)
RegisterServerEvent('Emysams:heal')
AddEventHandler('Emysams:heal', function(target, typeSoin)
	TriggerClientEvent('Emysams:heal', target, typeSoin)
end)









RegisterNetEvent('Emysams:revive')
AddEventHandler('Emysams:revive', function(playerId)
	playerId = tonumber(playerId)
	if source == '' and GetInvokingResource() == 'monitor' then -- txAdmin support
        local xTarget = ESX.GetPlayerFromId(playerId)
        if xTarget then
            if deadPlayers[playerId] then
                print('vous avez réanimé %s', xTarget.name)
                xTarget.triggerEvent('Emysams:revive')
            else
                print('n\'est pas inconscient')
            end
        else
            print('ce joueur n\'est plus en ligne')
        end
	else
		local xPlayer = source and ESX.GetPlayerFromId(source)

		if (xPlayer and xPlayer.job.name == 'sams') then
			local xTarget = ESX.GetPlayerFromId(playerId)

			if xTarget then
				if deadPlayers[playerId] then
						xPlayer.showNotification("vous avez réannimé "..xTarget.name)
						xTarget.triggerEvent('Emysams:revive')
				else
					xPlayer.showNotification('n\'est pas inconscient')
				end
			else
				xPlayer.showNotification('ce joueur n\'est plus en ligne')
			end
		end
	end
end)


ESX.RegisterServerCallback('Emysams:checkBalance', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)
	local bankBalance = xPlayer.getAccount('bank').money

	cb(bankBalance >= 500)
end)

RegisterNetEvent('Emysams:payFine')
AddEventHandler('Emysams:payFine', function()
	local xPlayer = ESX.GetPlayerFromId(source)
	local fineAmount = 1000

	xPlayer.showNotification('Vous avez payé $1000 pour être réanimer.')
	xPlayer.removeAccountMoney('bank', fineAmount)

	--TriggerEvent('esx_addonaccount:getSharedAccount', 'society_safd', function(account)
	--	account.removeMoneyMoney(1000)
	--end)
	
end)

RegisterNetEvent('Emysams:setDeathStatus')
AddEventHandler('Emysams:setDeathStatus', function(isDead)
	local xPlayer = ESX.GetPlayerFromId(source)
	if type(isDead) == 'boolean' then
		MySQL.update('UPDATE users SET is_dead = ? WHERE identifier = ?', {isDead, xPlayer.identifier})
		if not isDead then 
			local Ambulance = ESX.GetExtendedPlayers("job", "sams")
			for _, xPlayer in pairs(Ambulance) do
				xPlayer.triggerEvent('Emysams:PlayerNotDead', source)
			end
		end
	end
end)

RegisterNetEvent('esx:onPlayerSpawn')
AddEventHandler('esx:onPlayerSpawn', function()
	local source = source
	if deadPlayers[source] then
		deadPlayers[source] = nil
		local Ambulance = ESX.GetExtendedPlayers("job", "sams")

		for _, xPlayer in pairs(Ambulance) do
				xPlayer.triggerEvent('Emysams:PlayerNotDead', source)
		end
	end
end)


RegisterNetEvent('esx:onPlayerDeath')
AddEventHandler('esx:onPlayerDeath', function(data)
	deadPlayers[source] = 'dead'
	TriggerClientEvent('Emysams:setDeadPlayers', -1, deadPlayers)
end)



RegisterServerEvent('hsafd:Ouvert')
AddEventHandler('hsafd:Ouvert', function()
--exports["WaveShield"]:AddEventHandler('hsafd:Ouvert', function(source)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local xPlayers	= ESX.GetPlayers()
	for i=1, #xPlayers, 1 do
		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
		TriggerClientEvent("k5_notify:notify", xPlayers[i], 'S.A.F.D', 'La permanance est OUVERT', 'safd', 10000)
	end
end)


RegisterServerEvent('hsafd:Fermer')
AddEventHandler('hsafd:Fermer', function()
--exports["WaveShield"]:AddEventHandler('hsafd:Fermer', function(source)
local _source = source
local xPlayer = ESX.GetPlayerFromId(_source)
local xPlayers	= ESX.GetPlayers()
for i=1, #xPlayers, 1 do
	local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
	TriggerClientEvent("k5_notify:notify", xPlayers[i], 'S.A.F.D', 'La permanance est FERMER', 'safd', 10000)
end
end)
