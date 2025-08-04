local player = game.Players.LocalPlayer

-- Money qiymatini olish
local function getMoneyStat()
	local leaderstats = player:WaitForChild("leaderstats")
	return leaderstats:WaitForChild("Money")
end

-- GUI yaratish
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "MoneyAdderUI"
screenGui.ResetOnSpawn = false
screenGui.Parent = player:WaitForChild("PlayerGui")

local frame = Instance.new("Frame", screenGui)
frame.Size = UDim2.new(0, 200, 0, 100)
frame.Position = UDim2.new(0, 20, 0, 300)
frame.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
frame.BorderSizePixel = 2

-- Button
local moneyBtn = Instance.new("TextButton", frame)
moneyBtn.Size = UDim2.new(1, -20, 1, -20)
moneyBtn.Position = UDim2.new(0, 10, 0, 10)
moneyBtn.Text = "➕ Money +100"
moneyBtn.BackgroundColor3 = Color3.fromRGB(255, 200, 50)
moneyBtn.TextColor3 = Color3.new(1, 1, 1)
moneyBtn.TextScaled = true

-- Pul qo‘shish funksiyasi
moneyBtn.MouseButton1Click:Connect(function()
	local money = getMoneyStat()
	if money then
		money.Value += 100
	end
end)
