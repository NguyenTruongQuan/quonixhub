-- AutoQuest Module
local Tab = Window:MakeTab({Name="📜 Auto Quest"})
_G.AutoQuest = false
Tab:AddToggle({
    Name = "Tự động nhận nhiệm vụ",
    Default = false,
    Callback = function(v)
        _G.AutoQuest = v
        spawn(function()
            while _G.AutoQuest do
                pcall(function()
                    local args = {"StartQuest", "BanditQuest1", 1}
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                end)
                wait(10)
            end
        end)
    end
})
