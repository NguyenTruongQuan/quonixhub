local Tab = _G.QuonixWindow:MakeTab({
    Name = "⚔️ Auto Farm",
    Icon = "rbxassetid://6031071053", -- hoặc rbxassetid://6031071053 là icon kiếm
    PremiumOnly = false
})

_G.AutoFarm = false

Tab:AddToggle({
    Name = "Bật Auto Farm (tìm quái gần nhất)",
    Default = false,
    Callback = function(v)
        _G.AutoFarm = v
        spawn(function()
            while _G.AutoFarm do
                pcall(function()
                    local enemy = workspace.Enemies:FindFirstChildWhichIsA("Model")
                    if enemy and enemy:FindFirstChild("HumanoidRootPart") and enemy:FindFirstChild("Humanoid") and enemy.Humanoid.Health > 0 then
                        local root = game.Players.LocalPlayer.Character.HumanoidRootPart
                        root.CFrame = enemy.HumanoidRootPart.CFrame * CFrame.new(0, 10, 0)

                        game:GetService("VirtualInputManager"):SendKeyEvent(true, "Z", false, game)
                    end
                end)
                wait(1)
            end
        end)
    end
})


