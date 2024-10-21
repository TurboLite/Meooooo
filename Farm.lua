-- Đảm bảo các hàm và biến sau đã được định nghĩa trước đó:
-- AutoHaki(), EquipWeapon(weapon), topos(position), BTP(position)
-- _G.SelectWeapon, _G.AutoFarm, BypassTP, BonesBring, AnDepZai

local function AutoFarmSkeletons()
    -- Kiểm tra nếu có kẻ địch là Reborn Skeleton, Living Zombie, Demonic Soul hoặc Posessed Mummy
    if game:GetService("Workspace").Enemies:FindFirstChild("Reborn Skeleton") or 
       game:GetService("Workspace").Enemies:FindFirstChild("Living Zombie") or 
       game:GetService("Workspace").Enemies:FindFirstChild("Demonic Soul") or 
       game:GetService("Workspace").Enemies:FindFirstChild("Posessed Mummy") then
        
        for i, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
            if v.Name == "Reborn Skeleton" or v.Name == "Living Zombie" or v.Name == "Demonic Soul" or v.Name == "Posessed Mummy" then
                if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                    -- Tiến hành tự động tấn công khi tìm thấy mục tiêu
                    repeat 
                        wait()
                        AutoHaki()
                        if not game.Players.LocalPlayer.Character:FindFirstChild(_G.SelectWeapon) then
                            wait()
                        end
                        EquipWeapon(_G.SelectWeapon)
                        v.HumanoidRootPart.CanCollide = false
                        v.Humanoid.WalkSpeed = 0
                        v.Head.CanCollide = false
                        BonesBring = true
                        topos(v.HumanoidRootPart.CFrame * Pos)
                    until not _G.AutoFarm or not v.Parent or v.Humanoid.Health <= 0
                end
            end
        end
    else
        -- Nếu không có kẻ địch trong khoảng cách 1500, sử dụng teleport (BypassTP)
        if BypassTP then
            if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - AnDepZai.Position).Magnitude > 1500 then
                BTP(AnDepZai)
            else
                topos(AnDepZai)
            end
        else
            topos(AnDepZai)
        end
        UnEquipWeapon(_G.SelectWeapon)
        BonesBring = false
        topos(CFrame.new(-9506.234375, 172.130615234375, 6117.0771484375))
        
        -- Dịch chuyển đến vị trí của các quái vật trong ReplicatedStorage
        for i, v in pairs(game:GetService("ReplicatedStorage"):GetChildren()) do 
            if v.Name == "Reborn Skeleton" then
                topos(v.HumanoidRootPart.CFrame * CFrame.new(2,20,2))
            elseif v.Name == "Living Zombie" then
                topos(v.HumanoidRootPart.CFrame * CFrame.new(2,20,2))
            elseif v.Name == "Demonic Soul" then
                topos(v.HumanoidRootPart.CFrame * CFrame.new(2,20,2))
            elseif v.Name == "Posessed Mummy" then
                topos(v.HumanoidRootPart.CFrame * CFrame.new(2,20,2))
            end
        end
    end
end

-- Gọi hàm AutoFarmSkeletons khi script được chạy
AutoFarmSkeletons()