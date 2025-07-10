local Tab = _G.Window:MakeTab({
    Name = "📜 Auto Quest",
    Icon = "rbxassetid://6031071058",
    PremiumOnly = false
})

_G.AutoQuest = false

Tab:AddToggle({
    Name = "Tự động nhận nhiệm vụ",
    Default = false,
    Callback = function(v)
        _G.AutoQuest = v
        spawn(function()
            while _G.AutoQuest do
                pcall(function()
                    local quest = workspace:FindFirstChild("QuestNPC", true)
                    if quest then
                        local args = {
                            [1] = "StartQuest",
                            [2] = quest.Name,
                            [3] = 1 -- level 1 nhiệm vụ
                        }
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                    end
                end)
                wait(3)
            end
        end)
    end
})

