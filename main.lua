-- Grow a Garden: Fruit yoki hayvon olish uchun UI + RemoteEvent
local player = game.Players.LocalPlayer
local screenGui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
screenGui.Name = "SpawnUI"

-- UI tugmasi
local button = Instance.new("TextButton")
button.Size = UDim2.new(0, 200, 0, 50)
button.Position = UDim2.new(0.5, -100, 0.5, -25)
button.Text = "🍎 Meva Olish"
button.BackgroundColor3 = Color3.fromRGB(50, 200, 50)
button.TextScaled = true
button.Parent = screenGui

-- Fireserverga ulash
button.MouseButton1Click:Connect(function()
    -- Bu joyda RemoteEvent nomini tekshirib ol
    local remote = game:GetService("ReplicatedStorage"):FindFirstChild("SpawnFruit") -- yoki "RemoteEvent"
    if remote then
        remote:FireServer("SugarApplleSeed") -- O'rniga istalgan item nomini yoz: Apple, Raccoon, Tomato, Cow va h.k.
    else
        warn("RemoteEvent topilmadi!")
    end
end)
