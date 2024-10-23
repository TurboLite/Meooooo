-- Tạo đối tượng Sound trong Workspace
local sound = Instance.new("Sound")
sound.SoundId = "rbxassetid://112464816248293"  -- Sử dụng ID nhạc của bạn
sound.Parent = game.Workspace  -- Đặt Sound vào Workspace

-- Thiết lập các thuộc tính của âm thanh
sound.Volume = 1  -- Âm lượng (giá trị từ 0 đến 1)
sound.Looped = true  -- Nếu bạn muốn phát lại liên tục

-- Bắt đầu phát nhạc
sound:Play()