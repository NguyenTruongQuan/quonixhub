-- init.lua
repeat wait() until game:IsLoaded() and game.Players.LocalPlayer

local OrionLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/NguyenTruongQuan/QuonixHub/main/lib/OrionLib.lua"))()
local Window = OrionLib:MakeWindow({
    Name = "🤡 Quonix Hub - Blox Fruits",
    HidePremium = false,
    SaveConfig = true,
    ConfigFolder = "QuonixHub"
})

_G.QuonixWindow = Window  -- Truyền window dùng toàn cục

-- Gọi từng module
loadstring(game:HttpGet("https://raw.githubusercontent.com/NguyenTruongQuan/QuonixHub/main/modules/AutoFarm.lua"))()
loadstring(game:HttpGet("https://raw.githubusercontent.com/NguyenTruongQuan/QuonixHub/main/modules/ESP.lua"))()
loadstring(game:HttpGet("https://raw.githubusercontent.com/NguyenTruongQuan/QuonixHub/main/modules/Teleport.lua"))()

OrionLib:Init()

