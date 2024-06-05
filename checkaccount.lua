Urlsent = "https://discord.com/api/webhooks/1227538406716866623/lkC5aen_VL4LMBuc8roaydmgb2XA0c5-wHGOh2Lk3pxfbyxx91h8rMEO05oxrfnrac7j"

function GetAwaken()
    ReturnText = ""
    Awakened_Z = ":x:"
    Awakened_X = ":x:"
    Awakened_C = ":x:"
    Awakened_V = ":x:"
    Awakened_F = ":x:"
    for i ,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
        if v:IsA("Tool") then
            if v.ToolTip == "Blox Fruit" then
                if v:FindFirstChild("AwakenedMoves") then
                    if v.AwakenedMoves:FindFirstChild("Z") then
                        Awakened_Z = ":white_check_mark:"
                    end
                    if v.AwakenedMoves:FindFirstChild("X") then
                        Awakened_X = ":white_check_mark:"
                    end
                    if v.AwakenedMoves:FindFirstChild("C") then
                        Awakened_C = ":white_check_mark:"
                    end
                    if v.AwakenedMoves:FindFirstChild("V") then
                        Awakened_V = ":white_check_mark:"
                    end
                    if v.AwakenedMoves:FindFirstChild("F") then
                        Awakened_F = ":white_check_mark:"
                    end
                    ReturnText = ":regional_indicator_z:"..Awakened_Z..
                        "\n"..":regional_indicator_x:"..Awakened_X..
                        "\n"..":regional_indicator_c:"..Awakened_C..
                        "\n"..":regional_indicator_v:"..Awakened_V..
                        "\n"..":regional_indicator_f:"..Awakened_F
                else
                    ReturnText = "This Fruit Can't Awakened"
                end
            end
        end
    end
    for i ,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
        if v:IsA("Tool") then
            if v.ToolTip == "Blox Fruit" then
                if v:FindFirstChild("AwakenedMoves") then
                    if v.AwakenedMoves:FindFirstChild("Z") then
                        Awakened_Z = ":white_check_mark:"
                    end
                    if v.AwakenedMoves:FindFirstChild("X") then
                        Awakened_X = ":white_check_mark:"
                    end
                    if v.AwakenedMoves:FindFirstChild("C") then
                        Awakened_C = ":white_check_mark:"
                    end
                    if v.AwakenedMoves:FindFirstChild("V") then
                        Awakened_V = ":white_check_mark:"
                    end
                    if v.AwakenedMoves:FindFirstChild("F") then
                        Awakened_F = ":white_check_mark:"
                    end
                    ReturnText = ":regional_indicator_z:"..Awakened_Z..
                        "\n"..":regional_indicator_x:"..Awakened_X..
                        "\n"..":regional_indicator_c:"..Awakened_C..
                        "\n"..":regional_indicator_v:"..Awakened_V..
                        "\n"..":regional_indicator_f:"..Awakened_F
                else
                    ReturnText = "This Fruit Can't Awakened"
                end
            end
        end
    end
    if ReturnText ~= "" then
        return ReturnText
    else
        return "Not Have"
    end
end
--Rate
function Get(Rare)
    if Rare == "Common" then
        RareNumber = 0
    elseif Rare == "Uncommon" then
        RareNumber = 1
    elseif Rare == "Rare" then
        RareNumber = 2
    elseif Rare == "Legendary" then
        RareNumber = 3
    elseif Rare == "Mythical" then
        RareNumber = 4
    else
        return "Wrong Input"
    end
    local ReturnText = ""
    for i,v in pairs(game:GetService("ReplicatedStorage").Remotes["CommF_"]:InvokeServer("getInventoryWeapons")) do
        if type(v) == "table" then
            if v.Rarity then
                if tonumber(v.Rarity) == RareNumber then
                    ReturnText = ReturnText .. v.Name .. "\n"
                end
            end
        end
    end
    if ReturnText ~= "" then
        return ReturnText
    else
        return 
    end
end

-- Fruit Check
function GetAllFruitsInInventory()
    local fruits = {}
    for _, v in pairs(game:GetService("ReplicatedStorage").Remotes["CommF_"]:InvokeServer("getInventoryFruits")) do
        if type(v) == "table" and v.Name then
            table.insert(fruits, v)
        end
    end
    return fruits
end

local allFruits = GetAllFruitsInInventory()
table.sort(allFruits, function(a, b)
    local beliA = tonumber(a.Price) or 1000000
    local beliB = tonumber(b.Price) or 0
    return beliA < beliB
end)

local fruitsString = ""
for _, fruit in ipairs(allFruits) do
    fruitsString = fruitsString .. fruit.Name .. "\n"
end
--Check melee
local function CheckMelee(meleeName, hasMeleeVariable)
    local args = {
        [1] = meleeName,
        [2] = true
    }
    local buyResult = tonumber(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args)))
    if buyResult and buyResult == 1 then
        hasMeleeVariable = true
    end
    return hasMeleeVariable
end

local HasTalon = CheckMelee("BuyDragonTalon", false)
local HasSuperhuman = CheckMelee("BuySuperhuman", false)
local HasKarate = CheckMelee("BuySharkmanKarate", false)
local HasDeathStep = CheckMelee("BuyDeathStep", false)
local HasElectricClaw = CheckMelee("BuyElectricClaw", false)
local HasGodhuman = CheckMelee("BuyGodhuman", false)
local HasSanguineArt = CheckMelee("BuySanguineArt", false)
local function formatMeleeStatus(meleeName, status)
    local icon = status and "✅" or "❌"
    return meleeName .. ": " .. icon
end
local meleeValue = string.format("%s\n%s\n%s\n%s\n%s\n%s\n%s",
    formatMeleeStatus("Superhuman", HasSuperhuman),
    formatMeleeStatus("Sharkman Karate", HasKarate),
    formatMeleeStatus("Death Step", HasDeathStep),
    formatMeleeStatus("Electric Claw", HasElectricClaw),
    formatMeleeStatus("Dragon Talon", HasTalon),
    formatMeleeStatus("God Human", HasGodhuman),
    formatMeleeStatus("SanguineArt", HasSanguineArt)
)

local data = {
    ["content"] = "",
    ["embeds"] = {
        {
            ["title"] = "**Orange Hub | Check Account**",
            ["color"] = tonumber(0x00BFFF),
            ["type"] = "rich",
            ["fields"] = {
                {
                    ["name"] = "User Name: ",
                    ["value"] = "||" .. game.Players.LocalPlayer.Name .. "||",
                    ["inline"] = true
                },
                {
                    ["name"] = "Level: ",
                    ["value"] = "```"..game:GetService("Players").LocalPlayer.Data.Level.Value.."```",
                    ["inline"] = true
                },
                {
                    ["name"] = "Bounty/Honor: ",
                    ["value"] = "```"..tostring(game:GetService("Players").LocalPlayer.leaderstats["Bounty/Honor"].Value):reverse():gsub("%d%d%d", "%1,"):reverse():gsub("^,", "").."```",
                    ["inline"] = true
                },
                {
                    ["name"] = "Beli: ",
                    ["value"] = "```"..tostring(game.Players.LocalPlayer.Data.Beli.Value):reverse():gsub("%d%d%d", "%1,"):reverse():gsub("^,", "").."```",
                    ["inline"] = true
                },
                {
                    ["name"] = "Fragment: ",
                    ["value"] = "```"..tostring(game.Players.LocalPlayer.Data.Fragments.Value):reverse():gsub("%d%d%d", "%1,"):reverse():gsub("^,", "").."```",
                    ["inline"] = true
                },
                {
                    ["name"] = "Fruit Use: ",
                    ["value"] = "```"..game:GetService("Players").LocalPlayer.Data.DevilFruit.Value.."```",
                    ["inline"] = true
                },
                {
                    ["name"] = "Race: ",
                    ["value"] = "```"..game:GetService("Players").LocalPlayer.Data.Race.Value.."```",
                    ["inline"] = true
                },
                {
                    ["name"] = "Awakened: ",
                    ["value"] = "```"..tostring(GetAwaken()).."```",
                    ["inline"] = true
                },
                {
                    ["name"] = "Melee: ",
                    ["value"] = "```" ..meleeValue.. "```",
                    ["inline"] = true
                },
                {
                    ["name"] = "Common Weapons: ",
                    ["value"] = "```\n"..Get("Common").."```",
                    ["inline"] = true
                },
                {
                    ["name"] = "Uncommon Weapons: ",
                    ["value"] = "```\n"..Get("Uncommon").."```",
                    ["inline"] = true
                },
                {
                    ["name"] = "Rare Weapons: ",
                    ["value"] = "```\n"..Get("Rare").."```",
                    ["inline"] = true
                },
                {
                    ["name"] = "Legendary Weapons: ",
                    ["value"] = "```\n"..Get("Legendary").."```",
                    ["inline"] = true
                },
                {
                    ["name"] = "Mythical Weapons: ",
                    ["value"] = "```\n"..Get("Mythical").."```",
                    ["inline"] = true
                },
                {
                    ["name"] = "Fruit Store: ",
                    ["value"] = "```\n" ..fruitsString.. "```",
                    ["inline"] = false
                },
            },
        },
        ["thumbnail"] = {
            ["url"] = "",
        },
        ["footer"] = {
            ["text"] = "Orange Hub | Check Account with Webhooks",
        },
        ["timestamp"] = os.date("!%Y-%m-%dT%H:%M:%SZ"),
    }
}

local Data = game:GetService("HttpService"):JSONEncode(data)
local Head = {["content-type"] = "application/json"}
Send = http_request or request or HttpPost or syn.request 
local sendhook = {Url = Urlsent, Body = Data, Method = "POST", Headers = Head}
Send(sendhook)
