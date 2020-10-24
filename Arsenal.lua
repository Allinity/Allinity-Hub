local Material = loadstring(game:HttpGet("https://raw.githubusercontent.com/Kinlei/MaterialLua/master/Module.lua"))()

local UI = Material.Load({
    Title = "Allinity Hub",
    Style = 1,
    SizeX = 500,
    SizeY = 300,
    Theme = "Jester"
})

UI.Banner({
	Text = "Welcome! Thanks for using Allinity Hub! Don't forget to vouch or like my post ;)"
})

local Page = UI.New({
    Title = "Main"
})

Page.Toggle({
    Text = 'Silent Aim',
    Callback = function(arg)
        getgenv().SilentAim = arg
    end
})

Page.Toggle({
    Text = 'Team Check',
    Callback = function(arg)
        teamCheck = arg
    end
})

getgenv().SilentAim = false

local localPlayer = game:GetService("Players").LocalPlayer
local currentCamera = game:GetService("Workspace").CurrentCamera
local mouse = localPlayer:GetMouse()
local teamCheck = false

function getClosestPlayerToCursor() [nonamecall]
    local closestPlayer = nil
    local shortestDistance = math.huge
    
    for i, v in pairs(game:GetService("Players"):GetPlayers()) do
        if v.Name ~= localPlayer.Name then
            if v.Character and v.Character:FindFirstChild("Humanoid") and v.Character.Humanoid.Health ~= 0 and v.Character:FindFirstChild("HumanoidRootPart") and v.Character:FindFirstChild("Head") and teamCheck and v.Team ~= localPlayer.Team then
                local pos = currentCamera:WorldToViewportPoint(v.Character.HumanoidRootPart.Position)
                local magnitude = (Vector2.new(pos.X, pos.Y) - Vector2.new(mouse.X, mouse.Y)).magnitude

                if magnitude < shortestDistance then
                    closestPlayer = v
                    shortestDistance = magnitude
                end
            elseif v.Character and v.Character:FindFirstChild("Humanoid") and v.Character.Humanoid.Health ~= 0 and v.Character:FindFirstChild("HumanoidRootPart") and v.Character:FindFirstChild("Head") and not teamCheck then
                local pos = currentCamera:WorldToViewportPoint(v.Character.HumanoidRootPart.Position)
                local magnitude = (Vector2.new(pos.X, pos.Y) - Vector2.new(mouse.X, mouse.Y)).magnitude

                if magnitude < shortestDistance then
                    closestPlayer = v
                    shortestDistance = magnitude
                end
            end
        end
    end
    
    return closestPlayer or localPlayer
end

game:GetService("UserInputService").InputBegan:Connect(function(input, onGui)
    if not onGui and input.KeyCode == Enum.KeyCode.T then
        teamCheck = not teamCheck
    end
end)

local mt = getrawmetatable(game)
local oldNamecall = mt.__namecall
if setreadonly then setreadonly(mt, false) else make_writeable(mt, true) end
local namecallMethod = getnamecallmethod or get_namecall_method
local newClose = newcclosure or function(f) return f end

mt.__namecall = newClose(function(...) [nonamecall]
    local method = namecallMethod()
    local args = {...}

if getgenv().SilentAim == true then
    if tostring(method) == "FireServer" and tostring(args[1]) == "HitPart" then
        args[2] = getClosestPlayerToCursor().Character.Head
        args[3] = getClosestPlayerToCursor().Character.Head.Position

        return oldNamecall(unpack(args))
    end
end

    return oldNamecall(...)
end)

local Page = UI.New({
    Title = 'Visuals'
})

Page.Toggle({
    Text = 'Enable ESP',
    Callback = function(arg)
        getgenv().ESPenabled = arg
    end
})

Page.Toggle({
    Text = 'Enable Names',
    Callback = function(arg)
        getgenv().Names = arg
    end
})

Page.Toggle({
    Text = 'Enable Chams',
    Callback = function(arg)
        getgenv().Chams = arg
    end
})

Page.Toggle({
    Text = 'Enable Tracers',
    Callback = function(arg)
        getgenv().Tracers = arg
    end
})

Page.Toggle({
    Text = 'Show Team Colors',
    Callback = function(arg)
        getgenv().ShowTeamColors = arg
    end
})

Page.Toggle({
    Text = 'Show Main Team',
    Callback = function(arg)
        getgenv().ShowMainTeam = arg
    end
})

Page.Slider({
    Text = "Max Distance",
    Callback = function(arg)
        getgenv().MaxDistance = arg
    end,
    Min = 1,
    Max = 5000,
    Def = 1
})

getgenv().ESPenabled = false
getgenv().MaxDistance = 750
getgenv().Names = false
getgenv().Chams = false
getgenv().Tracers = false
getgenv().espDefaultColor = Color3.fromRGB(255, 255, 255)
getgenv().ShowTeamColors = false
getgenv().ShowMainTeam = false
local Player = game.Players.LocalPlayer
local RS = game:GetService("RunService")
local Camera = workspace.CurrentCamera
local Center = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y + 150 / 2)
function PlayerLeft(plr, Tracer, Cham)
    Tracer:Remove()
    Cham:Remove()
end
function CreateLabel(OtherPlayer)
    local Label = Drawing.new("Text")
    Label.Text = OtherPlayer.Name
    Label.Center = true
    Label.Outline = false
    Label.Visible = true
    return Label
end
function CreateSquare()
    local Square = Drawing.new("Square")
    Square.Visible = true
    Square.Filled = false
    Square.Thickness = 1
    return Square
end
function CreateLine()
    local Line = Drawing.new("Line")
    Line.Visible = true
    Line.From = Vector2.new(Center.x, Center.y)
    return Line
end
function UpdateName(Label)
    if getgenv().Names ~= true then
        Label.Visible = false
    else
        Label.Visible = true
    end
end
function UpdateChams(Cham)
    if getgenv().Chams ~= true then
        Cham.Visible = false
    else
        Cham.Visible = true
    end
end
function UpdateTracers(Tracer)
    if getgenv().Tracers ~= true then
        Tracer.Visible = false
    else
        Tracer.Visible = true
    end
end
function GetHumanoidRootPartPos()
    local HumanoidRootPartP = Vector3.new(0, 0, 0)
    if Player.Character ~= nil then
        local HumanoidRootPart = Player.Character:FindFirstChild("HumanoidRootPart")
        if HumanoidRootPart then
            HumanoidRootPartP = HumanoidRootPart.Position
        end
    end
    return HumanoidRootPartP
end
function GetPlrHumanoidRootPartPos(OtherPlayer, Tracer, Cham, Label)
    HumanoidRootPartP = GetHumanoidRootPartPos()
    local AimPosition
    if OtherPlayer.Character == nil then
        AimPosition = Vector3.new(0, 0, 0)
    else
        local HumanoidRootPart = OtherPlayer.Character:FindFirstChild("HumanoidRootPart")
        if HumanoidRootPart then
            if (HumanoidRootPartP - HumanoidRootPart.Position).magnitude <= tonumber(getgenv().MaxDistance) then
                Tracer.Visible = true
                Cham.Visible = true
                Label.Visible = true
            else
                Tracer.Visible = false
                Cham.Visible = false
                Label.Visible = false
            end
            Label.Size = 17.5
            Cham.Size = Vector2.new(30, 45)
            AimPosition = HumanoidRootPart.Position
        else
            AimPosition = Vector3.new(0, 0, 0)
        end
    end
    return AimPosition
end
function SetChamTracerColor(OtherPlayer, Tracer, Cham, Label)
    pcall(
        function()
            if getgenv().ShowTeamColors ~= false then
                if OtherPlayer.Team ~= nil then
                    Tracer.Color = OtherPlayer.Team.TeamColor.Color
                    Cham.Color = OtherPlayer.Team.TeamColor.Color
                    Label.Color = OtherPlayer.Team.TeamColor.Color
                else
                    Tracer.Color = getgenv().espDefaultColor
                    Cham.Color = getgenv().espDefaultColor
                    Label.Color = getgenv().espDefaultColor
                end
            else
                Tracer.Color = getgenv().espDefaultColor
                Cham.Color = getgenv().espDefaultColor
                Label.Color = getgenv().espDefaultColor
            end
        end
    )
end
function SetShowMainTeam(OtherPlayer, Tracer, Cham, Label)
    if getgenv().ShowMainTeam == true then
        Tracer.Visible = true
        Cham.Visible = true
        Label.Visible = true
    else
        if Player.Team ~= nil then
            if Player.Team.Name == OtherPlayer.Team.Name then
                Tracer.Visible = false
                Cham.Visible = false
                Label.Visible = false
            else
                Tracer.Visible = true
                Cham.Visible = true
                Label.Visible = true
            end
        end
    end
end
function UpdateChamsAndTracerPos(OtherPlayer, ScreenPosition, Tracer, Cham, Label)
    if ScreenPosition.Z > 0 and OtherPlayer.Character ~= nil then
        Tracer.Visible = true
        Cham.Visible = true
        SetShowMainTeam(OtherPlayer, Tracer, Cham, Label)
        UpdateName(Label)
        UpdateChams(Cham)
        UpdateTracers(Tracer)
        SetChamTracerColor(OtherPlayer, Tracer, Cham, Label)
        if getgenv().ESPenabled ~= true then Tracer.Visible = false;Cham.Visible = false;Label.Visible = false; end;
        Cham.Position = Vector2.new(ScreenPosition.x, ScreenPosition.y) + Vector2.new(-17.5, -5)
        Tracer.To = Vector2.new(ScreenPosition.x, ScreenPosition.y)
        Label.Position = Cham.Position + Vector2.new(10, -10)
    else
        Tracer.Visible = false
        Cham.Visible = false
        Label.Visible = false
    end
end
for i, OtherPlayer in pairs(game.Players:GetPlayers()) do
    if OtherPlayer.Name ~= Player.Name then
        local PlayerLeftB = false
        local Label = CreateLabel(OtherPlayer)
        local Square = CreateSquare()
        local Line = CreateLine()
        local AimPosition
        local ScreenPosition
        game.Players.PlayerRemoving:Connect(
            function(PlayerLeaving)
                if PlayerLeaving.Name == OtherPlayer.Name then
                    PlayerLeftB = true
                    PlayerLeft(plr, Line, Square)
                end
            end
        )
        local function RSL()
            if PlayerLeftB ~= true then
                local HumanoidRootPartP = GetHumanoidRootPartPos()
                AimPosition = GetPlrHumanoidRootPartPos(OtherPlayer, Line, Square, Label)
                ScreenPosition = Vector3.new(0, 0, 0)
                ScreenPosition, V = Camera:WorldToViewportPoint(AimPosition)
                UpdateChamsAndTracerPos(OtherPlayer, ScreenPosition, Line, Square, Label)
                if getgenv().ESPenabled ~= true then Line.Visible = false;Square.Visible = false;Label.Visible = false; end;
            end
        end
        RS.RenderStepped:connect(RSL)
    end
end

game.Players.PlayerAdded:Connect(
    function(OtherPlayer)
        if OtherPlayer.Name ~= Player.Name then
            local PlayerLeftB = false
            local Label = CreateLabel(OtherPlayer)
            local Square = CreateSquare()
            local Line = CreateLine()
            local AimPosition
            local ScreenPosition
            game.Players.PlayerRemoving:Connect(
                function(PlayerLeaving)
                    if PlayerLeaving.Name == OtherPlayer.Name then
                        PlayerLeftB = true
                        PlayerLeft(plr, Line, Square)
                    end
                end
            )
            local function RSL()
                if PlayerLeftB ~= true and getgenv().ESPenabled ~= false then
                    local HumanoidRootPartP = GetHumanoidRootPartPos()
                    AimPosition = GetPlrHumanoidRootPartPos(OtherPlayer, Line, Square, Label)
                    ScreenPosition = Vector3.new(0, 0, 0)
                    ScreenPosition, V = Camera:WorldToViewportPoint(AimPosition)
                    UpdateChamsAndTracerPos(OtherPlayer, ScreenPosition, Line, Square, Label)
                end
            end
            RS.RenderStepped:connect(RSL)
        end
    end
)

local Page = UI.New({
    Title = "Mod Weapon/Knife"
})

Page.Button({
    Text = "Mod Ammo",
    Callback = function()

        local a
        local b
        for i,v in next, getgc() do
            if (type(v) == 'function') and (debug.getinfo(v).name == 'firebullet') then
                a = getfenv(v);
                b = v
            end
        end
        game.RunService.Heartbeat:Connect(function()
            debug.setupvalue(b,5,420)
        end)
    end,
    Menu = {
        Information = function(self)
            UI.Banner({
                Text = "Mod Ammo"            
            })
        end
    }
    })

Page.Button({
    Text = "Mod Recoil",
    Callback = function()

        local a
        local b
        for i,v in next, getgc() do
            if (type(v) == 'function') and (debug.getinfo(v).name == 'firebullet') then
                a = getfenv(v);
                b = v
            end
        end
        game.RunService.Heartbeat:Connect(function()
            a.recoil = 0
        end)
    end,
    Menu = {
        Information = function(self)
            UI.Banner({
                Text = "Mod Recoil"            
            })
        end
    }
    })

    Page.Button({
        Text = "Mod Spread",
        Callback = function()
    
                local a
                local b
                for i,v in next, getgc() do
                    if (type(v) == 'function') and (debug.getinfo(v).name == 'firebullet') then
                        a = getfenv(v);
                        b = v
                    end
                end
                game.RunService.Heartbeat:Connect(function()
                    a.currentspread = 0
                end)
            end,
    Menu = {
        Information = function(self)
            UI.Banner({
                Text = "Mod Spread"            
            })
        end
    }
    })
    
    Page.Button({
        Text = "Make Automatic",
        Callback = function()
    
                local a
                local b
                for i,v in next, getgc() do
                    if (type(v) == 'function') and (debug.getinfo(v).name == 'firebullet') then
                        a = getfenv(v);
                        b = v
                    end
                end
                game.RunService.Heartbeat:Connect(function()
                    a.mode = "automatic"
                end)
            end,
    Menu = {
        Information = function(self)
            UI.Banner({
                Text = "Makes guns automatic"            
            })
        end
    }
    })
    
    Page.Button({
        Text = "Mod Firerate",
        Callback = function()
    
                local a
                local b
                for i,v in next, getgc() do
                    if (type(v) == 'function') and (debug.getinfo(v).name == 'firebullet') then
                        a = getfenv(v);
                        b = v
                    end
                end
                game.RunService.Heartbeat:Connect(function()
                    a.DISABLED = false
                    a.DISABLED2 = false
                end)
            end,
    Menu = {
        Information = function(self)
            UI.Banner({
                Text = "Makes gun go brrrr"            
            })
        end
    }
    })

local Page = UI.New({
    Title = 'Misc/LocalPlayer'
})

Page.Slider({
    Text = "FOV",
    Callback = function(value)
        game:GetService("Players").LocalPlayer.Settings.FOV.Value = value
    end,
    Min = 50,
    Max = 120,
    Def = 50
})

Page.TextField({
    Text = "Knife Changer",
    Callback = function(value)
        game:GetService("Players").LocalPlayer.Data.Melee.Value = value
    end
})

local Page = UI.New({
    Title = 'Credits'
})

Page.Button({
    Text = "Twink Marie UI Lib Creator V3RM",
    Callback = function()
        setclipboard('https://v3rmillion.net/member.php?action=profile&uid=1078854')
    end,
Menu = {
    Information = function(self)
       UI.Banner({
           Text = "Click To Copy UI Lib Creator's V3rm"            
       })
    end
    }
    })

Page.Button({
    Text = "Allinity Hub Creator V3rm",
    Callback = function()
        setclipboard('https://v3rmillion.net/member.php?action=profile&uid=1806998')
    end,
Menu = {
    Information = function(self)
       UI.Banner({
           Text = "Click To Copy Allinity Hub Creator's V3rm"            
       })
    end
    }
    })

Page.Button({
    Text = "Allinity Hub Creator Discord",
    Callback = function()
        setclipboard('Allinity#6969')
    end,
Menu = {
    Information = function(self)
       UI.Banner({
           Text = "Click To Copy Allinity Hub Creator's Discord"            
       })
    end
    }
    })
