-- ESP Module
local Tab = Window:MakeTab({Name="👀 ESP"})

Tab:AddButton({Name="Hiển thị Người chơi",Callback=function()
    for _, v in pairs(game.Players:GetPlayers()) do
        if v ~= game.Players.LocalPlayer and v.Character then
            local h = Instance.new("Highlight", v.Character)
            h.FillColor = Color3.fromRGB(255, 0, 0)
            h.Name = "ESP"
        end
    end
end})

Tab:AddButton({Name="Hiển thị Rương / Trái",Callback=function()
    for _, obj in pairs(workspace:GetDescendants()) do
        if obj:IsA("Model") and (obj.Name:find("Chest") or obj.Name:find("Fruit")) then
            if not obj:FindFirstChild("ESP") then
                local h = Instance.new("Highlight", obj)
                h.FillColor = Color3.fromRGB(0, 255, 0)
                h.Name = "ESP"
            end
        end
    end
end})
