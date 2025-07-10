-- QuonixHub Main Loader (No Key Version)
repeat wait() until game:IsLoaded() and game.Players.LocalPlayer

-- Load Lib GUI
local OrionLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/YourUser/QuonixHub/main/lib/OrionLib.lua"))()
local Window = OrionLib:MakeWindow({Name = "🍌 Quonix Hub - Blox Fruits", HidePremium = false, SaveConfig = true, ConfigFolder = "QuonixHub"})

-- Load từng module
loadstring(game:HttpGet("https://raw.githubusercontent.com/YourUser/QuonixHub/main/modules/AutoFarm.lua"))()
loadstring(game:HttpGet("https://raw.githubusercontent.com/YourUser/QuonixHub/main/modules/AutoQuest.lua"))()
loadstring(game:HttpGet("https://raw.githubusercontent.com/YourUser/QuonixHub/main/modules/AutoStat.lua"))()
loadstring(game:HttpGet("https://raw.githubusercontent.com/YourUser/QuonixHub/main/modules/AutoSkill.lua"))()
loadstring(game:HttpGet("https://raw.githubusercontent.com/YourUser/QuonixHub/main/modules/ESP.lua"))()
loadstring(game:HttpGet("https://raw.githubusercontent.com/YourUser/QuonixHub/main/modules/Teleport.lua"))()

OrionLib:Init()
