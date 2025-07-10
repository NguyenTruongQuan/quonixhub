-- 🌐 Tải thư viện GUI
local OrionLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/NguyenTruongQuan/QuonixHub/main/lib/OrionLib.lua"))()

-- 🏰 Tạo cửa sổ chính
local Window = OrionLib:MakeWindow({
    Name = "Quonix Hub ⚔️",
    HidePremium = false,
    IntroText = "Loading Quonix...",
    SaveConfig = true,
    ConfigFolder = "QuonixHub"
})

-- 🧠 Gọi các module chính
loadstring(game:HttpGet("https://raw.githubusercontent.com/NguyenTruongQuan/QuonixHub/main/modules/AutoFarm.lua"))()
loadstring(game:HttpGet("https://raw.githubusercontent.com/NguyenTruongQuan/QuonixHub/main/modules/AutoQuest.lua"))()
loadstring(game:HttpGet("https://raw.githubusercontent.com/NguyenTruongQuan/QuonixHub/main/modules/AutoSkill.lua"))()
loadstring(game:HttpGet("https://raw.githubusercontent.com/NguyenTruongQuan/QuonixHub/main/modules/AutoStat.lua"))()
loadstring(game:HttpGet("https://raw.githubusercontent.com/NguyenTruongQuan/QuonixHub/main/modules/ESP.lua"))()
loadstring(game:HttpGet("https://raw.githubusercontent.com/NguyenTruongQuan/QuonixHub/main/modules/Teleport.lua"))()
loadstring(game:HttpGet("https://raw.githubusercontent.com/NguyenTruongQuan/QuonixHub/main/modules/AntiBan.lua"))()
