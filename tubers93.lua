local ReplicatedStorage = game:GetService("ReplicatedStorage")
local player = game.Players.LocalPlayer

-- Pul nomlari
local moneyNames = {"Money", "Cash", "Coins", "Gold", "Bucks", "Points", "Credits", "Diamonds", "Tokens"}

-- GUI elementlari
local screenGui = script.Parent

local moneyLabel = Instance.new("TextLabel")
moneyLabel.Size = UDim2.new(0, 300, 0, 50)
moneyLabel.Position = UDim2.new(0, 10, 0, 10)
moneyLabel.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
moneyLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
moneyLabel.TextScaled = true
moneyLabel.Parent = screenGui

local addButton = Instance.new("TextButton")
addButton.Size = UDim2.new(0, 300, 0, 50)
addButton.Position = UDim2.new(0, 10, 0, 70)
addButton.BackgroundColor3 = Color3.fromRGB(0, 170, 0)
addButton.TextColor3 = Color3.fromRGB(255, 255, 255)
addButton.TextScaled = true
addButton.Text = "💰 Add +1 Trillion to All"
addButton.Parent = screenGui

local closeButton = Instance.new("TextButton")
closeButton.Size = UDim2.new(0, 50, 0, 50)
closeButton.Position = UDim2.new(1, -60, 0, 10)
closeButton.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
closeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
closeButton.TextScaled = true
closeButton.Text = "X"
closeButton.Parent = screenGui

-- Pul qiymatlarini yangilash funksiyasi
local function updateMoney()
    local texts = {}
    for _, name in ipairs(moneyNames) do
        local stat = player:WaitForChild("leaderstats"):FindFirstChild(name)
        if stat then
            table.insert(texts, name .. ": " .. stat.Value)
        end
    end
    moneyLabel.Text = "💰 " .. table.concat(texts, " | ")
end

-- Har bir stat o'zgarsa yangilash
for _, name in ipairs(moneyNames) do
    local stat = player:WaitForChild("leaderstats"):FindFirstChild(name)
    if stat then
        stat.Changed:Connect(updateMoney)
    end
end

-- Boshlang'ich holatda yangilash
updateMoney()

-- Tugma bosilganda serverga so'rov yuborish
addButton.MouseButton1Click:Connect(function()
    ReplicatedStorage:WaitForChild("AddMoneyEvent"):FireServer(1000000000000)
end)

-- Chiqish tugmasi
closeButton.MouseButton1Click:Connect(function()
    screenGui:Destroy()
end)
