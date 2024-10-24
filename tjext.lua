local PlaceID = game.PlaceId
local AllIDs = {}
local foundAnything = ""
local actualHour = os.date("!*t").hour
local Deleted = false

local HttpService = game:GetService('HttpService')
local Players = game:GetService('Players')
local LocalPlayer = Players.LocalPlayer

-- Tạo giao diện "Hop Server"
local screenGui = Instance.new("ScreenGui")
local textButton = Instance.new("TextButton")

screenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")

-- Cài đặt giao diện cho nút
textButton.Size = UDim2.new(0, 150, 0, 40) -- Kích thước nhỏ gọn hơn
textButton.Position = UDim2.new(0, 10, 0, 80) -- Vị trí ở dưới một chút
textButton.BackgroundColor3 = Color3.fromRGB(45, 45, 45) -- Màu nền xám
textButton.BorderSizePixel = 2 -- Đường viền dày hơn
textButton.BorderColor3 = Color3.fromRGB(255, 255, 255) -- Màu viền trắng
textButton.TextColor3 = Color3.fromRGB(255, 255, 255) -- Màu chữ trắng
textButton.TextScaled = true -- Tự động điều chỉnh kích thước chữ
textButton.Text = "Hop Server" -- Chữ trên nút
textButton.Font = Enum.Font.SourceSansBold -- Font chữ đậm
textButton.Parent = screenGui

-- Kiểm tra nếu file NotSameServers.json tồn tại và tải dữ liệu nếu có
pcall(function()
    AllIDs = HttpService:JSONDecode(readfile("NotSameServers.json"))
end)

if not AllIDs or #AllIDs == 0 then
    table.insert(AllIDs, actualHour)
    writefile("NotSameServers.json", HttpService:JSONEncode(AllIDs))
end

function TPReturner()
    local Site
    if foundAnything == "" then
        Site = HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100'))
    else
        Site = HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100&cursor=' .. foundAnything))
    end

    if Site.nextPageCursor and Site.nextPageCursor ~= "null" then
        foundAnything = Site.nextPageCursor
    end

    for _, v in pairs(Site.data) do
        local ID = tostring(v.id)
        local Possible = true

        -- Kiểm tra xem server có đầy chưa và server này đã vào chưa
        if tonumber(v.maxPlayers) > tonumber(v.playing) then
            for _, Existing in pairs(AllIDs) do
                if ID == tostring(Existing) then
                    Possible = false
                    break
                end
            end

            if Possible then
                table.insert(AllIDs, ID)

                -- Ghi dữ liệu vào file (nếu cần)
                pcall(function()
                    writefile("NotSameServers.json", HttpService:JSONEncode(AllIDs))
                end)

                -- Dịch chuyển đến server
                game:GetService("TeleportService"):TeleportToPlaceInstance(PlaceID, ID, LocalPlayer)
                wait(4)
            end
        end
    end
end

function Teleport()
    while wait() do
        pcall(function()
            TPReturner()
            if foundAnything ~= "" then
                TPReturner()
            end
        end)
    end
end

-- Khi người dùng nhấp vào nút "Hop Server"
textButton.MouseButton1Click:Connect(function()
    Teleport()
end)