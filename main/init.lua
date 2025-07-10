repeat wait() until game:IsLoaded() and game.Players.LocalPlayer

-- Bật Anti-Ban trước
loadstring(game:HttpGet("https://raw.githubusercontent.com/NguyenTruongQuan/QuonixHub/main/modules/AntiBan.lua"))()

-- Load OrionLib
local OrionLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/NguyenTruongQuan/QuonixHub/main/lib/OrionLib.lua"))()

-- Tạo cửa sổ chính
local Window = OrionLib:MakeWindow({
    Name = "🔥 Quonix Hub - Blox Fruits",
    HidePremium = false,
    SaveConfig = true,
    ConfigFolder = "QuonixHub",
    IntroEnabled = true,
    IntroText = "Quonix Hub đang khởi động..."
})

-- Tab chính
local TabMain = Window:MakeTab({ Name = "🎮 Tự động", Icon = "rbxassetid://7734053494", PremiumOnly = false })
local TabESP = Window:MakeTab({ Name = "👁️ ESP", Icon = "rbxassetid://7733950768", PremiumOnly = false })
local TabTP = Window:MakeTab({ Name = "🚀 Dịch chuyển", Icon = "rbxassetid://7733960981", PremiumOnly = false })

-- Truyền Tabs vào môi trường toàn cục
getgenv().QuonixTabs = { Main = TabMain, ESP = TabESP, TP = TabTP }

-- Gọi các module
loadstring(game:HttpGet("https://raw.githubusercontent.com/NguyenTruongQuan/QuonixHub/main/modules/AutoFarm.lua"))()
loadstring(game:HttpGet("https://raw.githubusercontent.com/NguyenTruongQuan/QuonixHub/main/modules/AutoQuest.lua"))()
loadstring(game:HttpGet("https://raw.githubusercontent.com/NguyenTruongQuan/QuonixHub/main/modules/AutoSkill.lua"))()
loadstring(game:HttpGet("https://raw.githubusercontent.com/NguyenTruongQuan/QuonixHub/main/modules/AutoStat.lua"))()
loadstring(game:HttpGet("https://raw.githubusercontent.com/NguyenTruongQuan/QuonixHub/main/modules/ESP.lua"))()
loadstring(game:HttpGet("https://raw.githubusercontent.com/NguyenTruongQuan/QuonixHub/main/modules/Teleport.lua"))()

-- Thông báo hoàn tất
OrionLib:MakeNotification({
    Name = "Quonix Hub",
    Content = "Đã sẵn sàng chiến đấu!",
    Time = 5
})

