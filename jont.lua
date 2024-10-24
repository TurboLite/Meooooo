-- Tạo nút Skip Player
local skipButton = Instance.new("TextButton")
skipButton.Size = UDim2.new(0, 200, 0, 50)  -- Kích thước của nút
skipButton.Position = UDim2.new(1, -210, 0, 10)  -- Vị trí góc phải trên cùng màn hình
skipButton.Text = "Skip Player"  -- Tên hiển thị trên nút
skipButton.Parent = game.Players.LocalPlayer.PlayerGui.ScreenGui  -- Thêm nút vào giao diện người chơi

-- Liên kết sự kiện nhấp chuột với hàm SkipPlayer
skipButton.MouseButton1Click:Connect(function()
    SkipPlayer()  -- Gọi hàm khi nhấp nút
end)

-- Skip Player function
function SkipPlayer()
    getgenv().killed = getgenv().targ 
    table.insert(getgenv().checked, getgenv().targ)
    getgenv().targ = nil
    target()
end