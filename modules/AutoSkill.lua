-- AutoSkill Module
local Tab = Window:MakeTab({Name="💥 Auto Skill"})
_G.AutoSkill = {Z=false, X=false, C=false, V=false}

for _, key in ipairs({"Z","X","C","V"}) do
    Tab:AddToggle({
        Name = "Auto Skill "..key,
        Default = false,
        Callback = function(v) _G.AutoSkill[key] = v end
    })
end

spawn(function()
    while true do
        for key,state in pairs(_G.AutoSkill) do
            if state then
                game:GetService("VirtualInputManager"):SendKeyEvent(true,key,false,game)
                wait(0.1)
                game:GetService("VirtualInputManager"):SendKeyEvent(false,key,false,game)
            end
        end
        wait(1)
    end
end)
