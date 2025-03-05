local VoiceVerification = { 
    Helpers = { 
        GetDiscordID = function(playerSource) 
            local identifiers = GetPlayerIdentifiers(playerSource) 
            for _, identifier in ipairs(identifiers) do 
                local discordID = identifier:match("discord:(.+)") 
                if discordID then return discordID end 
            end 
            return nil 
        end, 

        CheckVoiceChannelMembership = function(playerSource, callback) 
            local discordID = VoiceVerification.Helpers.GetDiscordID(playerSource) 
            if not discordID then  
                return callback(false, "No Discord ID found")  
            end 

            local apiEndpoint = string.format( 
                "https://discord.com/api/v9/guilds/%s/voice-states/%s",  
                Config.ServerID,  
                discordID 
            ) 

            local headers = { 
                ["Authorization"] = "Bot " .. Config.BotToken, 
                ["Content-Type"] = "application/json" 
            } 

            PerformHttpRequest(apiEndpoint, function(statusCode, response) 
                if statusCode == 200 then 
                    local data = json.decode(response or "{}") 
                    local isInRequiredChannel = data.channel_id == Config.RequiredChannelID 
                    callback(isInRequiredChannel, isInRequiredChannel and "Verified" or "Wrong Channel") 
                else 
                    callback(false, "API Request Failed") 
                end 
            end, 'GET', '', headers) 
        end 
    }, 

    ConnectionHandler = { 
        OnPlayerConnecting = function(name, setKickReason, deferrals) 
            local playerSource = source 
            deferrals.defer() 
            Wait(250) 
            deferrals.update(Config.VerificationMessage) 

            VoiceVerification.Helpers.CheckVoiceChannelMembership(playerSource, function(isVerified, message) 
                if isVerified then 
                    deferrals.done() 
                else 
                    deferrals.done(string.format("❌ Voice Channel Verification Failed: %s", message)) 
                end 
            end) 
        end, 

        BackgroundVoiceCheck = function() 
            CreateThread(function() 
                while true do 
                    Wait(Config.VoiceCheckInterval) 

                    for _, playerId in ipairs(GetPlayers()) do 
                        VoiceVerification.Helpers.CheckVoiceChannelMembership(playerId, function(isInChannel, message) 
                            if not isInChannel then 
                                DropPlayer(playerId, Config.KickMessage) 
                            end 
                        end) 
                    end 
                end 
            end) 
        end 
    } 
} 

AddEventHandler('playerConnecting', VoiceVerification.ConnectionHandler.OnPlayerConnecting) 
VoiceVerification.ConnectionHandler.BackgroundVoiceCheck() 

AddEventHandler('onResourceStart', function(resourceName) 
    if (GetCurrentResourceName() == resourceName) then 
        print("^2[Voice Verification]^7 Successfully loaded voice channel verification system") 
    end 
end)
