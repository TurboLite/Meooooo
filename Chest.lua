
-- Khởi tạo giá trị mặc định cho _G.StopChest
_G.StopChest = true -- Hoặc false nếu bạn muốn nó tắt mặc định

-- Hàm AutoFarmChest và TweenChest (giả sử bạn đã có các hàm này trước đó)
function AutoFarmChest()
    -- Nội dung hàm AutoFarmChest
end

function TweenChest(status)
    -- Hàm bật/tắt TweenChest
    if status then
        -- Bật TweenChest
    else
        -- Tắt TweenChest
    end
end

-- Hàm kiểm tra vật phẩm trong ba lô và nhân vật
spawn(function()
    while wait() do
        if _G.StopChest then
            -- Lấy thông tin người chơi
            local player = game.Players.LocalPlayer
            local backpack = player.Backpack
            local character = player.Character
            
            -- Kiểm tra nếu người chơi có "Fist of Darkness" hoặc "God's Chalice"
            if backpack:FindFirstChild("Fist of Darkness") or 
               character:FindFirstChild("Fist of Darkness") or 
               backpack:FindFirstChild("God's Chalice") or 
               character:FindFirstChild("God's Chalice") then
                -- Nếu có, ngừng AutoFarmChest và tắt TweenChest
                AutoFarmChest = false
                TweenChest(false)
            end
        end
    end
end)

-- Đoạn mã này sẽ chạy ngay lập tức khi script khởi động
print("Script đã khởi động và đang kiểm tra vật phẩm.")
