-- Kiểm tra và xóa các GUI cũ
local ui = game:GetService("CoreGui"):FindFirstChild("RippleFPS")  
if ui then ui:Destroy() end 

local uix = game:GetService("CoreGui"):FindFirstChild("Rippletime")  
if uix then uix:Destroy() end 

-- Khởi tạo các thành phần GUI mới
local RippleFPS = Instance.new("ScreenGui")
local Rippletime = Instance.new("ScreenGui")
local Framefps = Instance.new("Frame")
local Frametime = Instance.new("Frame")
local UICorner213 = Instance.new("UICorner")
local UICorner214 = Instance.new("UICorner")
local TextLabelfps = Instance.new("TextLabel")
local TextLabeltime = Instance.new("TextLabel")
local ImageLabelfps = Instance.new("ImageLabel")
local ImageLabeltime = Instance.new("ImageLabel")
local Strokefps = Instance.new("UIStroke")
local Stroketime = Instance.new("UIStroke")

local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local uihide = false
local yoo = "F"  -- Điều chỉnh phím tắt cần thiết, ví dụ: F

RippleFPS.Name = "RippleFPS"
RippleFPS.Parent = game.CoreGui
RippleFPS.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Rippletime.Name = "Rippletime"
Rippletime.Parent = game.CoreGui
Rippletime.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Framefps.Name = "Framefps"
Framefps.Parent = RippleFPS
Framefps.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
Framefps.BorderSizePixel = 0
Framefps.Position = UDim2.new(0.010, 0, 0.21084006, 0)
Framefps.Size = UDim2.new(0, 193, 0, 44)

UICorner213.CornerRadius = UDim.new(0, 4)
UICorner213.Parent = Framefps

Strokefps.Thickness = 1
Strokefps.Parent = Framefps
Strokefps.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
Strokefps.LineJoinMode = Enum.LineJoinMode.Round
Strokefps.Color = _G.Color or Color3.new(1, 1, 1) -- Đảm bảo _G.Color được định nghĩa
Strokefps.Transparency = 0

Frametime.Name = "Frametime"
Frametime.Parent = Rippletime
Frametime.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
Frametime.BorderSizePixel = 0
Frametime.Position = UDim2.new(0.010, 0, 0.11084006, 0)
Frametime.Size = UDim2.new(0, 293, 0, 44)

UICorner214.CornerRadius = UDim.new(0, 4)
UICorner214.Parent = Frametime

Stroketime.Thickness = 1
Stroketime.Parent = Frametime
Stroketime.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
Stroketime.LineJoinMode = Enum.LineJoinMode.Round
Stroketime.Color = _G.Color or Color3.new(1, 1, 1)
Stroketime.Transparency = 0

TextLabelfps.Name = "TextLabelfps"
TextLabelfps.Parent = Framefps
TextLabelfps.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabelfps.BackgroundTransparency = 1.000
TextLabelfps.Position = UDim2.new(0.356857866, 0, 0.234848887, 0)
TextLabelfps.Size = UDim2.new(0, 124, 0, 23)
TextLabelfps.Font = Enum.Font.GothamSemibold
TextLabelfps.Text = "FPS:N/A"
TextLabelfps.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabelfps.TextSize = 14.000
TextLabelfps.TextXAlignment = Enum.TextXAlignment.Left

TextLabeltime.Name = "TextLabeltime"
TextLabeltime.Parent = Frametime
TextLabeltime.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabeltime.BackgroundTransparency = 1.000
TextLabeltime.Position = UDim2.new(0.356857866, 0, 0.234848887, 0)
TextLabeltime.Size = UDim2.new(0, 124, 0, 23)
TextLabeltime.Font = Enum.Font.GothamSemibold
TextLabeltime.Text = "Time: N/A"
TextLabeltime.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabeltime.TextSize = 14.000
TextLabeltime.TextXAlignment = Enum.TextXAlignment.Left

ImageLabelfps.Name = "ImageLabelfps"
ImageLabelfps.Parent = Framefps
ImageLabelfps.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ImageLabelfps.BackgroundTransparency = 1.000
ImageLabelfps.Position = UDim2.new(0.083989636, 0, 0.15545856, 0)
ImageLabelfps.Size = UDim2.new(0, 29, 0, 29)
ImageLabelfps.Image = "rbxassetid://9606070311"

ImageLabeltime.Name = "ImageLabeltime"
ImageLabeltime.Parent = Frametime
ImageLabeltime.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ImageLabeltime.BackgroundTransparency = 1.000
ImageLabeltime.Position = UDim2.new(0.083989636, 0, 0.15545856, 0)
ImageLabeltime.Size = UDim2.new(0, 29, 0, 29)
ImageLabeltime.Image = "rbxassetid://9606070311"

-- Cập nhật FPS và thời gian
spawn(function()
    while wait(1) do
        pcall(function()
            local scripttime = game.Workspace.DistributedGameTime
            local seconds = scripttime % 60
            local minutes = math.floor(scripttime / 60 % 60)
            local hours = math.floor(scripttime / 3600)
            local tempo = string.format("%.0f Hour , %.0f Minute , %.0f Second", hours, minutes, seconds)
            TextLabeltime.Text = tempo
        end)
    end
end)

spawn(function()
    while wait(1) do
        pcall(function()
            TextLabelfps.Text = "FPS: " .. string.format("%d", workspace:GetRealPhysicsFPS())
        end)
    end
end)

-- Xử lý sự kiện nhấn phím để ẩn hiện UI
UserInputService.InputBegan:Connect(function(input)
    if input.KeyCode == Enum.KeyCode[yoo] then
        -- Xử lý ẩn hoặc hiện UI
        -- Thêm logic cần thiết tại đây
    end
end)