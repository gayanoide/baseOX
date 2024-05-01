--================================--
--          RP /me v1.0.0         --
--            by GIMI             --
--      License: GNU GPL 3.0      --
--================================--

--====================--
--      Commands      --
--====================--

RegisterCommand(
    'me',
    function(source, args, rawCommand)
        local text = rawCommand:sub(4)
        if Config.Text.forceLength and text:len() > Config.Text.maxLength then
            TriggerClientEvent('chat:addMessage', source, {
                color = {255, 0, 0},
                multiline = true,
                args = {"/me", ("Text exceeds the allowed length. Keep your text length up to %s characters."):format(Config.Text.maxLength)}
            })
            return
        end
        TriggerClientEvent('rpchat:displayText', -1, source, text)
    end,
    false
)
