ESX = exports["es_extended"]:getSharedObject()

ESX.RegisterServerCallback('BahFaut:getUsergroup', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)
	local group = xPlayer.getGroup()
	print(GetPlayerName(source).." - "..group)
	cb(group)
end)
