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

-- Load các module chính
local baseURL = "https://raw.githubusercontent.com/NguyenTruongQuan/QuonixHub/main/modules/"
local function SafeLoad(url)
    local s, e = pcall(function()
        loadstring(game:HttpGet(url))()
    end)
    if not s then warn("Lỗi tải: " .. url) end
end

SafeLoad(baseURL .. "AutoFarm.lua")
SafeLoad(baseURL .. "AutoQuest.lua")
SafeLoad(baseURL .. "AutoStat.lua")
SafeLoad(baseURL .. "AutoSkill.lua")
SafeLoad(baseURL .. "ESP.lua")
SafeLoad(baseURL .. "Teleport.lua")
SafeLoad(baseURL .. "AntiBan.lua")

OrionLib:Init()

-- Toggle GUI bằng phím RightControl
local UIS = game:GetService("UserInputService")
local CoreGui = game:GetService("CoreGui")
local guiVisible = true

UIS.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    if input.KeyCode == Enum.KeyCode.RightControl then
        guiVisible = not guiVisible
        for _, gui in ipairs(CoreGui:GetChildren()) do
            if gui:IsA("ScreenGui") and gui.Name:find("Orion") then
                gui.Enabled = guiVisible
            end
        end
    end
end)

