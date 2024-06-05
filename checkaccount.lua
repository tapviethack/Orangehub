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
    local RareNumber
    if Rare == "a" then
        RareNumber = 3
    elseif Rare == "b" then
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
        return "Not Have"
    end
end

local itemsToCheck = {
    "Valkyrie Helmet",
    "True Triple Katana",
    "Swan Glasses",
    "Cursed Dual Katana",
    "Mirror Fractal"
}

local fields = {}

for _, item in ipairs(itemsToCheck) do
    local hasItem = false
    for _, rarity in ipairs({"a", "b"}) do
        local items = Get(rarity)
        if string.find(items, item) then
            hasItem = true
            break
        end
    end
    table.insert(fields, hasItem and "✅" or "❌")
end
--Melee Check

--FruitCheck
-- Predefined order for sorting fruits
local predefinedOrder = {
    "Kitsune-Kitsune",
    "Leopard-Leopard",
    "Dragon-Dragon",
    "Spirit-Spirit",
    "Control-Control",
    "Venom-Venom",
    "Shadow-Shadow",
    "Dough-Dough",
    "T-Rex-T-Rex",
    "Mammoth-Mammoth",
    "Gravity-Gravity",
    "Blizzard-Blizzard",
    "Pain-Pain",
    "Rumble-Rumble",
    "Portal-Portal",
    "Phoenix-Phoenix",
    "Sound-Sound",
    "Spider-Spider",
    "Love-Love",
    "Buddha-Buddha",
    "Quake-Quake",
    "Magma-Magma",
    "Ghost-Ghost",
    "Barrier-Barrier",
    "Rubber-Rubber",
    "Light-Light",
    "Diamond-Diamond",
    "Dark-Dark",
    "Sand-Sand",
    "Ice-Ice",
    "Falcon-Falcon",
    "Flame-Flame",
    "Spike-Spike",
    "Smoke-Smoke",
    "Bomb-Bomb",
    "Spring-Spring",
    "Chop-Chop",
    "Spin-Spin",
    "Rocket-Rocket"
}

-- Helper function to get the index of a fruit in the predefined order
local function getOrderIndex(fruit)
    for index, name in ipairs(predefinedOrder) do
        if fruit == name then
            return index
        end
    end
    return #predefinedOrder + 1 -- If the fruit is not found, it will be placed at the end
end

-- Custom sort function based on the predefined order
function CustomSort(a, b)
    local indexA = getOrderIndex(a)
    local indexB = getOrderIndex(b)
    return indexA < indexB
end

-- Function to get all fruits in inventory
function GetAllFruitsInInventory()
    local fruits = {}

    for _, v in pairs(game:GetService("ReplicatedStorage").Remotes["CommF_"]:InvokeServer("getInventoryFruits")) do
        if type(v) == "table" and v.Name then
            table.insert(fruits, v.Name)
        end
    end

    return fruits
end

-- Lấy danh sách tất cả trái cây trong kho và sắp xếp theo thứ tự đã định trước
local allFruits = GetAllFruitsInInventory()
table.sort(allFruits, CustomSort)

-- Tạo chuỗi danh sách trái cây
local fruitsString = "```"
for _, fruitName in ipairs(allFruits) do
    fruitsString = fruitsString .. fruitName .. "\n"
end
fruitsString = fruitsString .. "```"



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
                    ["inline"] = false
                },
                {
				    ["name"] = "Awakened: ",
				    ["value"] = "```"..tostring(GetAwaken()).."```",
                    ["inline"] = true
				},
                {
                    ["name"] = "Melee: ",
                    ["value"] = "```NhuDai```",
                    ["inline"] = false
                },
                {
                    ["name"] = "Item: ",
                    ["value"] = "```\n"..table.concat(fields, "\n").."```",
                    ["inline"] = false
                },
                {
                    ["name"] = "Fruit Store: ",
                    ["value"] = fruitsString,
                    ["inline"] = true
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
