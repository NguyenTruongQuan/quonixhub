-- 🔒 Quonix Anti-Ban Module

-- 🛡️ Hook __namecall để chặn Kick, Report
local mt = getrawmetatable(game)
local old = mt.__namecall
setreadonly(mt, false)

mt.__namecall = newcclosure(function(self, ...)
    local args = {...}
    local method = getnamecallmethod()

    if method == "Kick" then
        warn("🛡️ Chặn Kick!")
        return nil
    end

    if tostring(self):lower():find("report") then
        warn("🛡️ Chặn Report Remote:", self)
        return nil
    end

    return old(self, unpack(args))
end)

setreadonly(mt, true)

-- 🧼 Xoá connection Player.Kick
for _, v in pairs(getconnections(game.Players.LocalPlayer.Kick)) do
    v:Disable()
end

-- 🧼 Xoá connection Humanoid.Died
local char = game.Players.LocalPlayer.Character or game.Players.LocalPlayer.CharacterAdded:Wait()
local hum = char:WaitForChild("Humanoid", 5)
if hum then
    for _, v in pairs(getconnections(hum.Died)) do
        v:Disable()
    end
end

-- 💤 Random Delay để giả hành vi người thật (nếu có AutoFarm)
_G.QUONIX_DELAY = math.random(0.3, 1.2)
