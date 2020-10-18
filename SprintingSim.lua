--1165.1261, 197.532837, -170.799149, 0.939820886, 1.68828489e-08, 0.341667503, -4.16935251e-08, 1, 6.52728076e-08, -0.341667503, -7.55900729e-08, 0.939820886

local Material = loadstring(game:HttpGet("https://raw.githubusercontent.com/Kinlei/MaterialLua/master/Module.lua"))()
local orbsfolder = game:GetService("Workspace").OrbSpawns
local player = game:GetService("Players").LocalPlayer
local char = player.Character
local rootpart = char.HumanoidRootPart
local candyfolder = game:GetService("Workspace").CandySpawns

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
    Title = "Speed Run Sim"
})

Page.Toggle({
    Text = "Auto Sprint",
    Callback = function (value)
        _G.sprint = value

        while true do 
            if not _G.sprint then return end
            local Event = game:GetService("ReplicatedStorage").Remotes.AddSpeed
            Event:FireServer()
            wait()
        end
        Enabled = false
    end,
Menu = {
    Information = function(self)
        UI.Banner({
            Text = "Automatically Adds Speed"            
        })
    end
}
})

Page.Toggle({
    Text = "Auto Rebirth",
    Callback = function (value)
        _G.rebirth = value

        while true do 
            if not _G.rebirth then return end
            local Event = game:GetService("ReplicatedStorage").Remotes.Rebirth
            Event:FireServer()
            wait()
        end
        Enabled = false
    end,
Menu = {
    Information = function(self)
        UI.Banner({
            Text = "Automatically Rebirths"            
        })
    end
}
})

Page.Toggle({
    Text = "Teleport Orbs To You",
    Callback = function (value)
        _G.orb = value

        while true do
            if not _G.orb then return end
            for i,v in pairs(orbsfolder:GetChildren()) do
            if v.Name == "Orb" then
                v.CFrame = rootpart.CFrame
                wait()
            end
        end
    end
end,
Menu = {
    Information = function(self)
        UI.Banner({
            Text = "Automatically Tp's Orbs To You"            
        })
    end
}
})

Page.Toggle({
    Text = "Teleport Rings To You",
    Callback = function (value)
        _G.ring = value

        while true do
            if not _G.ring then return end
            for i,v in pairs(orbsfolder:GetChildren()) do
            if v.Name == "Ring" then
                v.CFrame = rootpart.CFrame
                wait()
            end
        end
    end
end,
Menu = {
    Information = function(self)
        UI.Banner({
            Text = "Automatically Tp's Rings To You"            
        })
    end
}
})

Page.Toggle({
    Text = "Teleport Candy To You",
    Callback = function (value)
        _G.candy = value

        while true do
            if not _G.candy then return end
            for i,v in pairs(candyfolder:GetChildren()) do
            if v.Name == "Candy" then
                v.CFrame = rootpart.CFrame
                wait()
            end
        end
    end
end,
Menu = {
    Information = function(self)
        UI.Banner({
            Text = "Automatically Tp's Candy To You"            
        })
    end
}
})

local Page = UI.New({
    Title = "Eggs"
})

Page.Button({
    Text = "Buy Halloween Egg Egg (7500 Candy)",
    Callback = function()
        local A_1 = "CandyEgg"
        local Event = game:GetService("ReplicatedStorage").Remotes.CanBuyEgg
        Event:InvokeServer(A_1)
    end,
    Menu = {
        Information = function(self)
            UI.Banner({
                Text = "Buy Halloween Egg"            
            })
        end
    }
    })

Page.Button({
    Text = "Buy 1st Egg (500)",
    Callback = function()
        local A_1 = "EggOne"
        local Event = game:GetService("ReplicatedStorage").Remotes.CanBuyEgg
        Event:InvokeServer(A_1)
    end,
    Menu = {
        Information = function(self)
            UI.Banner({
                Text = "Buy First Egg"            
            })
        end
    }
    })

Page.Button({
    Text = "Buy 2nd Egg (3000)",
    Callback = function()
        local A_1 = "EggTwo"
        local Event = game:GetService("ReplicatedStorage").Remotes.CanBuyEgg
        Event:InvokeServer(A_1)
    end,
    Menu = {
        Information = function(self)
            UI.Banner({
                Text = "Buy Second Egg"            
            })
        end
    }
    })

Page.Button({
    Text = "Buy 3rd Egg (5000)",
    Callback = function()
        local A_1 = "EggThree"
        local Event = game:GetService("ReplicatedStorage").Remotes.CanBuyEgg
        Event:InvokeServer(A_1)
    end,
    Menu = {
        Information = function(self)
            UI.Banner({
                Text = "Buy Third Egg"            
            })
        end
    }
    })

Page.Button({
    Text = "Buy 4th Egg (15000)",
    Callback = function()
        local A_1 = "EggFour"
        local Event = game:GetService("ReplicatedStorage").Remotes.CanBuyEgg
        Event:InvokeServer(A_1)
    end,
    Menu = {
        Information = function(self)
            UI.Banner({
                Text = "Buy Fourth Egg"            
            })
        end
    }
    })

Page.Button({
    Text = "Buy 5th Egg (50000)",
    Callback = function()
        local A_1 = "EggFive"
        local Event = game:GetService("ReplicatedStorage").Remotes.CanBuyEgg
        Event:InvokeServer(A_1)
    end,
    Menu = {
        Information = function(self)
            UI.Banner({
                Text = "Buy Fifth Egg"            
            })
        end
    }
    })

Page.Button({
    Text = "Buy 6th Egg (30000)",
    Callback = function()
        local A_1 = "EggSix"
        local Event = game:GetService("ReplicatedStorage").Remotes.CanBuyEgg
        Event:InvokeServer(A_1)
    end,
    Menu = {
        Information = function(self)
            UI.Banner({
                Text = "Buy Sixth Egg"            
            })
        end
    }
    })

Page.Button({
    Text = "Buy 7th Egg (75000)",
    Callback = function()
        local A_1 = "EggSeven"
        local Event = game:GetService("ReplicatedStorage").Remotes.CanBuyEgg
        Event:InvokeServer(A_1)
    end,
    Menu = {
        Information = function(self)
            UI.Banner({
                Text = "Buy Seventh Egg"            
            })
        end
    }
    })

Page.Button({
    Text = "Buy 8th Egg (115000)",
    Callback = function()
        local A_1 = "EggEight"
        local Event = game:GetService("ReplicatedStorage").Remotes.CanBuyEgg
        Event:InvokeServer(A_1)
    end,
    Menu = {
        Information = function(self)
            UI.Banner({
                Text = "Buy Eigth Egg"            
            })
        end
    }
    })
