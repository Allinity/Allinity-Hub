local Material = loadstring(game:HttpGet("https://raw.githubusercontent.com/Kinlei/MaterialLua/master/Module.lua"))()
local plr = game:GetService("Players").LocalPlayer
local RS = game:GetService("ReplicatedStorage")
local chr = plr.Character
local rtp = chr.HumanoidRootPart
local coinfolder = game:GetService("Workspace").Coins
local gemfolder = game:GetService("Workspace").Gems

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
    Title = "Texting Sim"
})

Page.Toggle({
    Text = "Auto Text",
    Callback = function(value)
        _G.text = value

        while true do
            if not _G.text then return end
            local A_1 = 'Phone'
            local Event = RS.Events.SendTexts
            Event:FireServer(A_1)
            wait()
        end
        Enabled = false
    end,
Menu = {
    Information = function(self)
        UI.Banner({
            Text = "Automatically Texts!"            
        })
    end
}
})

Page.Toggle({
    Text = "Tp Sell To You",
    Callback = function(value)
        _G.sell = value
        
        while true do
            if not _G.sell then return end
            local circle = game:GetService("Workspace").Scriptables.SellPlatform["Meshes/riong"]
            circle.CFrame = rtp.CFrame
            wait()
        end
        Enabled = false
    end,
Menu = {
    Information = function(self)
        UI.Banner({
            Text = "Teleports Sell To You!"            
        })
    end
}
})

Page.Toggle({
    Text = "Tp Coin Spawns To You",
    Callback = function(value)
        _G.coin = value
        
        while true do
            if not _G.coin then return end
            for i,v in pairs(coinfolder:GetChildren()) do
                v.CFrame = rtp.CFrame
                wait()
            end
            Enabled = false
        end
    end,
Menu = {
    Information = function(self)
        UI.Banner({
            Text = "Teleports Coin Spawns To You!"            
        })
    end
}
})

Page.Toggle({
    Text = "Tp Gem Spawns To You",
    Callback = function(value)
        _G.coin = value
        
        while true do
            if not _G.coin then return end
            for i,v in pairs(gemfolder:GetChildren()) do
                v.CFrame = rtp.CFrame
                wait()
            end
            Enabled = false
        end
    end,
Menu = {
    Information = function(self)
        UI.Banner({
            Text = "Teleports Gem Spawns To You!"            
        })
    end
}
})

local Page = UI.New({
    Title = "Misc"
})

Page.Button({
    Text = "Disable Text Pop Ups",
    Callback = function()
        plr.PlayerGui.ScreenGui:Destroy()
    end,
Menu = {
    Information = function(self)
        UI.Banner({
            Text = "Deletes Text Pop Ups"            
        })
    end
}
})

Page.Button({
    Text = "Disable Pet Pop Ups",
    Callback = function()
        plr.PlayerGui.PetOpen:Destroy()
    end,
Menu = {
    Information = function(self)
        UI.Banner({
            Text = "Deletes Pet Pop Ups"            
        })
    end
}
})

Page.Slider({
    Text = "WalkSpeed",
    Callback = function(value)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = value
    end,
    Min = 16,
    Max = 300,
    Def = 16
})

Page.Slider({
    Text = "JumpPower",
    Callback = function(value)
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = value
    end,
    Min = 50,
    Max = 300,
    Def = 50
})
