if game.Players.LocalPlayer.PlayerGui.Main:FindFirstChild("ChooseTeam") then
    local selectedTeam = getgenv().Setting.StartHunting.SelectTeam or "Pirates"
    for i, v in pairs(
        getconnections(
            game:GetService("Players").LocalPlayer.PlayerGui.Main.ChooseTeam.Container[selectedTeam].Frame.TextButton.Activated
        )
    ) do
        for a, b in pairs(getconnections(game:GetService("UserInputService").TouchTapInWorld)) do
            b:Fire()
        end
        v.Function()
    end
end
--Bounty lock
local a = getgenv().Setting.StartHunting.BountyLock
if game.Players.LocalPlayer then
    if game.Players.LocalPlayer.leaderstats and game.Players.LocalPlayer.leaderstats["Bounty/Honor"] then
        local b = tostring(game.Players.LocalPlayer.leaderstats["Bounty/Honor"].Value)
        if a == b then
            game.Players.LocalPlayer:Kick(getgenv().Setting.StartHunting.MessengerBountyLock)
        end
    end    
end
-- Check World/Tween + Bypass
if game.PlaceId == 7449423635 then
    World3 = true
elseif game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelZou") then
else
    game.Players.LocalPlayer:Kick("Đéo đủ trình | You're not eligible yet")
end
if World3 then 
    distbyp = 5000
    island = {
    ["Port Town"] = CFrame.new(-290.7376708984375, 6.729952812194824, 5343.5537109375),
    ["Hydra Island"] = CFrame.new(5749.7861328125, 611.9736938476562, -276.2497863769531),
    ["Mansion"] = CFrame.new(-12471.169921875, 374.94024658203, -7551.677734375),
    ["Castle On The Sea"] = CFrame.new(-5085.23681640625, 316.5072021484375, -3156.202880859375),
    ["Haunted Island"] = CFrame.new(-9547.5703125, 141.0137481689453, 5535.16162109375),
    ["Great Tree"] = CFrame.new(2681.2736816406, 1682.8092041016, -7190.9853515625),
    ["Candy Island"] = CFrame.new(-1106.076416015625, 13.016114234924316, -14231.9990234375),
    ["Cake Island"] = CFrame.new(-1903.6856689453125, 36.70722579956055, -11857.265625),
    ["Loaf Island"] = CFrame.new(-889.8325805664062, 64.72842407226562, -10895.8876953125),
    ["Peanut Island"] = CFrame.new(-1943.59716796875, 37.012996673583984, -10288.01171875),
    ["Cocoa Island"] = CFrame.new(147.35205078125, 23.642955780029297, -12030.5498046875),
    ["Tiki Outpost"] = CFrame.new(-16234,9,416)
    } 
elseif World2 then 
    distbyp = 3500
    island = { 
    a = CFrame.new(753.14288330078, 408.23559570313, -5274.6147460938),
    b = CFrame.new(-5622.033203125, 492.19604492188, -781.78552246094),
    c= CFrame.new(-11.311455726624, 29.276733398438, 2771.5224609375),
    d= CFrame.new(-2448.5300292969, 73.016105651855, -3210.6306152344),
    e=CFrame.new(-380.47927856445, 77.220390319824, 255.82550048828), 
    f=CFrame.new(-3032.7641601563, 317.89672851563, -10075.373046875),
    g=CFrame.new(6148.4116210938, 294.38687133789, -6741.1166992188),
    h=CFrame.new(923.40197753906, 125.05712890625, 32885.875),
    i=CFrame.new(-6127.654296875, 15.951762199402, -5040.2861328125),
    }
elseif World1 then 
    distbyp = 1500
    island = { 
    a = CFrame.new(979.79895019531, 16.516613006592, 1429.0466308594), 
    b = CFrame.new(-2566.4296875, 6.8556680679321, 2045.2561035156), 
    c = CFrame.new(944.15789794922, 20.919729232788, 4373.3002929688), 
    d = CFrame.new(-1181.3093261719, 4.7514905929565, 3803.5456542969), 
    e =CFrame.new(-1612.7957763672, 36.852081298828, 149.12843322754), 
    f = CFrame.new(-690.33081054688, 15.09425163269, 1582.2380371094) ,
    g = CFrame.new(-4607.82275, 872.54248, -1667.55688), 
    h = CFrame.new(-7952.31006, 5545.52832, -320.704956),
    i = CFrame.new(-4914.8212890625, 50.963626861572, 4281.0278320313),
    j = CFrame.new(-1427.6203613281, 7.2881078720093, -2792.7722167969),
    k = CFrame.new(1347.8067626953, 104.66806030273, -1319.7370605469),
    l = CFrame.new(5127.1284179688, 59.501365661621, 4105.4458007813),
    m = CFrame.new(61163.8515625, 11.6796875, 1819.7841796875),
    n = CFrame.new(-5247.7163085938, 12.883934020996, 8504.96875),
    o =CFrame.new(4875.330078125, 5.6519818305969, 734.85021972656),
    p = CFrame.new(-4813.0249, 903.708557, -1912.69055),
    q = CFrame.new(-4970.21875, 717.707275, -2622.35449),
    } 
end
local p = game.Players
local lp = p.LocalPlayer

local rs = game.RunService
local hb = rs.Heartbeat
local rends = rs.RenderStepped
local webhook = {} 

getgenv().weapon = nil
getgenv().targ = nil 
getgenv().lasttarrget = nil
getgenv().checked = {}
getgenv().pl = p:GetPlayers()
wait(1)
--- Tween / Bypass ---
function bypass(Pos)   
    if lp.Character:FindFirstChild("Head") and lp.Character:FindFirstChild("HumanoidRootPart") and lp.Character:FindFirstChild("Humanoid") then
        dist = math.huge
        is = nil
        for i , v in pairs(island) do
            if (Pos.Position-v.Position).magnitude < dist then
                is = v 
                dist = (Pos.Position-v.Position).magnitude 
            end
        end 
        if is == nil then return; end
        if lp:DistanceFromCharacter(Pos.Position) > distbyp then 
            if (lp.Character.Head.Position-Pos.Position).magnitude > (is.Position-Pos.Position).magnitude then
                if tween then
                    tween:Destroy()
                end
                if (is.X == 61163.8515625 and is.Y ==11.6796875 and is.Z == 1819.7841796875) or is == CFrame.new(-12471.169921875, 374.94024658203, -7551.677734375) or is == CFrame.new(-5085.23681640625, 316.5072021484375, -3156.202880859375) or is == CFrame.new(5749.7861328125, 611.9736938476562, -276.2497863769531) then
                    if tween then
                       tween:Cancel()
                    end
                    repeat task.wait()
                        lp.Character.HumanoidRootPart.CFrame = is  
                    until lp.Character.PrimaryPart.CFrame == is   
                    task.wait(0.1)
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetSpawnPoint")
                else
                    if not stopbypass then
                        if tween then
                           tween:Cancel()
                        end
                        repeat task.wait()
                            lp.Character.HumanoidRootPart.CFrame = is  
                        until lp.Character.PrimaryPart.CFrame == is  
                        game:GetService("Players").LocalPlayer.Character:WaitForChild("Humanoid"):ChangeState(15)
                        lp.Character:SetPrimaryPartCFrame(is)
                        wait()
                        lp.Character.Head:Destroy()
                        wait()
                        repeat task.wait()
                            lp.Character.PrimaryPart.CFrame = is  
                        until lp.Character:FindFirstChild("Humanoid").Health > 0
                        task.wait()
                    end 
                end
            end
        end
    end
end
function to(Pos)
    pcall(function()
        if lp.Character:FindFirstChild("HumanoidRootPart") and lp.Character:FindFirstChild("Humanoid").Health > 0 then
                Distance = (Pos.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
                if not game.Players.LocalPlayer.Character.PrimaryPart:FindFirstChild("Hold") then
                    local Hold = Instance.new("BodyVelocity", game.Players.LocalPlayer.Character.PrimaryPart)
                    Hold.Name = "Hold"
                    Hold.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
                    Hold.Velocity = Vector3.new(0, 0, 0)
                end
                if game.Players.LocalPlayer.Character.Humanoid.Sit == true then
                    game.Players.LocalPlayer.Character.Humanoid.Sit = false
                end
                if Distance < 250 then
                    Speed = 400
                elseif Distance < 1000 then
                    Speed = 375
                elseif Distance >= 1000 then
                    Speed = 350
                end
                pcall(function()
                    tween = game:GetService("TweenService"):Create(game.Players.LocalPlayer.Character.HumanoidRootPart,TweenInfo.new(Distance / Speed, Enum.EasingStyle.Linear),{CFrame = Pos})
                    tween:Play()
                end)
                if game:GetService("Players").LocalPlayer.PlayerGui.Main.InCombat.Visible then
                    if not string.find(string.lower(game:GetService("Players").LocalPlayer.PlayerGui.Main.InCombat.Text), "risk") then
                        bypass(Pos)
                    else
                        dist = math.huge
                        is = nil
                        for i , v in pairs(island) do
                            if (Pos.Position-v.Position).magnitude < dist then
                                is = v 
                                dist = (Pos.Position-v.Position).magnitude 
                            end
                        end 
                        if is == nil then return; end
                        if lp:DistanceFromCharacter(Pos.Position) > distbyp then 
                            if (lp.Character.Head.Position-Pos.Position).magnitude > (is.Position-Pos.Position).magnitude then
                                if tween then
                                    tween:Destroy()
                                end
                                if (is.X == 61163.8515625 and is.Y ==11.6796875 and is.Z == 1819.7841796875) or is == CFrame.new(-12471.169921875, 374.94024658203, -7551.677734375) or is == CFrame.new(-5085.23681640625, 316.5072021484375, -3156.202880859375) or is == CFrame.new(5749.7861328125, 611.9736938476562, -276.2497863769531) then
                                    if tween then
                                       tween:Cancel()
                                    end
                                    repeat task.wait()
                                        lp.Character.HumanoidRootPart.CFrame = is  
                                    until lp.Character.PrimaryPart.CFrame == is   
                                    task.wait(0.1)
                                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetSpawnPoint")
                                end
                            end
                        end
                    end
                else
                    bypass(Pos)
                end
                if game.Players.LocalPlayer.Character.Humanoid.Sit == true then
                    game.Players.LocalPlayer.Character.Humanoid.Sit = false
                end
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.X, Pos.Y, game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Z)
        end
    end)
end
--- Buso ---
function buso()
    if (not (game.Players.LocalPlayer.Character:FindFirstChild("HasBuso"))) then
        local rel = game.ReplicatedStorage
        rel.Remotes.CommF_:InvokeServer("Buso")
    end
end
--- Ken ---
function Ken()
    if game:GetService("Players").LocalPlayer:FindFirstChild("PlayerGui") and game.Players.LocalPlayer.PlayerGui:FindFirstChild("ScreenGui") and game.Players.LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel") then
        buoi = true
    else
        game:service("VirtualUser"):CaptureController()
        game:service("VirtualUser"):SetKeyDown("0x65")
        game:service("VirtualUser"):SetKeyUp("0x65")
    end
end
--- Sent Key To Cilent ---
function down(use)
    pcall(function()
        game:GetService("VirtualInputManager"):SendKeyEvent(true,use,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
        task.wait()
        game:GetService("VirtualInputManager"):SendKeyEvent(false,use,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
    end)
end
--- Equip ---
function equip(tooltip)
    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:wait()
    for _, item in pairs(player.Backpack:GetChildren()) do
        if item:IsA("Tool") and item.ToolTip == tooltip then
            local humanoid = character:FindFirstChildOfClass("Humanoid")
            if humanoid and not humanoid:IsDescendantOf(item) then
                game.Players.LocalPlayer.Character.Humanoid:EquipTool(item)
                return true
            end
        end
    end
    return false
end
function EquipWeapon(Tool)
    pcall(
        function()
            if game.Players.LocalPlayer.Backpack:FindFirstChild(Tool) then
                local ToolHumanoid = game.Players.LocalPlayer.Backpack:FindFirstChild(Tool)
                ToolHumanoid.Parent = game.Players.LocalPlayer.Character
            end
        end
    )
end
--- Click ---
function Click()
    game:GetService("VirtualUser"):CaptureController()
    game:GetService("VirtualUser"):Button1Down(Vector2.new(0,1,0,1))
end
--- No Clip ---
spawn(function()
    while game:GetService("RunService").Stepped:wait() do
        pcall(function()
            if true then
                local character = game.Players.LocalPlayer.Character
                for _, v in pairs(character:GetChildren()) do
                    if v:IsA("BasePart") then
                        v.CanCollide = false
                    end
                end
            end
        end)
    end
end)
--- Boots FPS ---
if getgenv().Setting.Another.FPSBoots then
    local removedecals = false
    local g = game
    local w = g.Workspace
    local l = g.Lighting
    local t = w.Terrain
    t.WaterWaveSize = 0
    t.WaterWaveSpeed = 0
    t.WaterReflectance = 0
    t.WaterTransparency = 0
    l.GlobalShadows = false
    l.FogEnd = 9e9
    l.Brightness = 0
    settings().Rendering.QualityLevel = "Level01"
    for i, v in pairs(g:GetDescendants()) do
        if v:IsA("Part") or v:IsA("Union") or v:IsA("CornerWedgePart") or v:IsA("TrussPart") then
            v.Material = "Plastic"
            v.Reflectance = 0
        elseif v:IsA("Decal") or v:IsA("Texture") and removedecals then
            v.Transparency = 1
        elseif v:IsA("ParticleEmitter") or v:IsA("Trail") then
            v.Lifetime = NumberRange.new(0)
        elseif v:IsA("Explosion") then
            v.BlastPressure = 1
            v.BlastRadius = 1
        elseif v:IsA("Fire") or v:IsA("SpotLight") or v:IsA("Smoke") or v:IsA("Sparkles") then
            v.Enabled = false
        elseif v:IsA("MeshPart") then
            v.Material = "Plastic"
            v.Reflectance = 0
            v.TextureID = 10385902758728957
        end
    end
    for i, e in pairs(l:GetChildren()) do
        if e:IsA("BlurEffect") or e:IsA("SunRaysEffect") or e:IsA("ColorCorrectionEffect") or e:IsA("BloomEffect") or e:IsA("DepthOfFieldEffect") then
            e.Enabled = false
        end
    end
    end
    
    function ObjectRemvoe()
        for i,v in pairs(workspace:GetDescendants()) do
            if string.find(v.Name,"Tree") or string.find(v.Name,"House") then
                v:Destroy()
            end
        end
    end
    
    function InvisibleObject()
    for i,v in pairs(game:GetService("Workspace"):GetDescendants()) do
        if  (v:IsA("Part") or v:IsA("MeshPart") or v:IsA("BasePart")) and v.Transparency then
            v.Transparency = 1
        end
    end
    spawn(function()
        pcall(function()
            game.ReplicatedStorage.Effect.Container.Death:Destroy()
            game.ReplicatedStorage.Effect.Container.Respawn:Destroy()
            game.ReplicatedStorage.Effect.Container.Hit:Destroy()
        end)
    end)
    ObjectRemvoe()
    InvisibleObject()
end
--- White Screen ---
if getgenv().Setting.Another.WhiteScreen then
    game.RunService:Set3dRenderingEnabled(false)
end
--Random-Store
if getgenv().Setting.Another.RandomAndStore then
    spawn(function()
      pcall(function()
        while wait() do
          game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Cousin", "Buy")
          wait()
          local function Get_Fruit(Fruit)
            if Fruit == "Rocket Fruit" then
              return "Rocket-Rocket"
            elseif Fruit == "Spin Fruit" then
              return "Spin-Spin"
            elseif Fruit == "Chop Fruit" then
              return "Chop-Chop"
            elseif Fruit == "Spring Fruit" then
              return "Spring-Spring"
            elseif Fruit == "Bomb Fruit" then
              return "Bomb-Bomb"
            elseif Fruit == "Smoke Fruit" then
              return "Smoke-Smoke"
            elseif Fruit == "Spike Fruit" then
              return "Spike-Spike"
            elseif Fruit == "Flame Fruit" then
              return "Flame-Flame"
            elseif Fruit == "Falcon Fruit" then
              return "Falcon-Falcon"
            elseif Fruit == "Ice Fruit" then
              return "Ice-Ice"
            elseif Fruit == "Sand Fruit" then
              return "Sand-Sand"
            elseif Fruit == "Dark Fruit" then
              return "Dark-Dark"
            elseif Fruit == "Ghost Fruit" then
              return "Ghost-Ghost"
            elseif Fruit == "Diamond Fruit" then
              return "Diamond-Diamond"
            elseif Fruit == "Light Fruit" then
              return "Light-Light"
            elseif Fruit == "Rubber Fruit" then
              return "Rubber-Rubber"
            elseif Fruit == "Barrier Fruit" then
              return "Barrier-Barrier"
            elseif Fruit == "Magma Fruit" then
              return "Magma-Magma"
            elseif Fruit == "Quake Fruit" then
              return "Quake-Quake"
            elseif Fruit == "Buddha Fruit" then
              return "Buddha-Buddha"
            elseif Fruit == "Love Fruit" then
              return "Love-Love"
            elseif Fruit == "Spider Fruit" then
              return "Spider-Spider"
            elseif Fruit == "Sound Fruit" then
              return "Sound-Sound"
            elseif Fruit == "Phoenix Fruit" then
              return "Phoenix-Phoenix"
            elseif Fruit == "Portal Fruit" then
              return "Portal-Portal"
            elseif Fruit == "Rumble Fruit" then
              return "Rumble-Rumble"
            elseif Fruit == "Pain Fruit" then
              return "Pain-Pain"
            elseif Fruit == "Blizzard Fruit" then
              return "Blizzard-Blizzard"
            elseif Fruit == "Gravity Fruit" then
              return "Gravity-Gravity"
            elseif Fruit == "Mammoth Fruit" then
              return "Mammoth-Mammoth"
            elseif Fruit == "T-Rex Fruit" then
              return "T-Rex-T-Rex"
            elseif Fruit == "Dough Fruit" then
              return "Dough-Dough"
            elseif Fruit == "Shadow Fruit" then
              return "Shadow-Shadow"
            elseif Fruit == "Venom Fruit" then
              return "Venom-Venom"
            elseif Fruit == "Control Fruit" then
              return "Control-Control"
            elseif Fruit == "Spirit Fruit" then
              return "Spirit-Spirit"
            elseif Fruit == "Dragon Fruit" then
              return "Dragon-Dragon"
            elseif Fruit == "Leopard Fruit" then
              return "Leopard-Leopard"
            elseif Fruit == "Kitsune Fruit" then
              return "Kitsune-Kitsune"
            end
          end
  
          local Players = game:GetService("Players")
          local Player = Players.LocalPlayer
  
          task.spawn(function()
            while wait() do
              pcall(function()
                local plrBag = Player.Backpack
                local plrChar = Player.Character
                for _, Fruit in pairs(plrChar:GetChildren()) do
                  if Fruit:IsA("Tool") and Fruit:FindFirstChild("Fruit") then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", Get_Fruit(Fruit.Name), Fruit)
                  end
                end
                for _, Fruit in pairs(plrBag:GetChildren()) do
                  if Fruit:IsA("Tool") and Fruit:FindFirstChild("Fruit") then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", Get_Fruit(Fruit.Name), Fruit)
                  end
                end
              end)
            end
          end)
        end
      end)
    end)
  end  
--- Check Fruit
function hasValue(array, targetString)
    for _, value in ipairs(array) do
        if value == targetString then
            return true
        end
    end
    return false
end

--- Fast Attack
if getgenv().Setting.Click.FastClick then
    local CameraShaker = require(game.ReplicatedStorage.Util.CameraShaker)
    CameraShaker:Stop()
    fastattack = true
    CombatFrameworkR = require(game:GetService("Players").LocalPlayer.PlayerScripts.CombatFramework)
    y = debug.getupvalues(CombatFrameworkR)[2]
    spawn(function()
        game:GetService("RunService").RenderStepped:Connect(function()
            if fastattack then
                if typeof(y) == "table" then
                    pcall(function()
                        y.activeController.timeToNextAttack = 0
                        y.activeController.hitboxMagnitude = 60
                        y.activeController.active = false
                        y.activeController.timeToNextBlock = 0
                        y.activeController.focusStart = 1655503339.0980349
                        y.activeController.increment = 1
                        y.activeController.blocking = false
                        y.activeController.attacking = false
                        y.activeController.humanoid.AutoRotate = true
                    end)
                end
            end
        end)
    end)
    spawn(function()
        game:GetService("RunService").RenderStepped:Connect(function()
            if fastattack == true then
                if game.Players.LocalPlayer.Character:FindFirstChild("Stun") then
                    game.Players.LocalPlayer.Character.Stun.Value = 0
                    game.Players.LocalPlayer.Character.Busy.Value = false 
                end
            end
        end)
    end)
else
    CombatFrameworkR = require(game:GetService("Players").LocalPlayer.PlayerScripts.CombatFramework)
    y = debug.getupvalues(CombatFrameworkR)[2]
    spawn(function()
        game:GetService("RunService").RenderStepped:Connect(function()
            if typeof(y) == "table" then
                pcall(function()
                    y.activeController.hitboxMagnitude = 60
                    y.activeController.active = false
                    y.activeController.timeToNextBlock = 0
                    y.activeController.focusStart = 1655503339.0980349
                    y.activeController.increment = 1
                    y.activeController.blocking = false
                    y.activeController.attacking = false
                    y.activeController.humanoid.AutoRotate = true
                end)
            end
        end)
    end)
end

--- Hop Server ---
spawn(function()
    while task.wait() do
        if hopserver then
            stopbypass = true
            starthop = true
        end
    end
end)
spawn(function()
    while task.wait() do
        if starthop and getgenv().targ == nil then
            repeat task.wait()
            to(lp.Character.HumanoidRootPart.CFrame*CFrame.new(0,math.random(500,10000),0))
            until (game:GetService("Players").LocalPlayer.PlayerGui.Main.InCombat.Visible and not string.find(string.lower(game:GetService("Players").LocalPlayer.PlayerGui.Main.InCombat.Text), "risk")) or (not game:GetService("Players").LocalPlayer.PlayerGui.Main.InCombat.Visible)
            to(CFrame.new(0,10000,0))
            HopServer()
            to(lp.Character.HumanoidRootPart.CFrame*CFrame.new(0,math.random(500,10000),0))
        end
    end
end)
function HopServer(bO)
    pcall(function()
        if not bO then
            bO = 10
        end
        ticklon = tick()
        repeat
            task.wait()
        until tick() - ticklon >= 1
        local function Hop()
            for r = 1, math.huge do
                if ChooseRegion == nil or ChooseRegion == "" then
                    ChooseRegion = "Singapore"
                else
                    game:GetService("Players").LocalPlayer.PlayerGui.ServerBrowser.Frame.Filters.SearchRegion.TextBox.Text =
                        ChooseRegion
                end
                local bP = game:GetService("ReplicatedStorage").__ServerBrowser:InvokeServer(r)
                for k, v in pairs(bP) do
                    if k ~= game.JobId and v["Count"] < bO then
                    game:GetService("ReplicatedStorage").__ServerBrowser:InvokeServer("teleport", k)
                    end
                end
            end
            return false
        end
        if not getgenv().Loaded then
            local function bQ(v)
                if v.Name == "ErrorPrompt" then
                    if v.Visible then
                        if v.TitleFrame.ErrorTitle.Text == "Teleport Failed" then
                            HopServer()
                            v.Visible = false
                        end
                    end
                    v:GetPropertyChangedSignal("Visible"):Connect(
                        function()
                            if v.Visible then
                                if v.TitleFrame.ErrorTitle.Text == "Teleport Failed" then
                                    HopServer()
                                    v.Visible = false
                                end
                            end
                        end
                    )
                end
            end
            for k, v in pairs(game.CoreGui.RobloxPromptGui.promptOverlay:GetChildren()) do
                bQ(v)
            end
            game.CoreGui.RobloxPromptGui.promptOverlay.ChildAdded:Connect(bQ)
            getgenv().Loaded = true
        end
        while not Hop() do
            wait()
        end
    end)
end
--- Skip Player
function SkipPlayer()
    getgenv().killed = getgenv().targ 
    table.insert(getgenv().checked, getgenv().targ)
    getgenv().targ = nil
    target()
end
print("Ring2", SkipPlayer())
print("Ring3", target())
--Invisible
if getgenv().Setting.StartHunting.Invisible then
    function Module.Invisible(bool)
        local function CheckRig()
            if Client.Character then
                local Humanoid = Client.Character:WaitForChild("Humanoid")
                if Humanoid.RigType == Enum.HumanoidRigType.R15 then
                    return "R15"
                else
                    return "R6"
                end
            end
        end
        
        local function InitiateInvis()
            local StoredCF = Client.Character.PrimaryPart.CFrame
            
            if CheckRig() == "R6" then
                Client.Character.HumanoidRootPart:Destroy()
            else
                Client.Character.LowerTorso.Root:Destroy()
            end
        end
        
        local function MakeInvisible()
            if Client.Character:WaitForChild("Humanoid").Health == 0 then
                repeat wait() until Client.Character:WaitForChild("Humanoid").Health > 0
                wait(0.2)
            end
            
            if Client.Character:FindFirstChild("CharacterReady") then
                Client.Character.CharacterReady:Destroy()
                Client.Character.HumanoidRootPart.InfoBBG.Frame:Destroy()
            end
            
            if Client.Character.UpperTorso:FindFirstChild("BuddhaBillboard") then
                Client.Character.UpperTorso.BuddhaBillboard:Destroy()
            end
            
            local cframeOld = Client.Character.HumanoidRootPart.CFrame
            Client.Character.HumanoidRootPart.CFrame = Client.Character.HumanoidRootPart.CFrame * CFrame.new(0, 10000000, 0)
            wait(0.65)
            InitiateInvis()
            Client.Character:SetPrimaryPartCFrame(cframeOld)
        end
        
        if bool then
            MakeInvisible()
        end
    end
end
--- Main
function target() 
    pcall(function()
        d = math.huge
        p = nil
        getgenv().targ = nil
        for i, v in pairs(game.Players:GetPlayers()) do 
            if v.Team ~= nil and (tostring(lp.Team) == "Pirates" or (tostring(v.Team) == "Pirates" and tostring(lp.Team) ~= "Pirates")) then
                if v and v:FindFirstChild("Data") and ((getgenv().Setting.Skip.Fruit and hasValue(getgenv().Setting.Skip.FruitList, v.Data.DevilFruit.Value) == false) or not getgenv().Setting.Skip.Fruit) then
                    if v ~= lp and v ~= getgenv().targ and (v.Character:FindFirstChild("HumanoidRootPart").CFrame.Position - game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").CFrame.Position).Magnitude < d and hasValue(getgenv().checked, v) == false and v.Character.HumanoidRootPart.CFrame.Y <= 12000 then
                        if (tonumber(game.Players.LocalPlayer.Data.Level.Value) - 250) < v.Data.Level.Value  then
                                if (getgenv().Setting.Skip.RaceV4 and not v.Character:FindFirstChild("RaceTransformed")) or not getgenv().Setting.Skip.RaceV4 then
                                    p = v
                                    d = (v.Character.HumanoidRootPart.CFrame.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Position).Magnitude
                                    if game:GetService("Players").LocalPlayer.PlayerGui.Main.SafeZone.Visible or not game:GetService("Players").LocalPlayer.PlayerGui.Main.PvpMode.Visible then
                                        SkipPlayer()
                                    end                
                                    if getgenv().Setting.Chat.Enabled then
                                        game:GetService("ReplicatedStorage"):WaitForChild("DefaultChatSystemChatEvents"):FindFirstChild("SayMessageRequest"):FireServer(getgenv().Setting.Chat.Messenger[math.random(0, #getgenv().Setting.Chat.Messenger)], "All")
                                        end                                   
                                    end
                                end
                            end                             
                        end
                    end
                end
            end)
        if p == nil then hopserver = true end 
        getgenv().targ = p
        print("Ring1",p)
    end
spawn(function()
    while wait() do
        pcall(function()
            if (getgenv().targ.Character.HumanoidRootPart.CFrame.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Position).Magnitude < 40 then
                Ken()
            end
        end)
    end
end)
--Weapon
gunmethod = getgenv().Setting.Gun.GunMode
local melee, gun, sword, fruit
spawn(function()
    while task.wait() do
        pcall(function()
            if getgenv().targ.Character:FindFirstChild("HumanoidRootPart") and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                if (getgenv().targ.Character:WaitForChild("HumanoidRootPart").CFrame.Position - game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame.Position).Magnitude < 40 then 
                    if not gunmethod then
                        if getgenv().Setting.Melee.Enable then
                            getgenv().weapon = "Melee"
                            wait(getgenv().Setting.Melee.Delay)
                        end
                        if getgenv().Setting.Fruit.Enable then
                            getgenv().weapon = "Blox Fruit"
                            wait(getgenv().Setting.Fruit.Delay)
                        end
                        if getgenv().Setting.Sword.Enable then
                            getgenv().weapon = "Sword"
                            wait(getgenv().Setting.Sword.Delay)
                        end
                        if getgenv().Setting.Gun.Enable then
                            getgenv().weapon = "Gun"
                            wait(getgenv().Setting.Gun.Delay)
                        end
                    else
                        EquipWeapon("Melee")
                        EquipWeapon("Gun")
                    end
                end
            end
        end)
    end
end)

spawn(function()
    while task.wait() do 
        pcall(function()
            if game:GetService("Players").LocalPlayer.PlayerGui.Main.PvpDisabled.Visible == true then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("EnablePvp")
            end
            if getgenv().targ ~= nil and getgenv().targ.Character and (getgenv().targ.Character.HumanoidRootPart.CFrame.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Position).Magnitude < 50 then
                buso()
                if getgenv().Setting.Another.RaceV3 then
                    if target() then
                    l = 0.1
                    down("T")
                    end
                end
                if getgenv().Setting.Another.RaceV4 then
                    l = 0.1
                    down("Y")
                end   
            end
        end)
    end
end)
spawn(function()
    while task.wait() do
        if getgenv().targ == nil or not getgenv().targ or not getgenv().targ.Character then target() end
        if getgenv().targ == nil then hopserver = true end 
        pcall(function()
            if getgenv().targ.Character:FindFirstChild("HumanoidRootPart") and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                if (getgenv().targ.Character:WaitForChild("HumanoidRootPart").CFrame.Position - game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame.Position).Magnitude < 40 then 
                    spawn(function()
                        if not gunmethod then
                            EquipWeapon("Summon Sea Beast")
                            equip(getgenv().weapon)
                            for i, v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do 
                                if v:IsA("Tool") and v.ToolTip == "Melee" then
                                    if getgenv().Setting.Melee.Enable then
                                        if game.Players.LocalPlayer.PlayerGui.Main.Skills[v.Name]:FindFirstChild("Z").Cooldown.AbsoluteSize.X <= 0 and getgenv().Setting.Melee.Z.Enable then	
                                            l = getgenv().Setting.Melee.Z.HoldTime
                                            down("Z")
                                        elseif game.Players.LocalPlayer.PlayerGui.Main.Skills[v.Name]:FindFirstChild("X").Cooldown.AbsoluteSize.X <= 0 and getgenv().Setting.Melee.X.Enable then	
                                            l = getgenv().Setting.Melee.X.HoldTime
                                            down("X")
                                        elseif game.Players.LocalPlayer.PlayerGui.Main.Skills[v.Name]:FindFirstChild("C").Cooldown.AbsoluteSize.X <= 0 and getgenv().Setting.Melee.C.Enable then	
                                            l = getgenv().Setting.Melee.C.HoldTime
                                            down("C")
                                        else
                                            Click()
                                        end
                                    end
                                elseif v:IsA("Tool") and v.ToolTip == "Gun" then
                                    if getgenv().Setting.Gun.Enable then
                                        if game.Players.LocalPlayer.PlayerGui.Main.Skills[v.Name]:FindFirstChild("Z").Cooldown.AbsoluteSize.X <= 0 and getgenv().Setting.Gun.Z.Enable then	
                                            l = getgenv().Setting.Gun.Z.HoldTime
                                            down("Z")
                                        elseif game.Players.LocalPlayer.PlayerGui.Main.Skills[v.Name]:FindFirstChild("X").Cooldown.AbsoluteSize.X <= 0 and getgenv().Setting.Gun.X.Enable then	
                                            l = getgenv().Setting.Gun.X.HoldTime
                                            down("X")
                                        else
                                            Click()
                                        end
                                    end
                                elseif v:IsA("Tool") and v.ToolTip == "Sword" then
                                    if getgenv().Setting.Sword.Enable then
                                        if game.Players.LocalPlayer.PlayerGui.Main.Skills[v.Name]:FindFirstChild("Z").Cooldown.AbsoluteSize.X <= 0 and getgenv().Setting.Sword.Z.Enable then	
                                            l = getgenv().Setting.Sword.Z.HoldTime
                                            down("Z")
                                        elseif game.Players.LocalPlayer.PlayerGui.Main.Skills[v.Name]:FindFirstChild("X").Cooldown.AbsoluteSize.X <= 0 and getgenv().Setting.Sword.X.Enable then	
                                            l = getgenv().Setting.Sword.X.HoldTime
                                            down("X")
                                        else
                                            Click()
                                        end
                                    end
                                elseif v:IsA("Tool") and v.ToolTip == "Blox Fruit" then
                                    if getgenv().Setting.Fruit.Enable then
                                        if game.Players.LocalPlayer.PlayerGui.Main.Skills[v.Name]:FindFirstChild("Z").Cooldown.AbsoluteSize.X <= 0 and getgenv().Setting.Fruit.Z.Enable then	
                                            l = getgenv().Setting.Fruit.Z.HoldTime
                                            down("Z")
                                        elseif game.Players.LocalPlayer.PlayerGui.Main.Skills[v.Name]:FindFirstChild("X").Cooldown.AbsoluteSize.X <= 0 and getgenv().Setting.Fruit.X.Enable then	
                                            l = getgenv().Setting.Fruit.X.HoldTime
                                            down("X")
                                        elseif game.Players.LocalPlayer.PlayerGui.Main.Skills[v.Name]:FindFirstChild("C").Cooldown.AbsoluteSize.X <= 0 and getgenv().Setting.Fruit.C.Enable then	
                                            l = getgenv().Setting.Fruit.C.HoldTime
                                            down("C")
                                        elseif game.Players.LocalPlayer.PlayerGui.Main.Skills[v.Name]:FindFirstChild("V").Cooldown.AbsoluteSize.X <= 0 and getgenv().Setting.Fruit.V.Enable then	
                                            l = getgenv().Setting.Fruit.V.HoldTime
                                            down("V")
                                        elseif getgenv().Setting.Fruit.F.Enable then
                                            if game.Players.LocalPlayer.PlayerGui.Main.Skills[v.Name]:FindFirstChild("F").Cooldown.AbsoluteSize.X <= 0 then	
                                                l = getgenv().Setting.Fruit.F.HoldTime
                                                down("F")
                                            end
                                        else
                                            Click()
                                        end
                                    end
                                end
                            end
                        else
                            if getgenv().Setting.Melee.Enable then
                                if getgenv().Setting.Melee.Z.Enable then	
                                    l = getgenv().Setting.Melee.Z.HoldTime
                                    down("Z")
                                elseif  getgenv().Setting.Melee.X.Enable then	
                                    l = getgenv().Setting.Melee.X.HoldTime
                                    down("X")
                                elseif getgenv().Setting.Melee.C.Enable then	
                                    l = getgenv().Setting.Melee.C.HoldTime
                                    down("C")
                                end
                            end
                            Click()
                        end
                        for i, v in pairs(game.Players.LocalPlayer.PlayerGui.Notifications:GetChildren()) do 
                            local gay = v:GetChildren() 
                            if v:IsA("TextLabel") and (string.find(string.lower(v.Text), "player") or string.find(string.lower(v.Text), "người chơi")) then 
                                SkipPlayer()
                                v:Destroy()
                            end
                        end
                    end)
                end
            end
        end)
    end
end)
local a,b
local Nguvc = 5
spawn(function()
    while task.wait(0.05) do
        if getgenv().targ == nil then target() end
        if getgenv().targ == nil then hopserver = true end 
        pcall(function()
            if getgenv().targ.Character:FindFirstChild("HumanoidRootPart") and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                if game.Players.LocalPlayer.Character:FindFirstChild("Humanoid").Health > getgenv().Setting.StartHunting.SafeHealth then
                    pcall(function()    
                        if not (game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 1") and getgenv().targ:DistanceFromCharacter(game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 1").Position) < 10000) then
                            if (getgenv().targ.Character:WaitForChild("HumanoidRootPart").CFrame.Position - game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame.Position).Magnitude < 40 then 
                                if getgenv().targ.Character.Humanoid.Health > 0 then
                                    if getgenv().Setting.Click.AlwaysClick then
                                        Click()
                                    end
                                    if helloae then
                                        nguvl = CFrame.new(getgenv().targ.Character.HumanoidRootPart.Position + getgenv().targ.Character.HumanoidRootPart.CFrame.LookVector * Nguvc, getgenv().targ.Character.HumanoidRootPart.Position)*CFrame.new(0,yTween,0)
                                        to(nguvl*CFrame.new(getgenv().targ.Character.HumanoidRootPart.Position.Unit))
                                    else
                                        nguvl = CFrame.new(getgenv().targ.Character.HumanoidRootPart.Position + getgenv().targ.Character.HumanoidRootPart.CFrame.LookVector * 5, getgenv().targ.Character.HumanoidRootPart.Position)*CFrame.new(0,5,0)
                                        to(nguvl)
                                    end
                                else 
                                    SkipPlayer()
                                end
                            else
                                if getgenv().targ.Character.Humanoid.Health > 0 then
                                    to(getgenv().targ.Character.HumanoidRootPart.CFrame*CFrame.new(0,10,0))
                                else
                                    SkipPlayer()
                                end
                            end
                        else
                            SkipPlayer()
                    end
                end)
                    a = getgenv().targ.Character.HumanoidRootPart.Position
                    if a ~= b then
                        yTween = 0
                        b = a
                        if (getgenv().Setting.Gun.Enable and getgenv().Setting.Gun.GunMode) then
                            Nguvc = 14
                        else
                            Nguvc = 15
                        end
                    else
                        yTween = 5
                        if (getgenv().Setting.Gun.Enable and getgenv().Setting.Gun.GunMode) then
                            Nguvc = 3
                        else
                            Nguvc = 5
                        end
                    end
                    if getgenv().targ.Character.HumanoidRootPart.CFrame.Y >= 10 then
                        helloae = true
                    else
                        helloae = false
                    end
                else
                    safehealth = true
                    to(getgenv().targ.Character.HumanoidRootPart.CFrame*CFrame.new(0,math.random(5000,100000),0))
                end
            end
        end)
    end
end)
--- Aim
spawn(function()
    while task.wait() do 
        if getgenv().targ ~= nil and (getgenv().targ.Character:WaitForChild("HumanoidRootPart").CFrame.Position - game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame.Position).Magnitude < 40 then 
            aim = true 
            if (getgenv().Setting.Gun.Enable and getgenv().Setting.Gun.GunMode) then
                CFrameHunt = CFrame.new(getgenv().targ.Character.HumanoidRootPart.Position + getgenv().targ.Character.HumanoidRootPart.CFrame.LookVector * 2, getgenv().targ.Character.HumanoidRootPart.Position)
            else
                CFrameHunt = CFrame.new(getgenv().targ.Character.HumanoidRootPart.Position + getgenv().targ.Character.HumanoidRootPart.CFrame.LookVector * 5, getgenv().targ.Character.HumanoidRootPart.Position)
            end
        else
            aim = false
        end
    end
end)
spawn(function()
    local gg = getrawmetatable(game)
    local old = gg.__namecall
    setreadonly(gg,false)
    gg.__namecall = newcclosure(function(...)
        local method = getnamecallmethod()
        local args = {...}
        if tostring(method) == "FireServer" then
            if tostring(args[1]) == "RemoteEvent" then
                if tostring(args[2]) ~= "true" and tostring(args[2]) ~= "false" then
                    if aim then
                        args[2] = CFrameHunt.Position
                        return old(unpack(args))
                    end
                end
            end
        end
        return old(...)
    end)
end)
local Mouse = lp:GetMouse()
Mouse.Button1Down:Connect(function()
    pcall(function()
        if getgenv().targ ~= nil and aim then
            local args = {
                 [1] = CFrameHunt.Position,
                 [2] = getgenv().targ.Character.HumanoidRootPart
               }
             game:GetService("Players").LocalPlayer.Character[game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool").Name].RemoteFunctionShoot:InvokeServer(unpack(args))
         end
    end)
end)
spawn(function()
    while task.wait() do
        if getgenv().Setting.Another.LockCamera then
            local targetPlayer = getgenv().targ
            if targetPlayer ~= nil then
                local targetCharacter = targetPlayer.Character
                local camera = game.Workspace.CurrentCamera
                if targetCharacter then
                    local lookAtPos = targetCharacter.HumanoidRootPart.Position
                    local cameraPos = camera.CFrame.Position
                    local newLookAt = CFrame.new(cameraPos, lookAtPos)
                    camera.CFrame = newLookAt
                end
            end
        end
    end
end)
--  Rejoin
game:GetService("CoreGui").RobloxPromptGui.promptOverlay.ChildAdded:Connect(function(child)
    if not hopserver and child.Name == 'ErrorPrompt' and child:FindFirstChild('MessageArea') and child.MessageArea:FindFirstChild("ErrorFrame") then
        print("Orange Hub Auto Bounty | Rejoin!")
        game:GetService("TeleportService"):Teleport(game.PlaceId)
    end
end)
-- Webhook
function format(number)
    local i, j, minus, int, fraction = tostring(number):find('([-]?)(%d+)([.]?%d*)')
    int = int:reverse():gsub("(%d%d%d)", "%1,")
    return minus .. int:reverse():gsub("^,", "") .. fraction
end
function wEarn(targ, earn)
    if getgenv().Setting.Webhook.Enabled then
        local data = {
            ["content"] = "",
            ["embeds"] = {
                {
                    ["title"] = "**Orange Hub | Auto Bounty**",
                    ["color"] = tonumber(0x00BFFF),
                    ["fields"] = {
                        {
                            ["name"] = "Account: ",
                            ["value"] = "||"..game.Players.LocalPlayer.Name.."||",
                            ["inline"] = true,
                        },
                        {
                            ["name"] = "Target: ",
                            ["value"] = "```"..targ.Name.."```",
                            ["inline"] = true,
                        },
                        {
                            ["name"] = "Target2: ",
                            ["value"] = "```"..v.Name.."```",
                            ["inline"] = true,
                        },
                        {
                            ["name"] = "Bounty Earned: ",
                            ["value"] = "```"..format(earn).."```",
                            ["inline"] = true,
                        },
                        {
                            ["name"] = "Current Bounty: ",
                            ["value"] = "```"..tostring(game.Players.LocalPlayer.leaderstats["Bounty/Honor"].Value):reverse():gsub("%d%d%d", "%1,"):reverse():gsub("^,", "").."```",
                            ["inline"] = true,
                        }
                    },
                    ["thumbnail"] = {
                        ["url"] = getgenv().Setting.Webhook.ThumbnailURL,
                    },
                    ["footer"] = {
                        ["text"] = "Orange Hub | discord.gg/F9qZnHuAGU",
                    },
                    ["timestamp"] = os.date("!%Y-%m-%dT%H:%M:%SZ"),
                }
            }
        }
        local jsonData = game:GetService("HttpService"):JSONEncode(data)
        local headers = {["content-type"] = "application/json"}
        local sendHook = {Url = getgenv().Setting.Webhook.Url, Body = jsonData, Method = "POST", Headers = headers}
        local ew = http_request or request or HttpPost or syn.request
        ew(sendHook)
    end
end

spawn(function()
    while wait() do
        if (getgenv().bounty ~= nil and game.Players.LocalPlayer.leaderstats["Bounty/Honor"].Value ~= getgenv().bounty) then
            if (game.Players.LocalPlayer.leaderstats["Bounty/Honor"].Value - getgenv().bounty) > 0 then
                wEarn(getgenv().targ, (game.Players.LocalPlayer.leaderstats["Bounty/Honor"].Value - getgenv().bounty))
            end
        end
    end
end)
--- Load & Save Setting
local foldername = "Orange_Hub_Auto_Bounty"
local filename = foldername.."/bounty.json"
function saveSettings()
    local HttpService = game:GetService("HttpService")
    local json = HttpService:JSONEncode(_G)
    if true then
        if isfolder(foldername) then
            if isfile(filename) then
                writefile(filename, json)
            else
                writefile(filename, json)
            end
        else
            makefolder(foldername)
            writefile(filename, json)
        end
    end
end
function loadSettings()
    local HttpService = game:GetService("HttpService")
    if isfolder(foldername) then
        if isfile(filename) then
            _G = HttpService:JSONDecode(readfile(filename))
        end
    end
end
-- Skip player UI
local player = game.Players.LocalPlayer
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = player.PlayerGui

local frame = Instance.new("Frame")
frame.Parent = screenGui
frame.Size = UDim2.new(0, 100, 0, 30) 
frame.Position = UDim2.new(0, 10, 0.5, -50) 
frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255) 

local button = Instance.new("TextButton")
button.BorderColor3 = Color3.fromRGB(0, 0, 0) 
button.BorderSizePixel = 3
button.Parent = frame
button.Size = UDim2.new(1, -6, 1, -6)
button.Position = UDim2.new(0, 3, 0, 3)
button.TextSize = 17
button.Font = Enum.Font.Michroma
button.Text = "Skip Player"
button.TextColor3 = Color3.fromRGB(0, 0, 0)
button.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
button.MouseButton1Click:Connect(function()
	pcall(function()
		SkipPlayer()
	end)
end)
--CoppyRight
while true do
    local Notification = require(game:GetService("ReplicatedStorage").Notification)
    Notification.new("<Color=Orange> Orange Hub Auto Bounty <Color=/>"):Display()
    Notification.new("<Color=Blue> Discord: https://discord.gg/F9qZnHuAGU <Color=/>"):Display()
    wait(45)
end
