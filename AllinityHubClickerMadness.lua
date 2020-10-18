local Material = loadstring(game:HttpGet("https://raw.githubusercontent.com/Kinlei/MaterialLua/master/Module.lua"))()

local UI = Material.Load({
    Title = "Allinity Hub",
    Style = 1,
    SizeX = 400,
    SizeY = 300,
    Theme = "Jester"
})

UI.Banner({
	Text = "Welcome! Thanks for using Allinity Hub"
})

local Page = UI.New({
    Title = "Main"
})

Page.Toggle({
    Text = "Auto Click",
    Callback = function(value)
        _G.click = value

        while true do
            if not _G.click then return end
            local A_1 = "1000000000" -- amount of clicks
            local Event = game:GetService("ReplicatedStorage").Aero.AeroRemoteServices.ClickService.Click
            Event:FireServer(A_1)
            wait()
        end
        Enabled = false
    end,
Menu = {
    Information = function(self)
        UI.Banner({
            Text = "Auto clicks very op"
        })
    end
}
})

Page.Toggle({
    Text = "Teleport Gems/Clicks To You",
    Callback = function(value)
        _G.Farm = value

        while true do
            if not _G.Farm then return end
            for i,v in pairs(workspace.ScriptObjects.BasePickup:GetChildren()) do
                if v.Name == "HumanoidRootPart" then
                    v.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame 
                    wait()
                end
                Enabled = false
            end
        end
    end,
Menu = {
    Information = function(self)
        UI.Banner({
            Text = "Teleports Gems/Clicks To You"
        })
    end
}
})

local Page = UI.New({
    Title = "Misc"
})

Page.Dropdown({
    Text = "Give Gamepass",
    Callback = function(value)
        game:GetService"Players".LocalPlayer.Gamepasses[value].Value = true
    end,
    Options = {"Sprint", "AutoRebirth", "ExplosiveCursors", "DoubleGems", "VIP", "Luck", "UnlimitedPets", "DoubleClicks", "TripleHatch"}
})

Page.Dropdown({
    Text = "Rebirth",
    Callback = function(value)
        game:GetService("ReplicatedStorage").Aero.AeroRemoteServices.RebirthService.BuyRebirths:FireServer(value)
    end,
    Options = {"1", "10", "100", "1000", "10000", "100000", "1000000", "10000000", "100000000", "1000000000", "10000000000", "100000000000"}
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
