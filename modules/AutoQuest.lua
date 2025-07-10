local Tab = _G.Window:MakeTab({
    Name = "🧭 Auto Quest",
    Icon = "rbxassetid://6031097184", -- hoặc để trống
    PremiumOnly = false
})

_G.AutoQuest = false

Tab:AddToggle({
    Name = "Tự động nhận nhiệm vụ gần nhất",
    Default = false,
    Callback = function(v)
        _G.AutoQuest = v
        spawn(function()
            while _G.AutoQuest do
                pcall(function()
                    local npc = workspace:FindFirstChild("QuestNPC", true)
                    if npc and npc:FindFirstChild("Head") then
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = npc.Head.CFrame + Vector3.new(0, 3, 0)
                        fireproximityprompt(npc:FindFirstChildWhichIsA("ProximityPrompt"))
                    end
                end)
                wait(2)
            end
        end)
    end
})
