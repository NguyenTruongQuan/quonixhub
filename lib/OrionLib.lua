local OrionLib = {}
OrionLib.__index = OrionLib

local CoreGui = game:GetService("CoreGui")
local TweenService = game:GetService("TweenService")
local HttpService = game:GetService("HttpService")

-- Tạo GUI chính
function OrionLib:MakeWindow(config)
    local screen = Instance.new("ScreenGui", CoreGui)
    screen.Name = "OrionHub"
    screen.ResetOnSpawn = false

    local frame = Instance.new("Frame", screen)
    frame.Size = UDim2.new(0, 500, 0, 350)
    frame.Position = UDim2.new(0.5, -250, 0.5, -175)
    frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    frame.Visible = false
    local uic = Instance.new("UICorner", frame)
    uic.CornerRadius = UDim.new(0, 8)

    self.ScreenGui = screen
    self.Main = frame

    local window = {}
    function window:MakeTab(opts)
        local tabFrame = Instance.new("Frame", frame)
        tabFrame.Size = UDim2.new(1, 0, 1, -40)
        tabFrame.Position = UDim2.new(0, 0, 0, 40)
        tabFrame.BackgroundTransparency = 1

        local out = {}
        function out:AddToggle(opt)
            local btn = Instance.new("TextButton", tabFrame)
            btn.Size = UDim2.new(1, -20, 0, 30)
            btn.Position = UDim2.new(0, 10, 0, #tabFrame:GetChildren()*35)
            btn.Text = "[ ] "..opt.Name
            btn.BackgroundColor3 = Color3.fromRGB(50,50,50)
            local state = opt.Default or false
            btn.MouseButton1Click:Connect(function()
                state = not state
                btn.Text = (state and "[✔] " or "[ ] ")..opt.Name
                opt.Callback(state)
            end)
        end
        function out:AddButton(opt)
            local btn = Instance.new("TextButton", tabFrame)
            btn.Size = UDim2.new(1, -20, 0, 30)
            btn.Position = UDim2.new(0, 10, 0, #tabFrame:GetChildren()*35)
            btn.Text = opt.Name
            btn.BackgroundColor3 = Color3.fromRGB(70,70,70)
            btn.MouseButton1Click:Connect(opt.Callback)
        end
        function out:AddSlider(opt)
            -- implement slider UI as needed
        end
        function out:AddDropdown(opt)
            -- implement dropdown UI
        end
        return out
    end

    return window
end

function OrionLib:Init()
    if self.Main then
        self.Main.Visible = true
    end
end

return OrionLib

