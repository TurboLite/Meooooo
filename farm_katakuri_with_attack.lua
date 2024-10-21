
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

function FarmMultipleEnemies()
    local enemies = {}  -- Lưu danh sách quái
    for i, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
        if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
            table.insert(enemies, v)  -- Thêm quái vào danh sách
        end
    end

    -- Gom quái lại một vị trí
    for _, enemy in pairs(enemies) do
        if enemy:FindFirstChild("HumanoidRootPart") then
            topos(enemy.HumanoidRootPart.CFrame * CFrame.new(0, 0, 0))  -- Gom về cùng vị trí
        end
    end

    -- Tấn công tất cả quái đã gom
    for _, enemy in pairs(enemies) do
        Attack(enemy)
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

function Attack(target)
    local player = game.Players.LocalPlayer
    local tool = player.Character:FindFirstChildOfClass("Tool")
    
    -- Đảm bảo người chơi đang cầm vũ khí
    if tool and target and target:FindFirstChild("Humanoid") and target.Humanoid.Health > 0 then
        -- Gọi sự kiện tấn công quái
        local args = {
            [1] = target.Humanoid -- mục tiêu
        }
        tool:Activate() -- Kích hoạt công cụ để tấn công
        game:GetService("ReplicatedStorage").Remotes.Combat:FireServer(unpack(args)) -- Gửi lệnh tấn công quái
    end
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
                                        Attack(v)  -- Tấn công mục tiêu
                                    until not _G.AutoFarm or not v.Parent or v.Humanoid.Health <= 0 or tween:Cancel() or game:GetService("Workspace").Enemies:FindFirstChild("Ring") and game:GetService("Workspace").Enemies:FindFirstChild("Fist")
                                    if game:GetService("Workspace").Enemies:FindFirstChild("Ring") and game:GetService("Workspace").Enemies:FindFirstChild("Fist") then
                                        topos(v.HumanoidRootPart.CFrame * CFrame.new(0, 200, 0))
                                    end
                                end
                            end
                        end
                    else
                        -- Xử lý các mục tiêu khác tương tự
                        if game:GetService("Workspace").Enemies:FindFirstChild("Cookie Crafter") or game:GetService("Workspace").Enemies:FindFirstChild("Cake Guard") or game:GetService("Workspace").Enemies:FindFirstChild("Baking Staff") or game:GetService("Workspace").Enemies:FindFirstChild("Head Baker") then
                            for i, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                    repeat
                                        task.wait()
                                        AutoHaki()
                                        EquipWeapon(_G.SelectWeapon)
                                        v.HumanoidRootPart.CanCollide = false
                                        v.Humanoid.WalkSpeed = 0
                                        NeedAttacking = true
                                        CakeBring = true
                                        topos(v.HumanoidRootPart.CFrame * Pos)
                                        sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
                                        Attack(v)  -- Tấn công mục tiêu
                                    until not _G.AutoFarm or not v.Parent or v.Humanoid.Health <= 0 or game:GetService("Workspace").Map.CakeLoaf.BigMirror.Other.Transparency == 0 or game:GetService("ReplicatedStorage"):FindFirstChild("Cake Prince [Lv. 2300] [Raid Boss]") or KillMob == 0
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
