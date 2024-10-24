getgenv().Setting = {
    ["Hunt"] = {
        ["Team"] = "Pirates",
        ["Min"] = 0,
        ["Max"] = 30000000,
    },
    ["Webhook"] = {
        ["Enabled"] = true, 
        ["Url"] = ""
    },
    ["Skip"] = {
        ["V4"] = true,
        ["Fruit"] = true,
        ["FruitList"] = {
            "Leopard",
            "Venom",
            "Dough",
            "Portal"
        }
    },
    ["Chat"] = {
        ["Enabled"] = false,
        ["List"] = {""},
    },
    ["Click"] = {
        ["AlwaysClick"] = false,
        ["FastClick"] = false
    },
    ["Another"] = {
        ["V3"] = true,
        ["CustomHealth"] = true,
        ["Health"] = 12000,
        ["V4"] = true,
        ["LockCamera"] = false,
        ["FPSBoots"] = false,
        ["WhiteScreen"] = false,
        ["BypassTp"] = true
    },
    ["SafeHealth"] = {
        ["Health"] = 6000,
        ["HighY"] = 1500
    },
    ["Melee"] = {
        ["Enable"] = true,
        ["Delay"] = 2.5,
        ["Z"] = {["Enable"] = true, ["HoldTime"] = 1.25},
        ["X"] = {["Enable"] = true, ["HoldTime"] = 0},
        ["C"] = {["Enable"] = true, ["HoldTime"] = 0},
        ["V"] = {["Enable"] = false, ["HoldTime"] = 0}
    },
    ["Fruit"] = {
        ["Enable"] = true,
        ["Delay"] = 2,
        ["Z"] = {["Enable"] = true, ["HoldTime"] = 0},
        ["X"] = {["Enable"] = true, ["HoldTime"] = 0},
        ["C"] = {["Enable"] = true, ["HoldTime"] = 0},
        ["V"] = {["Enable"] = true, ["HoldTime"] = 1.25},
        ["F"] = {["Enable"] = false, ["HoldTime"] = 0}
    },
    ["Sword"] = {
        ["Enable"] = true,
        ["Delay"] = 1,
        ["Z"] = {["Enable"] = true, ["HoldTime"] = 0},
        ["X"] = {["Enable"] = true, ["HoldTime"] = 0}
    },
    ["Gun"] = {
        ["Enable"] = true,
        ["GunMode"] = false, 
        ["Delay"] = 1.75,
        ["Z"] = {["Enable"] = true, ["HoldTime"] = 0},
        ["X"] = {["Enable"] = true, ["HoldTime"] = 0}
    }
}

-- Functionality without unnecessary strings
repeat task.wait() until game:IsLoaded()
repeat task.wait() until game.Players
repeat task.wait() until game.Players.LocalPlayer
repeat task.wait() until game.Players.LocalPlayer:FindFirstChild("PlayerGui")
repeat task.wait() until game.Players.LocalPlayer.PlayerGui:FindFirstChild("Main");

if game:GetService("Players").LocalPlayer.PlayerGui.Main:FindFirstChild("ChooseTeam") then
    repeat wait()
        if game:GetService("Players").LocalPlayer.PlayerGui:WaitForChild("Main").ChooseTeam.Visible == true then
            if getgenv().Setting.Hunt.Team == "Marines" then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetTeam", "Marines")
            else
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetTeam", "Pirates")
            end
        end
    until game.Players.LocalPlayer.Team ~= nil and game:IsLoaded()
end

if game.PlaceId == 7449423635 then
    World3 = true
else
    game.Players.LocalPlayer:Kick("Only Support BF Sea 3")
end

-- Continue functionality...