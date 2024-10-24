getgenv().Setting = {
    ["Team"] = "Pirates",
    ["Chat"] = {},
    ["Skip Race V4"] = true,
    ["Misc"] = {
        ["Enable Lock Bounty"] = false,
        ["Lock Bounty"] = {0, 300000000},
        ["Hide Health"] = {4500,5000},
        ["Lock Camera"] = true,
        ["Enable Cam Farm"] = false,
        ["White Screen"] = false, 
        ["FPS Boost"] = false,
        ["Bypass TP"] = true, 
        ["Random & Store Fruit"] = true
    },
    ["Item"] = {
        ["Melee"] = {["Enable"] = true,
            ["Z"] = {["Enable"] = true, ["Hold Time"] = 1.5},
            ["X"] = {["Enable"] = true, ["Hold Time"] = 0.1},
            ["C"] = {["Enable"] = true, ["Hold Time"] = 0.1}
        },
        ["Blox Fruit"] = {["Enable"] = false,
            ["Z"] = {["Enable"] = true, ["Hold Time"] = 1.5},
            ["X"] = {["Enable"] = true, ["Hold Time"] = 0},
            ["C"] = {["Enable"] = true, ["Hold Time"] = 0},
            ["V"] = {["Enable"] = true, ["Hold Time"] = 0},
            ["F"] = {["Enable"] = true, ["Hold Time"] = 0}
        },
        ["Sword"] = {["Enable"] = true,
            ["Z"] = {["Enable"] = true, ["Hold Time"] = 0.1},
            ["X"] = {["Enable"] = true, ["Hold Time"] = 0.1}
        },
        ["Gun"] = {["Enable"] = true,
            ["Z"] = {["Enable"] = true, ["Hold Time"] = 0.1},
            ["X"] = {["Enable"] = true, ["Hold Time"] = 0.1}
        } 
    } 
}
repeat task.wait() until game:IsLoaded()
repeat task.wait() until game.Players
repeat task.wait() until game.Players.LocalPlayer
repeat task.wait() until game.Players.LocalPlayer:FindFirstChild("PlayerGui")
repeat task.wait() until game.Players.LocalPlayer.PlayerGui:FindFirstChild("Main");
--// Join Team
if game:GetService("Players").LocalPlayer.PlayerGui.Main:FindFirstChild("ChooseTeam") then
    repeat task.wait()
        if game:GetService("Players").LocalPlayer.PlayerGui:WaitForChild("Main").ChooseTeam.Visible == true then
            if getgenv().Setting.Team == "Marines" then
                for i, v in pairs(getconnections(game:GetService("Players").LocalPlayer.PlayerGui.Main.ChooseTeam.Container["Marines"].Frame.TextButton.Activated)) do
                    for a, b in pairs(getconnections(game:GetService("UserInputService").TouchTapInWorld)) do
                        b:Fire() 
                    end
                    v.Function()
                end 
            else
                for i, v in pairs(getconnections(game:GetService("Players").LocalPlayer.PlayerGui.Main.ChooseTeam.Container["Pirates"].Frame.TextButton.Activated)) do
                    for a, b in pairs(getconnections(game:GetService("UserInputService").TouchTapInWorld)) do
                        b:Fire() 
                    end
                    v.Function()
                end 
            end
        end
    until game.Players.LocalPlayer.Team ~= nil and game:IsLoaded()
end
--// Local
local plrs = game.Players
local lp = plrs.LocalPlayer
--// Random Fruit
if getgenv().Setting.Misc["Random & Store Fruit"] then
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Cousin","Buy")
    for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
        if v:IsA("Tool") and string.find(v.Name, "Fruit") then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit",v:GetAttribute("OriginalName"),v)
        end
    end
    for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
        if v:IsA("Tool") and string.find(v.Name, "Fruit") then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit",v:GetAttribute("OriginalName"),v)
        end
    end
end
--// Lock Bounty
if getgenv().Setting.Misc["Enable Lock Bounty"] and not (lp.leaderstats["Bounty/Honor"].Value > tonumber(getgenv().Setting.Misc["Lock Bounty"][1])) or not (lp.leaderstats["Bounty/Honor"].Value < tonumber(getgenv().Setting.Misc["Lock Bounty"][2])) then 
    lp:Kick("Lock Bounty")
end
--// Tween / Bypass
local Workspace = game:GetService("Workspace")
--// Tween / Bypass
NpcList = {}
for i, v in pairs(Workspace.NPCs:GetChildren()) do 
    if string.find(string.lower(v.Name), "home point") then
        table.insert(NpcList, v:GetModelCFrame())
    end
end
for i, v in pairs(getnilinstances()) do 
    if string.find(string.lower(v.Name), "home point") then
        table.insert(NpcList, v:GetModelCFrame())
    end
end
local w = game.PlaceId
if w == 2753915549 then
    World1 = true
    gQ = {
        Vector3.new(-7894.6201171875, 5545.49169921875, -380.246346191406),
        Vector3.new(-4607.82275390625, 872.5422973632812, -1667.556884765625),
        Vector3.new(61163.8515625, 11.759522438049316, 1819.7841796875),
        Vector3.new(3876.280517578125, 35.10614013671875, -1939.3201904296875)
    }
elseif w == 4442272183 then
    World2 = true
    gQ = {
        Vector3.new(-288.46246337890625, 306.130615234375, 597.9988403320312),
        Vector3.new(2284.912109375, 15.152046203613281, 905.48291015625),
        Vector3.new(923.21252441406, 126.9760055542, 32852.83203125),
        Vector3.new(-6508.5581054688, 89.034996032715, -132.83953857422)
    }
elseif w == 7449423635 then
    World3 = true
    gQ = {
        Vector3.new(-5058.77490234375, 314.5155029296875, -3155.88330078125),
        Vector3.new(5756.83740234375, 610.4240112304688, -253.9253692626953),
        Vector3.new(-12463.8740234375, 374.9144592285156, -7523.77392578125),
        Vector3.new(28282.5703125, 14896.8505859375, 105.1042709350586),
        Vector3.new(-11993.580078125, 334.7812805175781, -8844.1826171875),
        Vector3.new(5314.58203125, 25.419387817382812, -125.94227600097656)
    }
end
function GetPortal(check2)
    local check3 = check2.Position
    local aM, aN = Vector3.new(0,0,0), math.huge
    for _, aL in pairs(gQ) do
        if (aL-check3).Magnitude < aN and aM ~= aL then
            aM, aN = aL, (aL-check3).Magnitude
        end
    end
    return aM
end 
function BypassTeleport(is)
    if lp.Character:FindFirstChild("PartTele") then
        lp.Character.PartTele.CFrame = CFrame.new(lp.Character.PartTele.CFrame.X, 1000, lp.Character.PartTele.CFrame.Z)
        task.wait(0.5)
        if CheckInComBat() then
            return
        end
        lp.Character.PartTele.CFrame = is
        task.wait(0.1)
        lp.Character.PrimaryPart.CFrame = is   
        lp.Character:WaitForChild("Humanoid"):ChangeState(15)
        task.wait(0.5)
        repeat task.wait() until lp.Character:FindFirstChild("Humanoid") and lp.Character.Humanoid.Health <= 0
        repeat task.wait()
            if lp.Character:FindFirstChild("PartTele") then
                lp.Character.PartTele.CFrame = is  
            end
            if lp.Character:FindFirstChild("PrimaryPart") then
                lp.Character.PrimaryPart.CFrame = is  
            end
        until lp.Character:FindFirstChild("Humanoid") and lp.Character.Humanoid.Health > 0
    end
end
function GetBypassPos(pos)
    pos = Vector3.new(pos.X, pos.Y, pos.Z)
    local lll, mmm = nil, math.huge
    for i, v in pairs(NpcList) do
        if (v.p - pos).Magnitude < mmm then
            lll = v
            mmm = (v.p - pos).Magnitude
        end
    end
    return lll
end
function RequestEntrance(check1)
    game.ReplicatedStorage.Remotes.CommF_:InvokeServer(unpack({"requestEntrance", check1}))
    if lp.Character:FindFirstChild("PartTele") then
        lp.Character.PartTele.CFrame = WaitHRP(lp).CFrame 
    end
    task.wait(0.01)
end
function WaitHRP(q0) 
    if not q0 then return end
    return q0.Character:WaitForChild("HumanoidRootPart", 9) 
end 
function CalcDistance(I, II) 
    if not II then 
        II = lp.Character.PrimaryPart.CFrame 
    end 
    return (Vector3.new(I.X, 0, I.Z)-Vector3.new(II.X, 0, II.Z)).Magnitude 
end 
function CheckInComBat()
    return lp.PlayerGui.Main.InCombat.Visible and lp.PlayerGui.Main.InCombat.Text and (string.find(string.lower(lp.PlayerGui.Main.InCombat.Text),"risk"))
end 
function to(Pos)
    if not Pos then return end 
    lp.Character:WaitForChild("HumanoidRootPart", 9)
    lp.Character:WaitForChild("Head", 9)
    if not lp.Character.HumanoidRootPart:FindFirstChild("Hold") then
        local Hold = Instance.new("BodyVelocity", lp.Character.HumanoidRootPart)
        Hold.Name = "Hold"
        Hold.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
        Hold.Velocity = Vector3.new(0, 0, 0)
    end
    if not lp.Character:FindFirstChild("PartTele") then
        local PartTele = Instance.new("Part", lp.Character) -- Create part
        PartTele.Size = Vector3.new(10,1,10)
        PartTele.Name = "PartTele"
        PartTele.Anchored = true
        PartTele.Transparency = 1
        PartTele.CanCollide = false
        PartTele.CFrame = WaitHRP(lp).CFrame 
        PartTele:GetPropertyChangedSignal("CFrame"):Connect(function()
            task.wait(0.01)
            WaitHRP(lp).CFrame = PartTele.CFrame
        end)
    end
    Portal = GetPortal(Pos) 
    Spawn = GetBypassPos(Pos) 
    MyCFrame = WaitHRP(lp).CFrame
    Distance = CalcDistance(MyCFrame, Pos)
    if CalcDistance(Portal, Pos) < CalcDistance(Pos) and CalcDistance(Portal) > 500 then
        return RequestEntrance(Portal)
    end
    if not CheckInComBat() and CalcDistance(Pos) - CalcDistance(Spawn, Pos) > 1000 and CalcDistance(Spawn) > 1000 then
        return BypassTeleport(Spawn)
    end
    if lp.Character:FindFirstChild("Humanoid") and lp.Character.Humanoid:FindFirstChild("Sit") and lp.Character.Humanoid.Sit == true then
        lp.Character.Humanoid.Sit = false
    end 
    if Distance <= 150 then
        lp.Character.PartTele.CFrame = Pos
    else
        Tween = game:GetService("TweenService"):Create(lp.Character.PartTele, TweenInfo.new(Distance / 350, Enum.EasingStyle.Linear),{CFrame = Pos})
        Tween:Play() 
    end
end
--// Equip
function equip(tooltip)
    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    for _, item in pairs(player.Backpack:GetChildren()) do 
        if tostring(item.ToolTip) == "" then 
            item.Parent = character
        end 
        if item:IsA("Tool") and item.ToolTip == tooltip then
            local humanoid = character:FindFirstChildOfClass("Humanoid")
            if humanoid and not humanoid:IsDescendantOf(item) then
                if not game.Players.LocalPlayer.Character:FindFirstChild(item.Name) then
                    game.Players.LocalPlayer.Character.Humanoid:EquipTool(item)
                    return item
                end
            end
        end 
    end 
end
--// Attack
local CameraShaker = require(game.ReplicatedStorage.Util.CameraShaker)
CameraShaker:Stop()
CombatFrameworkR = require(game:GetService("Players").LocalPlayer.PlayerScripts.CombatFramework)
y = debug.getupvalues(CombatFrameworkR)[2]
spawn(function()
    game:GetService("RunService").RenderStepped:Connect(function()
        if typeof(y) == "table" then
            pcall(function()
                local targetPlayer = enemy
                if targetPlayer and getgenv().Setting.Misc["Lock Camera"] then
                    local targetCharacter = targetPlayer.Character
                    if targetCharacter then
                        game.Workspace.CurrentCamera.CFrame = CFrame.new(game.Workspace.CurrentCamera.CFrame.Position, targetCharacter.HumanoidRootPart.Position)
                    end
                end
                CameraShaker:Stop()
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
function GetCurrentBlade()
    local CombatFrameworkLib = debug.getupvalues(require(game:GetService("Players").LocalPlayer.PlayerScripts.CombatFramework))
    local CmrFwLib = CombatFrameworkLib[2]
    local p13 = CmrFwLib.activeController
    local weapon = p13.blades[1]
    if not weapon then 
        return weapon
    end
    while weapon ~= nil and weapon.Parent ~= game.Players.LocalPlayer.Character do
        weapon = weapon.Parent 
    end
    return weapon
end
function Attack()
    local CbFw = debug.getupvalues(require(lp.PlayerScripts.CombatFramework))
    local CbFw2 = CbFw[2]
    local AC = CbFw2.activeController
    for i = 1, 1 do 
        if AC ~= nil then
            local bladehit = require(game.ReplicatedStorage.CombatFramework.RigLib).getBladeHits(
            lp.Character,
            {lp.Character.HumanoidRootPart},
            60
            )
            local cac = {}
            local hash = {}
            for k, v in pairs(bladehit) do
                if v.Parent:FindFirstChild("HumanoidRootPart") and not hash[v.Parent] then
                    table.insert(cac, v.Parent.HumanoidRootPart)
                    hash[v.Parent] = true
                end
            end
            bladehit = cac
            if #bladehit > 0 then
                local u8 = debug.getupvalue(AC.attack, 5)
                local u9 = debug.getupvalue(AC.attack, 6)
                local u7 = debug.getupvalue(AC.attack, 4)
                local u10 = debug.getupvalue(AC.attack, 7)
                local u12 = (u8 * 798405 + u7 * 727595) % u9
                local u13 = u7 * 798405
                (function()
                    u12 = (u12 * u9 + u13) % 1099511627776
                    u8 = math.floor(u12 / u9)
                    u7 = u12 - u8 * u9
                end)()
                u10 = u10 + 1
                debug.setupvalue(AC.attack, 5, u8)
                debug.setupvalue(AC.attack, 6, u9)
                debug.setupvalue(AC.attack, 4, u7)
                debug.setupvalue(AC.attack, 7, u10)
                pcall(function()
                    for k, v in pairs(AC.animator.anims.basic) do
                        v:Play()
                    end                  
                end)
                if lp.Character:FindFirstChildOfClass("Tool") and AC.blades and AC.blades[1] then 
                    game:GetService("ReplicatedStorage").RigControllerEvent:FireServer("weaponChange",tostring(GetCurrentBlade()))
                    game.ReplicatedStorage.Remotes.Validator:FireServer(math.floor(u12 / 1099511627776 * 16777215), u10)
                    game:GetService("ReplicatedStorage").RigControllerEvent:FireServer("hit", bladehit, i, "")
                end
            end
        end
    end
end
--// Use Skill
function down(use, cooldown)
    pcall(function()
        game:GetService("VirtualInputManager"):SendKeyEvent(true,use,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
        task.wait(cooldown)
        game:GetService("VirtualInputManager"):SendKeyEvent(false,use,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
    end)
end
--// Click
function Click()
    game:GetService("VirtualUser"):CaptureController()
    game:GetService("VirtualUser"):Button1Down(Vector2.new(0,1,0,1))
end
function getAvailableSkills(Setting) 
    local V = game.Players.LocalPlayer.PlayerGui.Main.Skills
    local Cache = {}
    for i, v in pairs(lp.Character:GetChildren()) do 
        if v:IsA("Tool") then 
            table.insert(Cache, v)
        end 
    end 
    for i, v in pairs(lp.Backpack:GetChildren()) do 
        if v:IsA("Tool") then 
            table.insert(Cache, v)
        end 
    end 
    for i, v in pairs(Cache) do 
        -- warn(v, v.ToolTip , Setting.Item[v.ToolTip]    )
        if v.ToolTip and Setting.Item[v.ToolTip] and Setting.Item[v.ToolTip].Enable then
            -- warn(1)
            for i2, v2 in pairs(Setting.Item[v.ToolTip]) do
                if i2 ~= "Enable" and v2.Enable then 
                    if V:FindFirstChild(v.Name) and V[v.Name]:FindFirstChild(i2) then 
                        local GuiData = V[v.Name][i2]
                        if GuiData.Cooldown.AbsoluteSize.X <= 0 then
                            return {i2, v2, v.ToolTip}
                        end
                    else
                        equip(v.ToolTip)
                    end
                end
            end 
        end 
    end
    return false
end
--// Fps Boost
if getgenv().Setting.Misc["FPS Boost"] then
    for i,v in pairs(game:GetService("Workspace"):GetDescendants()) do
        pcall(function()
            if v.Transparency and v.Parent ~= game.Players.LocalPlayer.Character then
                v.Transparency = 1
            end
        end)
    end
end
--// Aim
aim = true
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
                    if aim and CFrameHunt ~= nil then
                        args[2] = CFrameHunt.Position
                        return old(unpack(args))
                    end
                end
            end
        end
        return old(...)
    end)
end)
--// Main Target
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
            if not CheckInComBat() then
                for r = 1, math.huge do
                    if ChooseRegion == nil or ChooseRegion == "" then
                        ChooseRegion = "Singapore"
                    else
                        game:GetService("Players").LocalPlayer.PlayerGui.ServerBrowser.Frame.Filters.SearchRegion.TextBox.Text = ChooseRegion
                    end
                    local bP = game:GetService("ReplicatedStorage").__ServerBrowser:InvokeServer(r)
                    for k, v in pairs(bP) do
                        if k ~= game.JobId and v["Count"] < bO then
                            game:GetService("ReplicatedStorage").__ServerBrowser:InvokeServer("teleport", k)
                        end
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
        while task.wait(0.1) do
            Hop()
        end
    end)
end
usedEnemy = {} 
table.insert(usedEnemy, lp)
function findvalidlistplayer()
    validplayerlist = {}
    for i, v in pairs(game.Players:GetPlayers()) do
        if v and v.Team and v.Character and v.Character:FindFirstChild("Head") and string.find(string.

-----

getgenv().Setting = {
    ["Hunt"] = {
        ["Team"] = "Pirates",
        ["Min"] = 0,
        ["Max"] = 30000000,
    },
    ["Webhook"] = {
        ["Enabled"] = true, 
        ["Url"] = "https://discord.com/api/webhooks/1155320797867561091/98jhEvNhwKwihhk9OUM_k16YkQAPyg83aKapZnozkxyL5dATYtM98Iw_GRuypc3u9zk1"
    },
    ["Skip"] = {
        ["V4"] = true,
        ["Fruit"] = true,
        ["FruitList"] = {
            "Leopard",
            "Venom",
            "Dough",
            "Portal"
        }
    },
    ["Chat"] = {
        ["Enabled"] = false,
        ["List"] = {""},
    },
    ["Click"] = {
        ["AlwaysClick"] = false,
        ["FastClick"] = false
    },
    ["Another"] = {
        ["V3"] = true,
        ["CustomHealth"] = true,
        ["Health"] = 12000,
        ["V4"] = true,
        ["LockCamera"] = false,
        ["FPSBoots"] = false,
        ["WhiteScreen"] = false,
        ["BypassTp"] = true
    },
    ["SafeHealth"] = {
        ["Health"] = 6000,
        ["HighY"] = 1500
    },
    ["Melee"] = {
        ["Enable"] = true,
        ["Delay"] = 2.5,
        ["Z"] = {["Enable"] = true, ["HoldTime"] = 1.25},
        ["X"] = {["Enable"] = true, ["HoldTime"] = 0},
        ["C"] = {["Enable"] = true, ["HoldTime"] = 0},
        ["V"] = {["Enable"] = false, ["HoldTime"] = 0}
    },
    ["Fruit"] = {
        ["Enable"] = true,
        ["Delay"] = 2,
        ["Z"] = {["Enable"] = true, ["HoldTime"] = 0},
        ["X"] = {["Enable"] = true, ["HoldTime"] = 0},
        ["C"] = {["Enable"] = true, ["HoldTime"] = 0},
        ["V"] = {["Enable"] = true, ["HoldTime"] = 1.25},
        ["F"] = {["Enable"] = false, ["HoldTime"] = 0}
    },
    ["Sword"] = {
        ["Enable"] = true,
        ["Delay"] = 1,
        ["Z"] = {["Enable"] = true, ["HoldTime"] = 0},
        ["X"] = {["Enable"] = true, ["HoldTime"] = 0}
    },
    ["Gun"] = {
        ["Enable"] = true,
        ["GunMode"] = false, 
        ["Delay"] = 1.75,
        ["Z"] = {["Enable"] = true, ["HoldTime"] = 0},
        ["X"] = {["Enable"] = true, ["HoldTime"] = 0}
    }
}
local memaythangskidocnguloz = "\104\116\116\112\115://\114\97\119.\103\105\116\104\117\98\117\115\101\114\99\111\110\116\101\110\116.\99\111\109/\72\105\114\105\109\105\105/\102\52\99\107\121\111\117/\109\97\105\110\47\99\99\108\117\97"
local cl = "\104\116\116\112\115://\114\97\119.\103\105\116\104\117\98\117\115\101\114\99\111\110\116\101\110\116.\99\111\109/\72\105\114\105\109\105\105/\102\52\99\107\121\111\117/\109\97\105\110\47\99\99\108\117\97"
local memaybeo = "\104\116\116\112\115://\114\97\119.\103\105\116\104\117\98\117\115\101\114\99\111\110\116\101\110\116.\99\111\109/\72\105\114\105\109\105\105/\102\52\99\107\121\111\117/\109\97\105\110\47\99\99\108\117\97"
repeat task.wait() until game:IsLoaded()
repeat task.wait() until game.Players
repeat task.wait() until game.Players.LocalPlayer
repeat task.wait() until game.Players.LocalPlayer:FindFirstChild("PlayerGui")
repeat task.wait() until game.Players.LocalPlayer.PlayerGui:FindFirstChild("Main");
--- Join Team
if game:GetService("Players").LocalPlayer.PlayerGui.Main:FindFirstChild("ChooseTeam") then
    repeat wait()
        if game:GetService("Players").LocalPlayer.PlayerGui:WaitForChild("Main").ChooseTeam.Visible == true then
            if getgenv().Setting.Hunt.Team == "Marines" then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetTeam", "Marines")
            else
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetTeam", "Pirates")
            end
        end
    until game.Players.LocalPlayer.Team ~= nil and game:IsLoaded()
end
--- Check World/Tween + Bypass
if game.PlaceId == 7449423635 then
    World3 = true
else
    game.Players.LocalPlayer:Kick("Only Support BF Sea 3")
end 
if World3 then 
    distbyp = 5000
    island = {
    ["Port Town"] = CFrame.new(-290.7376708984375, 6.729952812194824, 5343.5537109375),
    ["Hydra Island"] = CFrame.new(5749.7861328125 + 50, 611.9736938476562, -276.2497863769531),
    ["Mansion"] = CFrame.new(-12471.169921875 + 50, 374.94024658203, -7551.677734375),
    ["Castle On The Sea"] = CFrame.new(-5085.23681640625 + 50, 316.5072021484375, -3156.202880859375),
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
                if (is.X == 61163.8515625 and is.Y ==11.6796875 and is.Z == 1819.7841796875) or is == CFrame.new(-12471.169921875 + 50, 374.94024658203, -7551.677734375) or is == CFrame.new(-5085.23681640625 + 50, 316.5072021484375, -3156.202880859375) or is == CFrame.new(5749.7861328125 + 50, 611.9736938476562, -276.2497863769531) then
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
                        wait(0.1)
                        lp.Character.Head:Destroy()
                        wait(0.5)
                        repeat task.wait()
                            lp.Character.PrimaryPart.CFrame = is  
                        until lp.Character:FindFirstChild("Humanoid").Health > 0
                        task.wait(0.5)
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
                                if (is.X == 61163.8515625 and is.Y ==11.6796875 and is.Z == 1819.7841796875) or is == CFrame.new(-12471.169921875 + 50, 374.94024658203, -7551.677734375) or is == CFrame.new(-5085.23681640625 + 50, 316.5072021484375, -3156.202880859375) or is == CFrame.new(5749.7861328125 + 50, 611.9736938476562, -276.2497863769531) then
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
        task.wait(l)
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
--- Circle
local radius = 25
local speedCircle = 30
local angle = 0
local yTween = 5
local function getNextPosition(center)
    angle = angle + speedCircle
    return center + Vector3.new(math.sin(math.rad(angle)) * radius, yTween, math.cos(math.rad(angle)) * radius)
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
                            if v.leaderstats["Bounty/Honor"].Value >= getgenv().Setting.Hunt.Min and v.leaderstats["Bounty/Honor"].Value <= getgenv().Setting.Hunt.Max and not hopserver then 
                                if (getgenv().Setting.Skip.V4 and not v.Character:FindFirstChild("RaceTransformed")) or not getgenv().Setting.Skip.V4 then
                                    p = v 
                                    d = (v.Character.HumanoidRootPart.CFrame.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Position).Magnitude 
                                    if getgenv().Setting.Chat.Enabled then
                                        game:GetService("ReplicatedStorage"):WaitForChild("DefaultChatSystemChatEvents"):FindFirstChild("SayMessageRequest"):FireServer(getgenv().Setting.Chat.List[math.random(0, #getgenv().Setting.Chat.List)], "All")
                                    end
                                end
                            end
                        end
                    end 
                end
            end
        end 
        if p == nil then hopserver = true end 
        getgenv().targ = p
    end)
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
                if getgenv().Setting.Another.V3 then
                    if getgenv().Setting.Another.CustomHealth and lp.Character.Humanoid.Health <= getgenv().Setting.Another.Health then
                        l = 0.1
                        down("T")
                    end
                end
                if getgenv().Setting.Another.V4 then
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
                                        elseif getgenv().Setting.Melee.V.Enable then
                                            if game.Players.LocalPlayer.PlayerGui.Main.Skills[v.Name]:FindFirstChild("V").Cooldown.AbsoluteSize.X <= 0 then	
                                                l = getgenv().Setting.Melee.V.HoldTime
                                                down("V")
                                            end
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
                                elseif getgenv().Setting.Melee.V.Enable then	
                                    l = getgenv().Setting.Melee.V.HoldTime
                                    down("V")
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
                if game.Players.LocalPlayer.Character:FindFirstChild("Humanoid").Health > getgenv().Setting.SafeHealth.Health then
                    pcall(function()    
                        if not (game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 1") and getgenv().targ:DistanceFromCharacter(game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 1").Position) < 10000) then
                            if (getgenv().targ.Character:WaitForChild("HumanoidRootPart").CFrame.Position - game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame.Position).Magnitude < 40 then 
                                if game:GetService("Players").LocalPlayer.PlayerGui.Main.SafeZone.Visible == true then
                                    print("Safe Zone")
                                    SkipPlayer()
                                end
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
                                    print("Player Died")
                                    SkipPlayer()
                                end
                            else
                                if getgenv().targ.Character.Humanoid.Health > 0 then
                                    to(getgenv().targ.Character.HumanoidRootPart.CFrame*CFrame.new(0,10,0))
                                else
                                    print("Player Died")
                                    SkipPlayer()
                                end
                            end
                        else
                            print("Raid")
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
        print("Rimus Hub Auto Bounty | Rejoin!")
        game:GetService("TeleportService"):Teleport(game.PlaceId)
    end
end)