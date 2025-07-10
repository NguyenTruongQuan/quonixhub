local OrionLib = {}

-- Tạo GUI gốc
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "OrionHub"
ScreenGui.ResetOnSpawn = false
ScreenGui.IgnoreGuiInset = true
ScreenGui.Parent = game:GetService("CoreGui")

-- Tạo Frame chính
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 500, 0, 350)
MainFrame.Position = UDim2.new(0.5, -250, 0.5, -175)
MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
MainFrame.BorderSizePixel = 0
MainFrame.Parent = ScreenGui
MainFrame.Visible = false -- Khởi đầu ẩn

-- UI Corner bo tròn
local UICorner = Instance.new("UICorner", MainFrame)
UICorner.CornerRadius = UDim.new(0, 8)

-- Thêm tiêu đề
local Title = Instance.new("TextLabel", MainFrame)
Title.Size = UDim2.new(1, 0, 0, 40)
Title.Text = "🤡 Quonix Hub"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextScaled = true
Title.BackgroundTransparency = 1
Title.Font = Enum.Font.GothamBold

-- === HÀM GỌI BÊN NGOÀI ===
function OrionLib:MakeWindow(cfg)
	MainFrame.Visible = true
	return {
		MakeTab = function(tabCfg)
			-- Tab chỉ là khung nội dung đơn giản
			local tab = Instance.new("Frame", MainFrame)
			tab.Size = UDim2.new(1, 0, 1, -40)
			tab.Position = UDim2.new(0, 0, 0, 40)
			tab.BackgroundTransparency = 1

			return {
				AddLabel = function(text)
					local lbl = Instance.new("TextLabel", tab)
					lbl.Size = UDim2.new(1, -20, 0, 30)
					lbl.Position = UDim2.new(0, 10, 0, 10)
					lbl.Text = text
					lbl.TextColor3 = Color3.fromRGB(200, 200, 200)
					lbl.BackgroundTransparency = 1
					lbl.TextXAlignment = Enum.TextXAlignment.Left
					lbl.Font = Enum.Font.Gotham
					lbl.TextSize = 18
				end
			}
		end
	}
end

function OrionLib:Init()
	-- Có thể xử lý logic init nếu muốn
end

return OrionLib

