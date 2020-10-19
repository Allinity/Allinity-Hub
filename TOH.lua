local Material = loadstring(game:HttpGet("https://raw.githubusercontent.com/Kinlei/MaterialLua/master/Module.lua"))()
local function bypasser()
	local mt = getrawmetatable(game)
	local nc = mt.__namecall
	setreadonly(mt, false)
	mt.__namecall = newcclosure(function(GP, ...)
		local method = getnamecallmethod()
		if method == "Kick" then
			return
		end
		return nc(GP, ...)
	end)
	setreadonly(mt, true)
end
bypasser()
if game.Players.LocalPlayer:FindFirstChild("PlayerScripts") then
    pcall(function()
    game.Players.LocalPlayer.PlayerScripts.LocalScript:Destroy()
    game.Players.LocalPlayer.PlayerScripts.LocalScript2:Destroy()
    end)
end

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

Page.Button({
    Text = "TP To Top",
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.workspace.tower.sections.finish.exit.ParticleBrick.CFrame
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
    Text = "Delete Kill Parts",
    Callback = function()
        local killparts = game.workspace.tower:GetDescendants()

for i,v in pairs (killparts) do
   if v:IsA("BoolValue") or v:IsA("StringValue") then
       v.Parent:Destroy()
   end
   if v:IsA("ManualWeld") then
       if v.Name == "kill" then
   v.Parent:Destroy()
       end
   end
   if v:IsA("Part") then
   v.Anchored = true
   end
end
        end,
    Menu = {
        Information = function(self)
            UI.Banner({
                Text = "Does what the name says, and freezes kill parts"            
            })
        end
    }
})

Page.Button({
    Text = "GodMode",
    Callback = function()
        local plr = game.Players.LocalPlayer.Character
        if plr:FindFirstChild("KillScript") then
            plr.KillScript:Destroy() else return nil
        end
        if plr:FindFirstChild("bunnyJump") then
            plr.bunnyJump:Destroy() else return nil
        end
        if plr:FindFirstChild("ExplosiveDeath") then
            plr.ExplosiveDeath:Destroy() else return nil
        end
        if plr:FindFirstChild("hitboxScript") then
            plr.hitboxScript:Destroy() else return nil
        end
 end,

Menu = {
    Information = function(self)
        UI.Banner({
            Text = "Gives you GodMode"            
        })
    end
}
})


Page.Slider({
    Text = "WalkSpeed",
    Callback = function(value)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = value
    end,
    Min = 1,
    Max = 300,
    Def = 16
})

Page.Slider({
    Text = "JumpPower",
    Callback = function(value)
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = value
    end,
    Min = 1,
    Max = 300,
    Def = 50
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
