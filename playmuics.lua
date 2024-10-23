local sound = Instance.new("Sound")
sound.SoundId = "rbxassetid://112464816248293"  -- ID nhạc của bạn
sound.Volume = 1  -- Âm lượng (giá trị từ 0 đến 1)
sound.Looped = true  -- Phát nhạc liên tục
sound.Parent = game.Workspace  -- Đặt Sound vào Workspace

sound:Play()  -- Bắt đầu phát nhạc