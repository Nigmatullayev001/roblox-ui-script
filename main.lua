local player = game.Players.LocalPlayer
local screenGui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
screenGui.Name = "SpawnUI"
screenGui.ResetOnSpawn = false

-- 📦 Main frame
local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 300, 0, 200)
mainFrame.Position = UDim2.new(0.5, -150, 0.5, -100)
mainFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
mainFrame.BorderSizePixel = 0
mainFrame.Parent = screenGui

-- 🏷️ Title
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, -35, 0, 30)
title.Position = UDim2.new(0, 10, 0, 5)
title.BackgroundTransparency = 1
title.Text = "🍀 Item Spawner"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.Font = Enum.Font.GothamBold
title.TextSize = 20
title.TextXAlignment = Enum.TextXAlignment.Left
title.Parent = mainFrame

-- ❌ Close button
local closeButton = Instance.new("TextButton")
closeButton.Size = UDim2.new(0, 25, 0, 25)
closeButton.Position = UDim2.new(1, -30, 0, 5)
closeButton.Text = "✖"
closeButton.TextScaled = true
closeButton.Font = Enum.Font.GothamBold
closeButton.BackgroundColor3 = Color3.fromRGB(170, 0, 0)
closeButton.TextColor3 = Color3.new(1,1,1)
closeButton.Parent = mainFrame

-- 📝 Input
local inputBox = Instance.new("TextBox")
inputBox.Size = UDim2.new(0.9, 0, 0, 40)
inputBox.Position = UDim2.new(0.05, 0, 0, 50)
inputBox.PlaceholderText = "Enter item name"
inputBox.Text = ""
inputBox.BackgroundColor3 = Color3.fromRGB(240, 240, 240)
inputBox.TextColor3 = Color3.new(0, 0, 0)
inputBox.Font = Enum.Font.Gotham
inputBox.TextScaled = true
inputBox.ClearTextOnFocus = false
inputBox.Parent = mainFrame

-- 🍎 Meva Button
local fruitButton = Instance.new("TextButton")
fruitButton.Size = UDim2.new(0.4, 0, 0, 40)
fruitButton.Position = UDim2.new(0.05, 0, 0, 110)
fruitButton.Text = "🍎 Meva"
fruitButton.BackgroundColor3 = Color3.fromRGB(0, 170, 0)
fruitButton.TextColor3 = Color3.new(1,1,1)
fruitButton.Font = Enum.Font.GothamBold
fruitButton.TextScaled = true
fruitButton.Parent = mainFrame

-- 🐄 Hayvon Button
local animalButton = Instance.new("TextButton")
animalButton.Size = UDim2.new(0.4, 0, 0, 40)
animalButton.Position = UDim2.new(0.55, 0, 0, 110)
animalButton.Text = "🐄 Hayvon"
animalButton.BackgroundColor3 = Color3.fromRGB(0, 100, 170)
animalButton.TextColor3 = Color3.new(1,1,1)
animalButton.Font = Enum.Font.GothamBold
animalButton.TextScaled = true
animalButton.Parent = mainFrame

-- ❌ Close button function
closeButton.MouseButton1Click:Connect(function()
	screenGui:Destroy()
end)

-- 🔘 Tugmalar funksiyasi (print orqali sinov)
fruitButton.MouseButton1Click:Connect(function()
	local itemName = inputBox.Text
	print("🍎 Meva spawn: ".. itemName)
	-- Bu yerda FireServer yoki boshqa kod yoziladi
end)

animalButton.MouseButton1Click:Connect(function()
	local itemName = inputBox.Text
	print("🐄 Hayvon spawn: ".. itemName)
	-- Bu yerda FireServer yoki boshqa kod yoziladi
end)
