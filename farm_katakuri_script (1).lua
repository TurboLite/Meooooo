
_G.AutoFarm = true
_G.SelectWeapon = "YourWeaponName"
FarmMode = "Farm Katakuri"
AnDepZai3 = true
Pos = Vector3.new(0, 0, 0)
CakeBring = false
KillMob = 1
BypassTP = true

function AutoHaki()
    if not game.Players.LocalPlayer.Character:FindFirstChild("Haki") then
        local args = { "Activate Haki" }
        game:GetService("ReplicatedStorage").Remotes.Haki:FireServer(unpack(args))
    end
end

function EquipWeapon(weaponName)
    local player = game.Players.LocalPlayer
    if player.Backpack:FindFirstChild(weaponName) then
        player.Character.Humanoid:EquipTool(player.Backpack:FindFirstChild(weaponName))
    end
end

function topos(cframe)
    local player = game.Players.LocalPlayer
    local tweenService = game:GetService("TweenService")
    local tweenInfo = TweenInfo.new(0.5, Enum.EasingStyle.Linear)
    local tween = tweenService:Create(player.Character.HumanoidRootPart, tweenInfo, {CFrame = cframe})
    tween:Play()
end

function BTP(cframe)
    local player = game.Players.LocalPlayer
    player.Character.HumanoidRootPart.CFrame = cframe
end

function sethiddenproperty(player, propertyName, value)
    -- Để trống hoặc tùy chỉnh với exploit
end

local function FarmKatakuri()
    spawn(function()
        while wait() do
            if FarmMode == "Farm Katakuri" and _G.AutoFarm and AnDepZai3 then
                pcall(function()
                    if game:GetService("Workspace").Enemies:FindFirstChild("Cake Prince") then
                        for i, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if v.Name == "Cake Prince" then
                                if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                    repeat
                                        task.wait()
                                        AutoHaki()
                                        EquipWeapon(_G.SelectWeapon)
                                        v.HumanoidRootPart.CanCollide = false
                                        v.Humanoid.WalkSpeed = 0
                                        NeedAttacking = true
                                        v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                                        topos(v.HumanoidRootPart.CFrame * Pos)
                                        CakeBring = false
                                        sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
                                    until not _G.AutoFarm or not v.Parent or v.Humanoid.Health <= 0 or tween:Cancel() or game:GetService("Workspace").Enemies:FindFirstChild("Ring") and game:GetService("Workspace").Enemies:FindFirstChild("Fist")
                                    if game:GetService("Workspace").Enemies:FindFirstChild("Ring") and game:GetService("Workspace").Enemies:FindFirstChild("Fist") then
                                        topos(v.HumanoidRootPart.CFrame * CFrame.new(0, 200, 0))
                                    end
                                end
                            end
                        end
                    else
                        if game:GetService("Workspace").Map.CakeLoaf.BigMirror.Other.Transparency == 0 and (CFrame.new(-1990.672607421875, 4532.99951171875, -14973.6748046875).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude >= 500 then
                            topos(CFrame.new(-2151.82153, 149.315704, -12404.9053))
                        else
                            if game:GetService("Workspace").Enemies:FindFirstChild("Cookie Crafter") or game:GetService("Workspace").Enemies:FindFirstChild("Cake Guard") or game:GetService("Workspace").Enemies:FindFirstChild("Baking Staff") or game:GetService("Workspace").Enemies:FindFirstChild("Head Baker") then
                                for i, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                    if v.Name == "Cookie Crafter" or v.Name == "Cake Guard" or v.Name == "Baking Staff" or v.Name == "Head Baker" then
                                        if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                            repeat
                                                wait()
                                                AutoHaki()
                                                EquipWeapon(_G.SelectWeapon)
                                                v.HumanoidRootPart.CanCollide = false
                                                v.Humanoid.WalkSpeed = 0
                                                v.Head.CanCollide = false
                                                NeedAttacking = true
                                                CakeBring = true
                                                topos(v.HumanoidRootPart.CFrame * Pos)
                                                sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
                                            until not _G.AutoFarm or not v.Parent or v.Humanoid.Health <= 0 or game:GetService("Workspace").Map.CakeLoaf.BigMirror.Other.Transparency == 0 or game:GetService("ReplicatedStorage"):FindFirstChild("Cake Prince [Lv. 2300] [Raid Boss]") or KillMob == 0
                                        end
                                    end
                                end
                            else
                                local RandomTele = math.random(1, 3)
                                if RandomTele == 1 then
                                    topos(CFrame.new(-1436.86011, 167.753616, -12296.9512))
                                elseif RandomTele == 2 then
                                    topos(CFrame.new(-2383.78979, 150.450592, -12126.4961))
                                elseif RandomTele == 3 then
                                    topos(CFrame.new(-2231.2793, 168.256653, -12845.7559))
                                end
                            end
                        end
                    end
                end)
            end
        end
    end)
end

FarmKatakuri()
