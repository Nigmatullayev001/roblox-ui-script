local remote = game:GetService("ReplicatedStorage"):WaitForChild("SpawnAnimal") -- BU NOM o'yindan aniqlangani bo'lishi kerak

-- GUI yaratish
local screenGui = Instance.new("ScreenGui", game.Players.LocalPlayer:WaitForChild("PlayerGui"))
screenGui.Name = "RaccoonUI"

local frame = Instance.new("Frame", screenGui)
frame.Size = UDim2.new(0, 300, 0, 150)
frame.Position = UDim2.new(0.5, -150, 0.5, -75)
frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
frame.Draggable = true
frame.Active = true

local label = Instance.new("TextLabel", frame)
label.Text = "🦝 Raccoon olish"
label.Size = UDim2.new(1, 0, 0, 30)
label.TextColor3 = Color3.new(1, 1, 1)
label.BackgroundTransparency = 1
label.TextSize = 20

local button = Instance.new("TextButton", frame)
button.Text = "🎁 Raccoon ni olish"
button.Size = UDim2.new(0.9, 0, 0, 50)
button.Position = UDim2.new(0.05, 0, 0.4, 0)
button.BackgroundColor3 = Color3.fromRGB(0, 170, 100)
button.TextColor3 = Color3.new(1, 1, 1)
button.TextSize = 20

button.MouseButton1Click:Connect(function()
    remote:FireServer("Raccoon")
end)
