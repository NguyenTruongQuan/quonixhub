local Tab = _G.QuonixWindow:MakeTab({
    Name = "📈 Auto Stat",
    Icon = "rbxassetid://6031215984",
    PremiumOnly = false
})

Tab:AddButton({
    Name = "Cộng full vào Melee",
    Callback = function()
        local stat = "Melee"
        local points = game.Players.LocalPlayer.Data.Points.Value
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AddPoint", stat, points)
    end
})

Tab:AddButton({
    Name = "Cộng full vào Defense",
    Callback = function()
        local stat = "Defense"
        local points = game.Players.LocalPlayer.Data.Points.Value
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AddPoint", stat, points)
    end
})

Tab:AddButton({
    Name = "Cộng full vào Sword",
    Callback = function()
        local stat = "Sword"
        local points = game.Players.LocalPlayer.Data.Points.Value
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AddPoint", stat, points)
    end
})
