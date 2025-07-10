-- AutoFarm Module cho Quonix Hub
local Window = _G.QuonixWindow
if not Window then
    warn("⚠️ Không tìm thấy Window từ _G.QuonixWindow")
    return
end

local Tab = Window:MakeTab({
    Name = "⚔️ Auto Farm",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

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
                        local hrp = game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                        if hrp then
                            hrp.CFrame = enemy.HumanoidRootPart.CFrame * CFrame.new(0, 10, 0)
                            game:GetService("VirtualInputManager"):SendKeyEvent(true, "Z", false, game)
                        end
                    end
                end)
                wait(1)
            end
        end)
    end
})

