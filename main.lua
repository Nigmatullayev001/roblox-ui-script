local player = game.Players.LocalPlayer
local screenGui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
screenGui.Name = "ItemSpawnUI"
screenGui.ResetOnSpawn = false

for _, child in ipairs(game:GetService("ReplicatedStorage"):GetChildren()) do
    print("🔍 Found in ReplicatedStorage:", child.Name, child.ClassName)
end


-- 🎁 Asosiy oyna (modal frame)
local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 300, 0, 230)
mainFrame.Position = UDim2.new(0.5, -150, 0.5, -115)
mainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
mainFrame.BorderSizePixel = 0
mainFrame.Parent = screenGui

-- 📝 TextBox: Narsa nomini yozish
local inputBox = Instance.new("TextBox")
inputBox.Size = UDim2.new(0, 250, 0, 40)
inputBox.Position = UDim2.new(0.5, -125, 0, 40)
inputBox.PlaceholderText = "Narsa nomi: masalan 'Cow' yoki 'Pumpkin'"
inputBox.Text = ""
inputBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
inputBox.TextColor3 = Color3.fromRGB(0, 0, 0)
inputBox.TextScaled = true
inputBox.Parent = mainFrame

-- 🚀 Spawn tugmasi
local spawnButton = Instance.new("TextButton")
spawnButton.Size = UDim2.new(0, 200, 0, 40)
spawnButton.Position = UDim2.new(0.5, -100, 0, 100)
spawnButton.Text = "🚀 Spawn Qil"
spawnButton.BackgroundColor3 = Color3.fromRGB(0, 170, 80)
spawnButton.TextScaled = true
spawnButton.Parent = mainFrame

-- ✅ Xabar label
local messageLabel = Instance.new("TextLabel")
messageLabel.Size = UDim2.new(0, 250, 0, 30)
messageLabel.Position = UDim2.new(0.5, -125, 0, 150)
messageLabel.BackgroundTransparency = 1
messageLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
messageLabel.TextScaled = true
messageLabel.Text = ""
messageLabel.Parent = mainFrame

-- ❌ Yopish tugmasi
local closeButton = Instance.new("TextButton")
closeButton.Size = UDim2.new(0, 30, 0, 30)
closeButton.Position = UDim2.new(1, -35, 0, 5)
closeButton.Text = "X"
closeButton.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
closeButton.TextScaled = true
closeButton.Parent = mainFrame

-- 🔄 Tugmalar funksiyasi
spawnButton.MouseButton1Click:Connect(function()
    local itemName = inputBox.Text
    if itemName and itemName ~= "" then
        local remote = game:GetService("ReplicatedStorage"):FindFirstChild("SpawnHandler")
        if remote then
            remote:FireServer(itemName)
            messageLabel.Text = "✅ '" .. itemName .. "' yuborildi!"
        else
            messageLabel.Text = "❌ RemoteEvent topilmadi!"
            

        end
    else
        messageLabel.Text = "⚠️ Narsa nomi kiritilmagan!"
    end
end)

closeButton.MouseButton1Click:Connect(function()
    screenGui:Destroy()
end)
