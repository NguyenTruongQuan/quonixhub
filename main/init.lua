-- QuonixHub Main Loader (No Key Version)
repeat wait() until game:IsLoaded() and game.Players.LocalPlayer

-- Load Lib GUI
local OrionLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/NguyenTruongQuan/QuonixHub/main/lib/OrionLib.lua"))()
local Window = OrionLib:MakeWindow({Name = "🤡 Quonix Hub - Blox Fruits", Free của Nguyễn Trường Quân = false, SaveConfig = true, ConfigFolder = "QuonixHub"})

-- Load từng module
loadstring(game:HttpGet("https://raw.githubusercontent.com/NguyenTruongQuan/QuonixHub/main/modules/AutoFarm.lua"))()
loadstring(game:HttpGet("https://raw.githubusercontent.com/NguyenTruongQuan/QuonixHub/main/modules/AutoQuest.lua"))()
loadstring(game:HttpGet("https://raw.githubusercontent.com/NguyenTruongQuan/QuonixHub/main/modules/AutoStat.lua"))()
loadstring(game:HttpGet("https://raw.githubusercontent.com/NguyenTruongQuan/QuonixHub/main/modules/AutoSkill.lua"))()
loadstring(game:HttpGet("https://raw.githubusercontent.com/NguyenTruongQuan/QuonixHub/main/modules/ESP.lua"))()
loadstring(game:HttpGet("https://raw.githubusercontent.com/NguyenTruongQuan/QuonixHub/main/modules/Teleport.lua"))()
loadstring(game:HttpGet("https://raw.githubusercontent.com/NguyenTruongQuan/QuonixHub/main/modules/AntiBan.lua"))()

OrionLib:Init()
-- Ẩn / hiện GUI bằng phím RightControl
local UserInputService = game:GetService("UserInputService")
local guiVisible = true

UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    if input.KeyCode == Enum.KeyCode.RightControl then
        guiVisible = not guiVisible
        for _, gui in ipairs(game.CoreGui:GetChildren()) do
            if gui.Name:find("Orion") then
                gui.Enabled = guiVisible
            end
        end
    end
end)
