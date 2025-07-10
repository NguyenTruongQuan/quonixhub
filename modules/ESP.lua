local Tab = _G.Window:MakeTab({
    Name = "👁️ ESP",
    Icon = "rbxassetid://6031075934",
    PremiumOnly = false
})

_G.ESPEnabled = false

Tab:AddToggle({
    Name = "Hiện tên người chơi (Player ESP)",
    Default = false,
    Callback = function(v)
        _G.ESPEnabled = v
        while _G.ESPEnabled do
            for _, plr in pairs(game.Players:GetPlayers()) do
                if plr ~= game.Players.LocalPlayer and plr.Character and not plr.Character:FindFirstChild("ESPTag") then
                    local tag = Instance.new("BillboardGui", plr.Character)
                    tag.Name = "ESPTag"
                    tag.Adornee = plr.Character:FindFirstChild("Head")
                    tag.Size = UDim2.new(0, 100, 0, 40)
                    tag.AlwaysOnTop = true

                    local name = Instance.new("TextLabel", tag)
                    name.Size = UDim2.new(1, 0, 1, 0)
                    name.BackgroundTransparency = 1
                    name.Text = plr.Name
                    name.TextColor3 = Color3.new(1, 0, 0)
                    name.TextScaled = true
                end
            end
            wait(3)
        end

        -- Tắt ESP
        for _, plr in pairs(game.Players:GetPlayers()) do
            if plr.Character and plr.Character:FindFirstChild("ESPTag") then
                plr.Character.ESPTag:Destroy()
            end
        end
    end
})
