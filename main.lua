-- [ Grow a Garden - Dynamic Spawn UI ]
local player = game.Players.LocalPlayer
local screenGui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
screenGui.Name = "SpawnUI"

-- TextBox: Meva yoki hayvon nomini kiritish
local input = Instance.new("TextBox")
input.Size = UDim2.new(0, 200, 0, 50)
input.Position = UDim2.new(0.5, -100, 0.5, -80)
input.PlaceholderText = "Meva yoki hayvon nomi yoz..."
input.Text = ""
input.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
input.TextColor3 = Color3.fromRGB(0, 0, 0)
input.TextScaled = true
input.Parent = screenGui

-- Tugma: Yuborish
local button = Instance.new("TextButton")
button.Size = UDim2.new(0, 200, 0, 50)
button.Position = UDim2.new(0.5, -100, 0.5, -20)
button.Text = "🚀 Spawn Qil"
button.BackgroundColor3 = Color3.fromRGB(100, 200, 100)
button.TextScaled = true
button.Parent = screenGui

-- Fireserver ulanishi
button.MouseButton1Click:Connect(function()
    local itemName = input.Text
    if itemName and itemName ~= "" then
        local remote = game:GetService("ReplicatedStorage"):FindFirstChild("SpawnFruit") -- yoki o‘zgartirilgan nom
        if remote then
            remote:FireServer(itemName)
            print("Yuborildi: ", itemName)
        else
            warn("❌ RemoteEvent topilmadi.")
        end
    else
        warn("❗ Narsa nomini kiriting.")
    end
end)
