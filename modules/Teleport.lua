-- Teleport Module
local Tab = Window:MakeTab({Name="🗺️ Teleport"})
local maps = {["First Sea"] = 2753915549, ["Second Sea"] = 7449423635, ["Third Sea"] = 4442272183}

for name, id in pairs(maps) do
    Tab:AddButton({
        Name = "Đến "..name,
        Callback = function()
            game:GetService("TeleportService"):Teleport(id)
        end
    })
end
