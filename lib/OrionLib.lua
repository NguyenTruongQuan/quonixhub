local OrionLib = {}

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local CoreGui = game:GetService("CoreGui")

-- Kiểm tra GUI cũ
if CoreGui:FindFirstChild("Orion") then
    CoreGui.Orion:Destroy()
end

-- GUI GỐC
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "Orion"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = CoreGui

-- CHỨC NĂNG: TẠO CỬA SỔ
function OrionLib:MakeWindow(settings)
    local Window = {}
    local MainFrame = Instance.new("Frame")
    MainFrame.Size = UDim2.new(0, 500, 0, 400)
    MainFrame.Position = UDim2.new(0.5, -250, 0.5, -200)
    MainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    MainFrame.BorderSizePixel = 0
    MainFrame.Name = settings.Name or "Orion Window"
    MainFrame.Parent = ScreenGui

    local UICorner = Instance.new("UICorner", MainFrame)
    UICorner.CornerRadius = UDim.new(0, 8)

    -- CẤU TRÚC TABS
    local Tabs = {}
    function Window:MakeTab(tabInfo)
        local Tab = {}
        local tabButton = Instance.new("TextButton")
        tabButton.Text = tabInfo.Name
        tabButton.Size = UDim2.new(0, 120, 0, 30)
        tabButton.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
        tabButton.Parent = MainFrame

        local tabFrame = Instance.new("Frame")
        tabFrame.Size = UDim2.new(1, 0, 1, -40)
        tabFrame.Position = UDim2.new(0, 0, 0, 40)
        tabFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
        tabFrame.Visible = false
        tabFrame.Parent = MainFrame

        local UIList = Instance.new("UIListLayout", tabFrame)
        UIList.Padding = UDim.new(0, 6)

        tabButton.MouseButton1Click:Connect(function()
            for _, other in pairs(Tabs) do
                other.Frame.Visible = false
            end
            tabFrame.Visible = true
        end)

        Tab.Frame = tabFrame
        Tabs[#Tabs+1] = Tab

        function Tab:AddToggle(opt)
            local Toggle = Instance.new("TextButton")
            Toggle.Size = UDim2.new(1, -12, 0, 32)
            Toggle.Text = "[OFF] " .. opt.Name
            Toggle.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
            Toggle.Parent = tabFrame

            local state = opt.Default or false
            Toggle.MouseButton1Click:Connect(function()
                state = not state
                Toggle.Text = (state and "[ON] " or "[OFF] ") .. opt.Name
                opt.Callback(state)
            end)
        end

        function Tab:AddButton(opt)
            local Button = Instance.new("TextButton")
            Button.Size = UDim2.new(1, -12, 0, 32)
            Button.Text = opt.Name
            Button.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
            Button.Parent = tabFrame

            Button.MouseButton1Click:Connect(opt.Callback)
        end

        return Tab
    end

    return Window
end

function OrionLib:Init()
    print("OrionLib đã khởi tạo!")
end

return OrionLib
