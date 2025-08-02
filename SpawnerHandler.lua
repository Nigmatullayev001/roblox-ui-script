-- StarterGui/ItemSpawnerUI (LocalScript)
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local player = Players.LocalPlayer

-- UI yaratish
local screenGui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
screenGui.Name = "SpawnUI"

local frame = Instance.new("Frame", screenGui)
frame.Size = UDim2.new(0, 300, 0, 180)
frame.Position = UDim2.new(0.5, -150, 0.5, -90)
frame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)

local title = Instance.new("TextLabel", frame)
title.Text = "🍀 Grow a Garden - Spawner"
title.Size = UDim2.new(1, 0, 0, 30)
title.BackgroundTransparency = 1
title.TextColor3 = Color3.new(1,1,1)
title.Font = Enum.Font.GothamBold
title.TextSize = 18

local inputBox = Instance.new("TextBox", frame)
inputBox.Size = UDim2.new(0.9, 0, 0, 35)
inputBox.Position = UDim2.new(0.05, 0, 0, 50)
inputBox.PlaceholderText = "Item nomi: SugarApple"
inputBox.Text = ""
inputBox.TextScaled = true
inputBox.Font = Enum.Font.Gotham

local spawnBtn = Instance.new("TextButton", frame)
spawnBtn.Text = "📦 Give & Spawn"
spawnBtn.Size = UDim2.new(0.9, 0, 0, 40)
spawnBtn.Position = UDim2.new(0.05, 0, 0, 100)
spawnBtn.BackgroundColor3 = Color3.fromRGB(0, 170, 0)
spawnBtn.TextColor3 = Color3.new(1, 1, 1)
spawnBtn.TextScaled = true
spawnBtn.Font = Enum.Font.GothamBold

-- RemoteEvent orqali FireServer
local giveItemEvent = ReplicatedStorage:WaitForChild("GiveItem")
spawnBtn.MouseButton1Click:Connect(function()
	local itemName = inputBox.Text
	if itemName and itemName ~= "" then
		giveItemEvent:FireServer(itemName)
	end
end)
