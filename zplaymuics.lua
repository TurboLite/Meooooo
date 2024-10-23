local function playSound()
    local sound = Instance.new("Sound", game:GetService("CoreGui"))
    sound.SoundId = "rbxassetid://112464816248293"
    sound.Volume = 10
    sound:Play()
end

playSound()