local OrionLib = {}
OrionLib.__index = OrionLib

local CoreGui = game:GetService("CoreGui")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local HttpService = game:GetService("HttpService")

OrionLib.Settings = {
	Name = "Orion Library",
	SaveConfig = true,
	ConfigFolder = "OrionLibConfig",
	HidePremium = true
}

OrionLib.Flags = {}
OrionLib.CurrentTab = nil

function OrionLib:MakeWindow(options)
	local options = options or {}
	for i,v in pairs(options) do
		OrionLib.Settings[i] = v
	end

	-- Tạo GUI chính
	local ScreenGui = Instance.new("ScreenGui")
	ScreenGui.Name = "Orion"
	ScreenGui.ResetOnSpawn = false
	ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Global
	ScreenGui.Parent = CoreGui

	local Main = Instance.new("Frame")
	Main.Name = "Main"
	Main.AnchorPoint = Vector2.new(0.5, 0.5)
	Main.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
	Main.BorderSizePixel = 0
	Main.Position = UDim2.new(0.5, 0, 0.5, 0)
	Main.Size = UDim2.new(0, 500, 0, 400)
	Main.Parent = ScreenGui

	-- Các thành phần khác sẽ được nối tiếp ở phần 2...
	local Window = {}

	function Window:MakeTab(tabOptions)
		print("MakeTab:", tabOptions.Name)
		local tab = {
			AddToggle = function(opt) print("Toggle", opt.Name) end,
			AddButton = function(opt) print("Button", opt.Name) end,
			AddSlider = function(opt) print("Slider", opt.Name) end,
			AddDropdown = function(opt) print("Dropdown", opt.Name) end,
			AddTextbox = function(opt) print("Textbox", opt.Name) end
		}
		return tab
	end

	return Window
end

function OrionLib:Init()
	print("GUI đã khởi tạo")
end

function OrionLib:Destroy()
	for _, v in pairs(CoreGui:GetChildren()) do
		if v.Name == "Orion" then
			v:Destroy()
		end
	end
end

return OrionLib
