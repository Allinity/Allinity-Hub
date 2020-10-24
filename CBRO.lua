local Material = loadstring(game:HttpGet("https://raw.githubusercontent.com/Kinlei/MaterialLua/master/Module.lua"))()
local function CreateInstance(cls,props)
    local inst = Instance.new(cls)
    for i,v in pairs(props) do
        inst[i] = v
    end
    return inst
    end
     
    local players = game:GetService"Players"
    local Player = game:GetService("Players").LocalPlayer
    local Camera = game:GetService("Workspace").CurrentCamera
    local mouse = Player:GetMouse()
    local RS = game:GetService("RunService")
    local Center = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y + 150 / 2)
    local teamCheck = true
    local enabled = false
    local UIS = game:GetService("UserInputService")
    local localp = players.LocalPlayer
    local uis = game:GetService"UserInputService"
    
    local cheats = {
    
        esp = true;
        esptarget = "Enemy";
        bomb = true;
        chams = true;
        chamstarget = "Enemy";
        weapons = true;
        fovchanger = true;
    
    esp_enemycolor = Color3.fromRGB(220,80,40);
    esp_teamcolor = Color3.fromRGB(40, 220, 220);
    esp_bombcolor = Color3.fromRGB(220,60,210);
    esp_bombcarriercolor = Color3.fromRGB(220,210,40);
    esp_weaponcolor = Color3.fromRGB(200,200,200);
    esp_itemtextcolor = Color3.fromRGB(220,60,210);
    
    weptype = "Pistols";
    }
    
    local espTargets = {"Enemy", "Both"}
    
    local espfolder = Instance.new("Folder", game:GetService"CoreGui")
    espfolder.Name = "espstuff"
    local bombfolder = Instance.new("Folder", game:GetService"CoreGui")
    bombfolder.Name = "bomb"
    local weaponfolder = Instance.new("Folder", game:GetService"CoreGui")
    weaponfolder.Name = "weapons"

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

Page.Button({
    Text = "ESP",
    Callback = function()
        local function addEsp(object, parent, size, identifier)
            local billboard = Instance.new("BillboardGui", parent)
            billboard.Size = size
            if identifier == "object" then
                billboard.Adornee = object
            end
            billboard.AlwaysOnTop = true
            billboard.Name = object.Name
         
            local lines = Instance.new("Frame", billboard)
            lines.Name = "lines"
            lines.Size = UDim2.new(1,-2,1,-2)
            lines.Position = UDim2.new(0,1,0,1)
            lines.BackgroundTransparency = 1
         
            local outlines = Instance.new("Folder", lines)
            outlines.Name = "outlines"
            local inlines = Instance.new("Folder", lines)
            inlines.Name = "inlines"
         
            local outline1 = Instance.new("Frame", outlines)
            outline1.Name = "left"
            outline1.BorderSizePixel = 0
            outline1.BackgroundColor3 = Color3.new(0,0,0)
            outline1.Size = UDim2.new(0,-1,1,0)
         
            local outline2 = Instance.new("Frame", outlines)
            outline2.Name = "right"
            outline2.BorderSizePixel = 0
            outline2.BackgroundColor3 = Color3.new(0,0,0)
            outline2.Position = UDim2.new(1,0,0,0)
            outline2.Size = UDim2.new(0,1,1,0)
         
            local outline3 = Instance.new("Frame", outlines)
            outline3.Name = "up"
            outline3.BorderSizePixel = 0
            outline3.BackgroundColor3 = Color3.new(0,0,0)
            outline3.Size = UDim2.new(1,0,0,-1)
         
            local outline4 = Instance.new("Frame", outlines)
            outline4.Name = "down"
            outline4.BorderSizePixel = 0
            outline4.BackgroundColor3 = Color3.new(0,0,0)
            outline4.Position = UDim2.new(0,0,1,0)
            outline4.Size = UDim2.new(1,0,0,1)
         
            local inline1 = Instance.new("Frame", inlines)
            inline1.Name = "left"
            inline1.BorderSizePixel = 0
            inline1.Size = UDim2.new(0,1,1,0)
         
            local inline2 = Instance.new("Frame", inlines)
            inline2.Name = "right"
            inline2.BorderSizePixel = 0
            inline2.Position = UDim2.new(1,0,0,0)
            inline2.Size = UDim2.new(0,-1,1,0)
         
            local inline3 = Instance.new("Frame", inlines)
            inline3.Name = "up"
            inline3.BorderSizePixel = 0
            inline3.Size = UDim2.new(1,0,0,1)
         
            local inline4 = Instance.new("Frame", inlines)
            inline4.Name = "down"
            inline4.BorderSizePixel = 0
            inline4.Position = UDim2.new(0,0,1,0)
            inline4.Size = UDim2.new(1,0,0,-1)
         
            if identifier == "object" then
                local label = Instance.new("TextLabel", billboard)
                label.Name = "label"
                label.Size = UDim2.new(1,0,1,0)
                label.BackgroundTransparency = 1
                label.TextStrokeTransparency = 0
                label.TextColor3 = cheats.esp_itemtextcolor
                label.Text = object.Name
                label.Font = Enum.Font.Code
                label.TextSize = 16
                object.AncestryChanged:connect(function()
                    if object.Name ~= "C4" then
                        if object.Parent ~= workspace.Debris then
                            billboard:Destroy()
                        end
                    end
                end)
            end
         
            if identifier == "player" then
                spawn(function()
                    while object do
                        wait()
                        if cheats.esp then
                            if object.Character and object.Character:FindFirstChild"LowerTorso" then
                                local head = object.Character:FindFirstChild"Head"
                                local lowerpart = object.Character:FindFirstChild"LeftFoot"
                                local leftarm = object.Character:FindFirstChild"LeftUpperArm"
                                local rightarm = object.Character:FindFirstChild"RightUpperArm"
                                if (head and lowerpart) and (leftarm and rightarm) then
                                    billboard.Size = UDim2.new(((leftarm.Position+Vector3.new(0,0.5,0))-(rightarm.Position-Vector3.new(0,0.5,0))).magnitude,0,((head.Position+Vector3.new(0,1,0))-(lowerpart.Position)).magnitude,0)
                                end
                                local color = cheats.esp_enemycolor
                                if object.Team ~= localp.Team then
                                    color = cheats.esp_enemycolor
                                    billboard.Adornee = object.Character.LowerTorso
                                else
                                    if cheats.esptarget == "Both" then
                                        color = cheats.esp_teamcolor
                                        billboard.Adornee = object.Character.LowerTorso
                                    else
                                        billboard.Adornee = nil
                                    end
                                end
                                if object.Name == workspace.Status.HasBomb.Value then
                                    color = cheats.esp_bombcarriercolor
                                end
                                inline1.BackgroundColor3 = color
                                inline2.BackgroundColor3 = color
                                inline3.BackgroundColor3 = color
                                inline4.BackgroundColor3 = color
                            end
                        else
                            billboard.Adornee = nil
                        end
                    end
                end)
            end
        end
        
        players.PlayerAdded:connect(function(player)
            local size = UDim2.new(4,0,5.6,0)
            addEsp(player, espfolder, size, "player")
        end)
         
        for _,player in pairs(players:GetChildren()) do
            if player.Name ~= localp.Name and not espfolder:FindFirstChild(player.Name) then
                local size = UDim2.new(4,0,5.6,0)
                addEsp(player, espfolder, size, "player")
            end
        end
         
        players.PlayerRemoving:connect(function(player)
            if espfolder:FindFirstChild(player.Name) then
                espfolder[player.Name]:Destroy()
            end
        end)
         
        local function objectInWorkspace(child)
            if cheats.weapons then
                local primaries = {semis, heavies, rifles}
                for _,v in pairs(primaries) do
                    for _,w in pairs(v) do
                        if child.Name == w then
                            local size = UDim2.new(1.4,0,1.4,0)
                            addEsp(child, bombfolder, size, "object")
                        end
                    end
                end
                for _,v in pairs(pistols) do
                    if child.Name == v then
                        local size = UDim2.new(1.4,0,1.4,0)
                        addEsp(child, bombfolder, size, "object")
                    end
                end
            end
            if child.Name == "C4" then
                if cheats.bomb then
                    if bombfolder:FindFirstChild"C4" then
                        bombfolder.C4.Adornee = child
                    else
                        local size = UDim2.new(1.4,0,1.4,0)
                        addEsp(child, bombfolder, size, "object")
                        for _,v in pairs(bombfolder.C4.lines.inlines:GetChildren()) do
                            v.BackgroundColor3 = cheats.esp_bombcolor
                        end
                    end
                    if child.Parent == workspace then
                        for i=38,0,-1 do
                            wait(1)
                            bombfolder.C4.label.Text = "C4 - "..i
                        end
                        bombfolder.C4.label.Text = "C4"
                    end
                end
            end
        end
    end
})

local Page = UI.New({
    Title = "Visuals"
})

Page.Button({
    Text = "Bullet Tracers",
    Callback = function()
        local lifetime = 5
        local material = Enum.Material.ForceField
        local thickness = 0.1
        local color = Color3.fromRGB(245, 137, 213)

        local mt = getrawmetatable(game)
        local old = mt.__namecall
        local lp = game:GetService('Players').LocalPlayer
        local rs = game:GetService('RunService').RenderStepped
        local lasthittick = tick()
        function createBeam(p1, p2)
            local beam = Instance.new("Part", workspace)
            beam.Anchored = true
            beam.Anchored = true
            beam.CanCollide = false
            beam.Material = material
            beam.Color = color
            beam.Size = Vector3.new(thickness, thickness, (p1 - p2).magnitude)
            beam.CFrame = CFrame.new(p1, p2) * CFrame.new(0, 0, -beam.Size.Z / 2)
            return beam
        end
        
        setreadonly(mt, false)
        mt.__namecall = newcclosure(function(self, ...)
            local args = {...}
            if getnamecallmethod() == 'FireServer' and self.Name == 'HitPart' and tick() - lasthittick > 0.005 then
                lasthittick = tick()
                spawn(function()
                    local beam = createBeam(lp.Character.Head.CFrame.p, args[2])
                    for i = 1, 60 * lifetime do
                        rs:Wait()
                        beam.Transparency = i / (60 * lifetime)
                    end
                    beam:Destroy()
                end)
            end
            return old(self, ...)
        end)
        setreadonly(mt, true)
    end,
})

local Page = UI.New({
    Title = 'Mod Gun'
})

Page.Button({
    Text = "Infinite Ammo",
    Callback = function()
        for i,v in pairs(game:GetService("ReplicatedStorage").Weapons:GetDescendants()) do
            if v.Name == "Ammo" then
            v.Value = 9.0071993e+15
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
