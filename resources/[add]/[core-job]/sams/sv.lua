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









ESX.RegisterCommand('revive', 'mod', function(xPlayer, args, showError)
	args.playerId.triggerEvent('Emysams:revive', true)
end, true, {help = 'revive un joueur', validate = true, arguments = {
	{name = 'playerId', help = 'The player id', type = 'player'}
}})

AddEventHandler('txAdmin:events:healedPlayer', function(eventData)
	if GetInvokingResource() ~= "monitor" or type(eventData) ~= "table" or type(eventData.id) ~= "number" then
		return
	end
	if deadPlayers[eventData.id] then
		TriggerClientEvent('Emysams:revive', eventData.id)
		local Ambulance = ESX.GetExtendedPlayers("job", "sams")

		for _, xPlayer in pairs(Ambulance) do
			xPlayer.triggerEvent('Emysams:PlayerNotDead', eventData.id)
		end
		deadPlayers[eventData.id] = nil
	end
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

RegisterServerEvent('Emysams:pay')
AddEventHandler('Emysams:pay', function()
--exports["WaveShield"]:AddEventHandler('Emysams:pay', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
    local canAfford = false
	if xPlayer.getMoney() >= 1000 then
        canAfford = true
        xPlayer.removeMoney(1000)
    elseif xPlayer.getAccount('bank').money >= 1000 then
        canAfford = true
        xPlayer.removeAccountMoney('bank', 1000)
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

	--TriggerEvent('esx_addonaccount:getSharedAccount', 'society_ambulance', function(account)
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



RegisterServerEvent('hsams:Ouvert')
AddEventHandler('hsams:Ouvert', function()
--exports["WaveShield"]:AddEventHandler('hsams:Ouvert', function(source)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local xPlayers	= ESX.GetPlayers()
	for i=1, #xPlayers, 1 do
		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
		TriggerClientEvent("k5_notify:notify", xPlayers[i], 'S.A.M.S', 'Des médecins sont disponibles', 'sams', 10000)
	end
end)


RegisterServerEvent('hsams:Fermer')
AddEventHandler('hsams:Fermer', function()
--exports["WaveShield"]:AddEventHandler('hsams:Fermer', function(source)
local _source = source
local xPlayer = ESX.GetPlayerFromId(_source)
local xPlayers	= ESX.GetPlayers()
for i=1, #xPlayers, 1 do
	local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
	TriggerClientEvent("k5_notify:notify", xPlayers[i], 'S.A.M.S', 'Les médecins ne sont plus disponible', 'sams', 10000)
end
end)