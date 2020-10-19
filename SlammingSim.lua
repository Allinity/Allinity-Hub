local Material = loadstring(game:HttpGet("https://raw.githubusercontent.com/Kinlei/MaterialLua/master/Module.lua"))()
local plr = game:service'Players'.LocalPlayer
local char = plr.Character
local rootpart = char.HumanoidRootPart
local gemfolder = game:GetService("Workspace").Collectibles.Server.Autumn

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
    Text = 'Auto Slam',
    Callback = function(value)
        _G.slam = value
        
        while true do
            if not _G.slam then return end
            local A_1 = 'ActivateEffect'
            local A_2 = 'Home'
            local Event = game:GetService("ReplicatedStorage").Shared.Modules.Utilities.NetworkUtility.Events.UpdateTools
            Event:FireServer(A_1, A_2)
            wait()
        end
        Enabled = false
    end,
Menu = {
    Information = function(self)
       UI.Banner({
           Text = "Automatically Slams"            
       })
    end
    }
    })

Page.Toggle({
    Text = 'Auto Sell',
    Callback = function(value)
        _G.sell = value
        
        while true do
            if not _G.sell then return end
            local A_1 = 'SellStrength'
            local A_2 = 'Home'
            local Event = game:GetService("ReplicatedStorage").Shared.Modules.Utilities.NetworkUtility.Events.UpdateDNA
            Event:FireServer(A_1, A_2)
            wait()
        end
        Enabled = false
    end,
Menu = {
    Information = function(self)
       UI.Banner({
           Text = "Sells Your Strength"            
       })
    end
    }
    })

Page.Toggle({
    Text = 'Buy All Tools',
    Callback = function(value)
        _G.TOOL = value
        
        while true do
            if not _G.TOOL then return end
            local A_1 = 'BuyAllTools'
            local A_2 = 'Home'
            local Event = game:GetService("ReplicatedStorage").Shared.Modules.Utilities.NetworkUtility.Events.UpdateTools
            Event:FireServer(A_1, A_2)
            wait()
        end
        Enabled = false
    end,
Menu = {
    Information = function(self)
       UI.Banner({
           Text = "Buys All The Tools"            
       })
    end
    }
    })

Page.Toggle({
    Text = 'Buy All DNA',
    Callback = function(value)
        _G.DNA = value
        
        while true do
            if not _G.DNA then return end
            local A_1 = 'BuyAllDNA'
            local A_2 = 'Home'
            local Event = game:GetService("ReplicatedStorage").Shared.Modules.Utilities.NetworkUtility.Events.UpdateDNA
            Event:FireServer(A_1, A_2)
            wait()
        end
        Enabled = false
    end,
Menu = {
    Information = function(self)
       UI.Banner({
           Text = "Buys All DNA"            
       })
    end
    }
    })

Page.Toggle({
    Text = 'Buy All Boss Upgrades',
    Callback = function(value)
        _G.BOSS = value
        
        while true do
            if not _G.BOSS then return end
            local A_1 = 'BuyAllBossHits'
            local A_2 = 'Home'
            local Event = game:GetService("ReplicatedStorage").Shared.Modules.Utilities.NetworkUtility.Events.UpdateBossHits
            Event:FireServer(A_1, A_2)
            wait()
        end
        Enabled = false
    end,
Menu = {
    Information = function(self)
       UI.Banner({
           Text = "Buys All Boss Upgrades"            
       })
    end
    }
    })

local Page = UI.New({
    Title = 'Teleports'
})

Page.Toggle({
    Text = 'TP Coins And Gems To You',
    Callback = function(value)
        _G.TP = value

        while true do
            if not _G.TP then return end
            for i,v in pairs(gemfolder:GetChildren()) do
                v.CFrame = rootpart.CFrame
                wait()
            end
        end
    end,
Menu = {
    Information = function(self)
       UI.Banner({
           Text = "Teleports Gems And Coins To You"            
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
