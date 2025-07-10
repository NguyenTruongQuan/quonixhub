local Tab = _G.Window:MakeTab({
    Name = "🌀 Teleport",
    Icon = "rbxassetid://6035193503",
    PremiumOnly = false
})

local places = {
    ["Starter Island"] = Vector3.new(1047, 16, 1407),
    ["Jungle"] = Vector3.new(-1244, 11, 389),
    ["Marine"] = Vector3.new(-260, 45, 1370),
    ["Sky Island"] = Vector3.new(-4924, 717, -2622),
    ["Snow Island"] = Vector3.new(1387, 87, -1296)
}

for name, pos in pairs(places) do
    Tab:AddButton({
        Name = "Dịch chuyển tới " .. name,
        Callback = function()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(pos)
        end
    })
end
