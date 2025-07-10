-- AutoStat Module
local Tab = Window:MakeTab({Name="📈 Auto Stats"})

Tab:AddSlider({Name="Melee %",Min=0,Max=100,Default=25,Increment=5,Callback=function(v)getgenv().Me=v end})
Tab:AddSlider({Name="Defense %",Min=0,Max=100,Default=25,Increment=5,Callback=function(v)getgenv().De=v end})
Tab:AddSlider({Name="Sword %",Min=0,Max=100,Default=25,Increment=5,Callback=function(v)getgenv().Sw=v end})
Tab:AddSlider({Name="Fruit %",Min=0,Max=100,Default=25,Increment=5,Callback=function(v)getgenv().Fr=v end})

Tab:AddButton({
    Name = "Apply Stats",
    Callback = function()
        local total = getgenv().Me + getgenv().De + getgenv().Sw + getgenv().Fr
        if total > 100 then OrionLib:Notify({Name="Error", Content="Tổng > 100%", Time=2}) return end
        local points = game.Players.LocalPlayer.Points.Value
        local stats = {"Melee", "Defense", "Sword", "Fruit"}
        local perc = {getgenv().Me, getgenv().De, getgenv().Sw, getgenv().Fr}
        for i, stat in ipairs(stats) do
            local num = math.floor(points * (perc[i]/100))
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AddPoint", stat, num)
        end
        OrionLib:Notify({Name="Success", Content="Đã cộng điểm", Time=2})
    end
})
