-- Anti-ban được bật tự động, không có nút trên GUI
local mt = getrawmetatable(game)
setreadonly(mt, false)

local old = mt.__namecall
mt.__namecall = newcclosure(function(self, ...)
    local method = getnamecallmethod()
    local args = {...}
    if method == "Kick" then
        warn("[⚠️] Đã chặn một lệnh Kick từ server!")
        return
    end
    return old(self, unpack(args))
end)

setreadonly(mt, true)

print("[✅] Anti-ban đã kích hoạt!")
