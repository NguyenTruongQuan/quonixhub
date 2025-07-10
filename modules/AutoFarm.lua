-- AutoFarm Module
local Tab = Window:MakeTab({Name="⚔️ Auto Farm"})

_G.AutoFarm = false
Tab:AddToggle({
    Name = "Bật Auto Farm",
    Default = false,
    Callback = function(v)
        _G.AutoFarm = v
        spawn(function()
            while _G.AutoFarm do
                pcall(function()
                    local enemy = workspace.Enemies:FindFirstChildWhichIsA("Model")
                    if enemy and enemy:FindFirstChild("HumanoidRootPart") then
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = enemy.HumanoidRootPart.CFrame * CFrame.new(0, 10, 0)
                        game:GetService("VirtualInputManager"):SendKeyEvent(true, "Z", false, game)
                    end
                end)
                wait(1)
            end
        end)
    end
})
