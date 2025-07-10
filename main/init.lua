repeat wait() until game:IsLoaded() and game.Players.LocalPlayer

-- Load GUI Lib
local success, OrionLib = pcall(function()
    return loadstring(game:HttpGet("https://raw.githubusercontent.com/NguyenTruongQuan/QuonixHub/main/lib/OrionLib.lua"))()
end)

if not success then
    warn("Không thể tải OrionLib")
    return
end

-- Tạo cửa sổ chính
local Window = OrionLib:MakeWindow({
    Name = "🤡 Quonix Hub - Blox Fruits",
    HidePremium = false,
    SaveConfig = true,
    ConfigFolder = "QuonixHub"
})

-- Tải các module
local function SafeLoad(url)
    local s, e = pcall(function()
        loadstring(game:HttpGet(url))()
    end)
    if not s then warn("Lỗi tải: " .. url) end
end

local baseURL = "https://raw.githubusercontent.com/NguyenTruongQuan/QuonixHub/main/modules/"
SafeLoad(baseURL .. "AutoFarm.lua")
SafeLoad(baseURL .. "AutoQuest.lua")
SafeLoad(baseURL .. "AutoStat.lua")
SafeLoad(baseURL .. "AutoSkill.lua")
SafeLoad(baseURL .. "ESP.lua")
SafeLoad(baseURL .. "Teleport.lua")
SafeLoad(baseURL .. "AntiBan.lua")

OrionLib:Init()

-- Thêm nút Avatar toggle GUI
local avatarURL = "https://raw.githubusercontent.com/NguyenTruongQuan/QuonixHub/main/quan_avatar.png"

local CoreGui = game:GetService("CoreGui")
local GuiService = game:GetService("GuiService")

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "QuonixToggle"
ScreenGui.ResetOnSpawn = false
ScreenGui.IgnoreGuiInset = true
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.Parent = CoreGui

local Button = Instance.new("ImageButton")
Button.Name = "AvatarToggle"
Button.Size = UDim2.new(0, 60, 0, 60)
Button.Position = UDim2.new(1, -70, 1, -70)
Button.AnchorPoint = Vector2.new(0.5, 0.5)
Button.BackgroundTransparency = 1
Button.Image = avatarURL
Button.ZIndex = 999
Button.Parent = ScreenGui

-- Toggle GUI
local guiVisible = true
Button.MouseButton1Click:Connect(function()
    guiVisible = not guiVisible
    for _, gui in pairs(CoreGui:GetChildren()) do
        if gui.Name:find("Orion") then
            gui.Enabled = guiVisible
        end
    end
end)


