local Material = loadstring(game:HttpGet("https://raw.githubusercontent.com/Kinlei/MaterialLua/master/Module.lua"))()
local Player = game:GetService("Players").LocalPlayer
local Camera = game:GetService("Workspace").CurrentCamera
local mouse = Player:GetMouse()
local RS = game:GetService("RunService")
local Center = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y + 150 / 2)
local teamCheck = true
local enabled = false
local espenabled = false
local UIS = game:GetService("UserInputService")

local UI = Material.Load({
    Title = "Allinity Hub",
    Style = 1,
    SizeX = 400,
    SizeY = 300,
    Theme = "Jester"
})

UI.Banner({
	Text = "Welcome! Thanks for using Allinity Hub! Don't forget to vouch or like my post ;)"
})

local Page = UI.New({
    Title = "Arsenal"
})

Page.Button({
    Text = "Silent Aim (T For TeamCheck = For Toggle)",
    Callback = function()
        while true do
            wait(10)

            function getClosestPlayerToCursor() [nonamecall]
                local closestPlayer = nil
                local shortestDistance = math.huge
            
            for i, v in pairs(game:GetService("Players"):GetPlayers()) do
            if v.Name ~= Player.Name then
            if v.Character and v.Character:FindFirstChild("Humanoid") and v.Character.Humanoid.Health ~= 0 and v.Character:FindFirstChild("HumanoidRootPart") and v.Character:FindFirstChild("Head") and teamCheck and v.Team ~= Player.Team then
                local pos = Camera:WorldToViewportPoint(v.Character.HumanoidRootPart.Position)
                local magnitude = (Vector2.new(pos.X, pos.Y) - Vector2.new(mouse.X, mouse.Y)).magnitude
            
                if magnitude < shortestDistance then
                    closestPlayer = v
                    shortestDistance = magnitude
                end
            elseif v.Character and v.Character:FindFirstChild("Humanoid") and v.Character.Humanoid.Health ~= 0 and v.Character:FindFirstChild("HumanoidRootPart") and v.Character:FindFirstChild("Head") and not teamCheck then
                local pos = Camera:WorldToViewportPoint(v.Character.HumanoidRootPart.Position)
                local magnitude = (Vector2.new(pos.X, pos.Y) - Vector2.new(mouse.X, mouse.Y)).magnitude
            
                if magnitude < shortestDistance then
                    closestPlayer = v
                    shortestDistance = magnitude
                end
            end
            end
            end
            
            return closestPlayer or Player
            end
            
            game:GetService("UserInputService").InputBegan:Connect(function(input, onGui)
            if not onGui and input.KeyCode == Enum.KeyCode.T then
            teamCheck = not teamCheck
            end
            end)

            game:GetService("UserInputService").InputBegan:Connect(function(input, onGui)
            if not onGui and input.KeyCode == Enum.KeyCode.Equals then
            enabled = not enabled
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
            
            if tostring(method) == "FireServer" and tostring(args[1]) == "HitPart" then
            args[2] = getClosestPlayerToCursor().Character.HumanoidRootPart
            args[3] = getClosestPlayerToCursor().Character.HumanoidRootPart.Position
            
            return oldNamecall(unpack(args))
            end
            
            return oldNamecall(...)
            end)
            
            if setreadonly then setreadonly(mt, true) else make_writeable(mt, false)
            end
        end
    end,
            
Menu = {
Information = function(self)
   UI.Banner({
       Text = "Does what the name says"            
   })
end
}
})

Page.Button({
    Text = "NameTags (Z To Toggle)",
    Callback = function()
        while true do
            wait(10)
        
            function WTS(part)
                local screen = workspace.CurrentCamera:WorldToViewportPoint(part.Position)
                return Vector2.new(screen.x, screen.y)
                end
                
                function ESPText(part, color)
                local name = Drawing.new("Text")
                name.Text = part.Parent.Name
                name.Color = color
                name.Position = WTS(part)
                name.Size = 20.0
                name.Outline = true
                name.Center = true
                name.Visible = true
                
                game:GetService("RunService").Stepped:connect(function()
                pcall(function()
                local destroyed = not part:IsDescendantOf(workspace)
                if destroyed and name ~= nil then
                name:Remove()
                end
                if part ~= nil then
                name.Position = WTS(part)
                end
                local _, screen = workspace.CurrentCamera:WorldToViewportPoint(part.Position)
                if screen then
                name.Visible = true
                else
                name.Visible = false
                end
                end)
                end)
                end
                
                local players = game.Players:getChildren()
                for i=1,#players do
                if players[i] ~= game.Players.LocalPlayer then
                if players[i].Character:findFirstChild("HumanoidRootPart") then
                ESPText(players[i].Character.HumanoidRootPart, Color3.new(255/255,0/255,0/255))
                end
                players[i].CharacterAdded:connect(function(char)
                local hrp = char:WaitForChild("HumanoidRootPart")
                ESPText(hrp, Color3.new(255/255,0/255,0/255))
                end)
                end
                end
                
                game.Players.PlayerAdded:Connect(function(plr)
                plr.CharacterAdded:connect(function(char)
                local hrp = char:WaitForChild("HumanoidRootPart")
                ESPText(hrp, Color3.new(255/255,0/255,0/255))
                end)
                end)
            
                UIS.InputBegan:Connect(function(a)
                    if a.KeyCode == Enum.KeyCode.Z then
                    espenabled = false
                    end
                    end)
            end
        end,
Menu = {
    Information = function(self)
        UI.Banner({
            Text = "Im incompetent and cant get the script to toggle with a toggle from the ui lib"
        })
    end
}
})


Page.Button({
    Text = "OP Obvious HitBox Extender",
    Callback = function()
        local size = 30
        local hrpsize = 28
        for i,v in next, game.Players:GetPlayers() do
            if v.Name ~= game.Players.LocalPlayer.Name then
                game:GetService("RunService").Heartbeat:Connect(function()
                    for _, e in next, getconnections(v.Character.HeadHB:GetPropertyChangedSignal("Size")) do
                    e:Disable()
                    end

                    for _, e in next, getconnections(v.Character.HeadHB.Changed) do
                    e:Disable()
                    end

                    pcall(function()
                        v.Character.HeadHB.Size = Vector3.new(size, size, size)
                        v.Character.HeadHB.Transparency = 0.5
                        v.Character.HeadHB.CanCollide = false
                        v.Character.HumanoidRootPart.Size = Vector3.new(hrpsize, hrpsize, hrpsize)
                        v.Character.HumanoidRootPart.CanCollide = false
                    end)
                end)
            end
        end
    end,
    Menu = {
        Information = function(self)
            UI.Banner({
                Text = "More op version of HItbox Extender, may have to re execute every once and a while"            
            })
        end
    }
    })

local Page = UI.New({
    Title = "Mod Weapon/Knife"
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
                Text = "Mod Ammo"            
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
