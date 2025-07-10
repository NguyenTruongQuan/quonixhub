repeat wait() until game:IsLoaded() and game.Players.LocalPlayer

-- Tải Lib GUI
local OrionLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/NguyenTruongQuan/QuonixHub/main/lib/OrionLib.lua"))()
local Window = OrionLib:MakeWindow({
    Name = "🤡 Quonix Hub - Blox Fruits",
    HidePremium = false,
    SaveConfig = true,
    ConfigFolder = "QuonixHub"
})

-- Tải các Module chính
loadstring(game:HttpGet("https://raw.githubusercontent.com/NguyenTruongQuan/QuonixHub/main/modules/AutoFarm.lua"))()
loadstring(game:HttpGet("https://raw.githubusercontent.com/NguyenTruongQuan/QuonixHub/main/modules/AutoQuest.lua"))()
loadstring(game:HttpGet("https://raw.githubusercontent.com/NguyenTruongQuan/QuonixHub/main/modules/AutoStat.lua"))()
loadstring(game:HttpGet("https://raw.githubusercontent.com/NguyenTruongQuan/QuonixHub/main/modules/AutoSkill.lua"))()
loadstring(game:HttpGet("https://raw.githubusercontent.com/NguyenTruongQuan/QuonixHub/main/modules/ESP.lua"))()
loadstring(game:HttpGet("https://raw.githubusercontent.com/NguyenTruongQuan/QuonixHub/main/modules/Teleport.lua"))()
loadstring(game:HttpGet("https://raw.githubusercontent.com/NguyenTruongQuan/QuonixHub/main/modules/AntiBan.lua"))()

OrionLib:Init()

-- Ẩn/hiện bằng avatar của người
local UIS = game:GetService("UserInputService")
local Players = game:GetService("Players")
local StarterGui = game:GetService("StarterGui")
local CoreGui = game:GetService("CoreGui")

-- GUI Toggle qua Avatar Button
local avatarUrl = "https://raw.githubusercontent.com/NguyenTruongQuan/QuonixHub/main/assets/quan_avatar.png"

local ScreenGui = Instance.new("ScreenGui", CoreGui)
ScreenGui.Name = "QuonixToggle"
ScreenGui.ResetOnSpawn = false

local Button = Instance.new("ImageButton", ScreenGui)
Button.Name = "AvatarToggle"
Button.Size = UDim2.new(0, 64, 0, 64)
Button.Position = UDim2.new(1, -70, 1, -70)
Button.AnchorPoint = Vector2.new(0.5, 0.5)
Button.BackgroundTransparency = 1
Button.Image = avatarUrl
Button.ZIndex = 999

-- Toggle GUI
local guiVisible = true
Button.MouseButton1Click:Connect(function()
    guiVisible = not guiVisible
    for _, gui in ipairs(CoreGui:GetChildren()) do
        if gui.Name:find("Orion") then
            gui.Enabled = guiVisible
        end
    end
end)
