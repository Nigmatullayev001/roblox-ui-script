local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- 📦 UI yaratish
local screenGui = Instance.new("ScreenGui", playerGui)
screenGui.Name = "DuplicateToolUI"
screenGui.ResetOnSpawn = false

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 300, 0, 160)
frame.Position = UDim2.new(0.5, -150, 0.8, -80)
frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
frame.BorderSizePixel = 0
frame.Parent = screenGui

-- 🏷️ Item nomi
local itemLabel = Instance.new("TextLabel")
itemLabel.Size = UDim2.new(1, -20, 0, 30)
itemLabel.Position = UDim2.new(0, 10, 0, 10)
itemLabel.BackgroundTransparency = 1
itemLabel.TextColor3 = Color3.new(1, 1, 1)
itemLabel.Font = Enum.Font.Gotham
itemLabel.TextSize = 18
itemLabel.TextXAlignment = Enum.TextXAlignment.Center
itemLabel.Text = "Qo‘lda: Hech narsa yo‘q"
itemLabel.Parent = frame

-- 🔘 Clone tugmasi
local cloneButton = Instance.new("TextButton")
cloneButton.Size = UDim2.new(0.6, 0, 0, 40)
cloneButton.Position = UDim2.new(0.2, 0, 0, 60)
cloneButton.Text = "📋 Clone"
cloneButton.BackgroundColor3 = Color3.fromRGB(0, 170, 0)
cloneButton.TextColor3 = Color3.new(1,1,1)
cloneButton.Font = Enum.Font.GothamBold
cloneButton.TextScaled = true
cloneButton.Parent = frame

-- ✅ Yozuv (Nusxa yaratildi!)
local successLabel = Instance.new("TextLabel")
successLabel.Size = UDim2.new(1, -20, 0, 30)
successLabel.Position = UDim2.new(0, 10, 0, 110)
successLabel.BackgroundTransparency = 1
successLabel.TextColor3 = Color3.fromRGB(0, 255, 0)
successLabel.Font = Enum.Font.Gotham
successLabel.TextSize = 16
successLabel.Text = ""
successLabel.TextXAlignment = Enum.TextXAlignment.Center
successLabel.Parent = frame

-- 🔁 Qo‘ldagi itemni avtomatik aniqlash
local function updateItemName()
	local tool = player.Character and player.Character:FindFirstChildOfClass("Tool")
	if tool then
		itemLabel.Text = "Qo‘lda: " .. tool.Name
	else
		itemLabel.Text = "Qo‘lda: Hech narsa yo‘q"
	end
end

-- 🔘 Clone tugmasi funksiyasi
cloneButton.MouseButton1Click:Connect(function()
	local character = player.Character
	if not character then return end
	local tool = character:FindFirstChildOfClass("Tool")
	if tool then
		local copy = tool:Clone()
		copy.Parent = player.Backpack
		successLabel.Text = "✅ '" .. tool.Name .. "' nusxalandi!"
	else
		successLabel.Text = "❌ Qo‘lda item yo‘q!"
	end
	wait(2)
	successLabel.Text = ""
end)

-- 🔄 Har 0.5s da tekshirib turish
while true do
	task.wait(0.5)
	updateItemName()
end
