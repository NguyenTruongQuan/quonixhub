local Tab = _G.QuonixWindow:MakeTab({
    Name = "🔥 Auto Skill",
    Icon = "rbxassetid://6031071058",
    PremiumOnly = false
})

_G.AutoSkillZ = false
_G.AutoSkillX = false
_G.AutoSkillC = false

Tab:AddToggle({
    Name = "Tự động dùng Z",
    Default = false,
    Callback = function(v)
        _G.AutoSkillZ = v
        spawn(function()
            while _G.AutoSkillZ do
                pcall(function()
                    game:GetService("VirtualInputManager"):SendKeyEvent(true, "Z", false, game)
                end)
                wait(2)
            end
        end)
    end
})

Tab:AddToggle({
    Name = "Tự động dùng X",
    Default = false,
    Callback = function(v)
        _G.AutoSkillX = v
        spawn(function()
            while _G.AutoSkillX do
                pcall(function()
                    game:GetService("VirtualInputManager"):SendKeyEvent(true, "X", false, game)
                end)
                wait(2.5)
            end
        end)
    end
})

Tab:AddToggle({
    Name = "Tự động dùng C",
    Default = false,
    Callback = function(v)
        _G.AutoSkillC = v
        spawn(function()
            while _G.AutoSkillC do
                pcall(function()
                    game:GetService("VirtualInputManager"):SendKeyEvent(true, "C", false, game)
                end)
                wait(3)
            end
        end)
    end
})

