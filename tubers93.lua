local Players = game:GetService("Players")

-- O'yinchi kirganda pul tizimi va GUI yaratish
Players.PlayerAdded:Connect(function(player)
    -- Leaderstats yaratish
    local leaderstats = Instance.new("Folder")
    leaderstats.Name = "leaderstats"
    leaderstats.Parent = player

    -- Money qiymati
    local money = Instance.new("IntValue")
    money.Name = "Money"
    money.Value = 1000000000000
    money.Parent = leaderstats

    -- GUI yaratish
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "MoneyGUI"
    screenGui.ResetOnSpawn = false

    local moneyLabel = Instance.new("TextLabel")
    moneyLabel.Name = "MoneyLabel"
    moneyLabel.Size = UDim2.new(0, 200, 0, 50)
    moneyLabel.Position = UDim2.new(0, 10, 0, 10)
    moneyLabel.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    moneyLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    moneyLabel.TextScaled = true
    moneyLabel.Parent = screenGui

    local addButton = Instance.new("TextButton")
    addButton.Name = "AddMoneyButton"
    addButton.Size = UDim2.new(0, 200, 0, 50)
    addButton.Position = UDim2.new(0, 10, 0, 70)
    addButton.BackgroundColor3 = Color3.fromRGB(0, 170, 0)
    addButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    addButton.TextScaled = true
    addButton.Text = "💰 Add +1 000 000 000 000 Money"
    addButton.Parent = screenGui

    -- LocalScript GUI ichida
    local localScript = Instance.new("LocalScript")
    localScript.Source = [[
        local player = game.Players.LocalPlayer
        local moneyLabel = script.Parent:WaitForChild("MoneyLabel")
        local addButton = script.Parent:WaitForChild("AddMoneyButton")
        local money = player:WaitForChild("leaderstats"):WaitForChild("Money")

        local function updateMoney(newValue)
            moneyLabel.Text = "💰 Money: " .. newValue
        end

        updateMoney(money.Value)
        money.Changed:Connect(updateMoney)

        addButton.MouseButton1Click:Connect(function()
            -- Serverga pul qo'shish so'rovini yuboramiz
            game.ReplicatedStorage:WaitForChild("AddMoneyEvent"):FireServer(1000000000000)
        end)
    ]]
    localScript.Parent = screenGui

    screenGui.Parent = player:WaitForChild("PlayerGui")
end)

-- RemoteEvent yaratish
local addMoneyEvent = Instance.new("RemoteEvent")
addMoneyEvent.Name = "AddMoneyEvent"
addMoneyEvent.Parent = game.ReplicatedStorage

-- Serverda pul qo'shish
addMoneyEvent.OnServerEvent:Connect(function(player, amount)
    local money = player:FindFirstChild("leaderstats") and player.leaderstats:FindFirstChild("Money")
    if money then
        money.Value = money.Value + amount
    end
end)
