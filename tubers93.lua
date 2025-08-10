local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- Pul nomlari ro'yxati
local moneyNames = {"Money", "Cash", "Coins", "Gold", "Bucks", "Points", "Credits", "Diamonds", "Tokens"}

-- RemoteEvent
local addMoneyEvent = Instance.new("RemoteEvent")
addMoneyEvent.Name = "AddMoneyEvent"
addMoneyEvent.Parent = ReplicatedStorage

-- Server: pul qo'shish
addMoneyEvent.OnServerEvent:Connect(function(player, amount)
    for _, statName in ipairs(moneyNames) do
        local stat = player:FindFirstChild("leaderstats") and player.leaderstats:FindFirstChild(statName)
        if stat then
            stat.Value = stat.Value + amount
        end
    end
end)

Players.PlayerAdded:Connect(function(player)
    -- leaderstats yaratish
    local leaderstats = Instance.new("Folder")
    leaderstats.Name = "leaderstats"
    leaderstats.Parent = player

    -- Barcha pul nomlarini leaderstats ichida yaratish
    for _, name in ipairs(moneyNames) do
        local moneyStat = Instance.new("IntValue")
        moneyStat.Name = name
        moneyStat.Value = 100
        moneyStat.Parent = leaderstats
    end

    -- GUI yaratish
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "MoneyGUI"
    screenGui.ResetOnSpawn = false

    -- Asosiy label
    local moneyLabel = Instance.new("TextLabel")
    moneyLabel.Name = "MoneyLabel"
    moneyLabel.Size = UDim2.new(0, 300, 0, 50)
    moneyLabel.Position = UDim2.new(0, 10, 0, 10)
    moneyLabel.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    moneyLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    moneyLabel.TextScaled = true
    moneyLabel.Parent = screenGui

    -- Pul qo'shish tugmasi
    local addButton = Instance.new("TextButton")
    addButton.Name = "AddMoneyButton"
    addButton.Size = UDim2.new(0, 300, 0, 50)
    addButton.Position = UDim2.new(0, 10, 0, 70)
    addButton.BackgroundColor3 = Color3.fromRGB(0, 170, 0)
    addButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    addButton.TextScaled = true
    addButton.Text = "💰 Add +1 Trillion to All"
    addButton.Parent = screenGui

    -- Chiqish tugmasi (X)
    local closeButton = Instance.new("TextButton")
    closeButton.Name = "CloseButton"
    closeButton.Size = UDim2.new(0, 50, 0, 50)
    closeButton.Position = UDim2.new(1, -60, 0, 10)
    closeButton.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
    closeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    closeButton.TextScaled = true
    closeButton.Text = "X"
    closeButton.Parent = screenGui

    -- LocalScript GUI ichida
    local localScript = Instance.new("LocalScript")
    localScript.Source = [[
        local ReplicatedStorage = game:GetService("ReplicatedStorage")
        local player = game.Players.LocalPlayer
        local moneyLabel = script.Parent:WaitForChild("MoneyLabel")
        local addButton = script.Parent:WaitForChild("AddMoneyButton")
        local closeButton = script.Parent:WaitForChild("CloseButton")
        local addMoneyEvent = ReplicatedStorage:WaitForChild("AddMoneyEvent")

        -- Barcha pul nomlari
        local moneyNames = {"Money", "Cash", "Coins", "Gold", "Bucks", "Points", "Credits", "Diamonds", "Tokens"}

        -- Pul qiymatlarini yangilash
        local function updateMoney()
            local texts = {}
            for _, name in ipairs(moneyNames) do
                local stat = player:FindFirstChild("leaderstats") and player.leaderstats:FindFirstChild(name)
                if stat then
                    table.insert(texts, name .. ": " .. stat.Value)
                end
            end
            moneyLabel.Text = "💰 " .. table.concat(texts, " | ")
        end

        -- Boshlang'ich ko'rinish
        updateMoney()

        -- Har bir stat o'zgarganda yangilash
        for _, name in ipairs(moneyNames) do
            local stat = player:FindFirstChild("leaderstats") and player.leaderstats:FindFirstChild(name)
            if stat then
                stat.Changed:Connect(updateMoney)
            end
        end

        -- Tugma bosilganda 1 trillion qo'shish
        addButton.MouseButton1Click:Connect(function()
            addMoneyEvent:FireServer(1000000000000)
        end)

        -- X tugmasi — GUI yopish
        closeButton.MouseButton1Click:Connect(function()
            script.Parent:Destroy()
        end)
    ]]
    localScript.Parent = screenGui

    screenGui.Parent = player:WaitForChild("PlayerGui")
end)
