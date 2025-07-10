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
local modules = {
    "AutoFarm",
    "AutoQuest",
    "AutoStat",
    "AutoSkill",
    "ESP",
    "Teleport",
    "AntiBan"
}

for _, mod in ipairs(modules) do
    pcall(function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/NguyenTruongQuan/QuonixHub/main/modules/"..mod..".lua"))()
    end)
end

OrionLib:Init()

-- === GUI Toggle bằng Avatar ===
local CoreGui = game:GetService("CoreGui")
local avatarUrl = "https://raw.githubusercontent.com/NguyenTruongQuan/QuonixHub/main/quan_avatar.png"

-- Tạo nút avatar toggle
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "QuonixToggle"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = CoreGui

local Button = Instance.new("ImageButton")
Button.Name = "AvatarToggle"
Button.Size = UDim2.new(0, 64, 0, 64)
Button.Position = UDim2.new(1, -50, 1, -50)
Button.AnchorPoint = Vector2.new(1, 1)
Button.BackgroundTransparency = 1
Button.Image = avatarUrl
Button.ZIndex = 9999
Button.Parent = ScreenGui

-- Toggle GUI visibility
local guiVisible = true
Button.MouseButton1Click:Connect(function()
    guiVisible = not guiVisible
    for _, gui in ipairs(CoreGui:GetChildren()) do
        if gui.Name:find("Orion") then
            gui.Enabled = guiVisible
        end
    end
end)

