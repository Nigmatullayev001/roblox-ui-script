-- Remote nomini o‘zgartirish kerak
local remote = game:GetService("ReplicatedStorage"):WaitForChild("SpawnItem") -- nomini aniqlab yoz

-- GUI yaratish
local screenGui = Instance.new("ScreenGui", game.Players.LocalPlayer:WaitForChild("PlayerGui"))
screenGui.Name = "GardenUI"

local frame = Instance.new("Frame", screenGui)
frame.Size = UDim2.new(0, 300, 0, 160)
frame.Position = UDim2.new(0.5, -150, 0.5, -80)
frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
frame.Draggable = true
frame.Active = true

local label = Instance.new("TextLabel", frame)
label.Text = "Nimani olishni yoz (meva/yoki hayvon):"
label.Size = UDim2.new(1, 0, 0, 30)
label.TextColor3 = Color3.new(1, 1, 1)
label.BackgroundTransparency = 1
label.TextSize = 16

local textBox = Instance.new("TextBox", frame)
textBox.PlaceholderText = "Masalan: Apple yoki Cow"
textBox.Size = UDim2.new(0.9, 0, 0, 40)
textBox.Position = UDim2.new(0.05, 0, 0.3, 0)
textBox.TextColor3 = Color3.new(1, 1, 1)
textBox.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
textBox.TextSize = 18

local button = Instance.new("TextButton", frame)
button.Text = "Yuborish"
button.Size = UDim2.new(0.9, 0, 0, 40)
button.Position = UDim2.new(0.05, 0, 0.65, 0)
button.BackgroundColor3 = Color3.fromRGB(0, 120, 255)
button.TextColor3 = Color3.new(1, 1, 1)
button.TextSize = 20

button.MouseButton1Click:Connect(function()
    local itemName = textBox.Text
    if itemName ~= "" then
        remote:FireServer(itemName)
    end
end)
