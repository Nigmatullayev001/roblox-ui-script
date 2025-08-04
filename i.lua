-- RunSpeed + Health Tools + GUI
local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

-- Humanoid olish
local function getHumanoid()
	local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
	return char:WaitForChild("Humanoid")
end

local humanoid = getHumanoid()

-- GUI yaratish
local screenGui = Instance.new("ScreenGui", PlayerGui)
screenGui.Name = "RunHealthGUI"

-- Panel (Frame)
local frame = Instance.new("Frame", screenGui)
frame.Size = UDim2.new(0, 180, 0, 200)
frame.Position = UDim2.new(0, 10, 0, 60)
frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
frame.BorderSizePixel = 2

-- RUN Button
local runBtn = Instance.new("TextButton", frame)
runBtn.Size = UDim2.new(1, -20, 0, 40)
runBtn.Position = UDim2.new(0, 10, 0, 10)
runBtn.Text = "Run: ENABLED"
runBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
runBtn.TextColor3 = Color3.new(1, 1, 1)
runBtn.TextScaled = true

-- Health Button
local addHealthBtn = Instance.new("TextButton", frame)
addHealthBtn.Size = UDim2.new(1, -20, 0, 40)
addHealthBtn.Position = UDim2.new(0, 10, 0, 60)
addHealthBtn.Text = "➕ Jon Qo‘shish (+100)"
addHealthBtn.BackgroundColor3 = Color3.fromRGB(60, 160, 60)
addHealthBtn.TextColor3 = Color3.new(1, 1, 1)
addHealthBtn.TextScaled = true

-- Revive Button
local reviveBtn = Instance.new("TextButton", frame)
reviveBtn.Size = UDim2.new(1, -20, 0, 40)
reviveBtn.Position = UDim2.new(0, 10, 0, 110)
reviveBtn.Text = "❤️ Tirilish"
reviveBtn.BackgroundColor3 = Color3.fromRGB(200, 80, 80)
reviveBtn.TextColor3 = Color3.new(1, 1, 1)
reviveBtn.TextScaled = true

-- Close Button
local closeBtn = Instance.new("TextButton", frame)
closeBtn.Size = UDim2.new(0, 40, 0, 30)
closeBtn.Position = UDim2.new(1, -45, 0, -35)
closeBtn.Text = "X"
closeBtn.BackgroundColor3 = Color3.fromRGB(90, 90, 90)
closeBtn.TextColor3 = Color3.new(1, 1, 1)
closeBtn.TextScaled = true

-- RUN toggle
local enabled = true
local normalSpeed = 160
local runSpeed = 300

runBtn.MouseButton1Click:Connect(function()
	enabled = not enabled
	runBtn.Text = enabled and "Yugurish: ✅" or "Yugurish: ❌"
	if humanoid then
		humanoid.WalkSpeed = normalSpeed
	end
end)

UIS.InputBegan:Connect(function(input, gpe)
	if gpe or not enabled then return end
	if input.KeyCode == Enum.KeyCode.LeftShift and humanoid then
		humanoid.WalkSpeed = runSpeed
	end
end)

UIS.InputEnded:Connect(function(input, gpe)
	if gpe or not enabled then return end
	if input.KeyCode == Enum.KeyCode.LeftShift and humanoid then
		humanoid.WalkSpeed = normalSpeed
	end
end)

-- +100 Health
addHealthBtn.MouseButton1Click:Connect(function()
	humanoid = getHumanoid()
	if humanoid and humanoid.Health < humanoid.MaxHealth then
		local newHealth = math.min(humanoid.Health + 100, humanoid.MaxHealth)
		humanoid.Health = newHealth
	end
end)

-- Revive
reviveBtn.MouseButton1Click:Connect(function()
	humanoid = getHumanoid()
	if humanoid and humanoid.Health <= 0 then
		humanoid.Health = humanoid.MaxHealth
	end
end)

-- Close GUI
closeBtn.MouseButton1Click:Connect(function()
	screenGui:Destroy()
end)

-- Respawn hodisasi
LocalPlayer.CharacterAdded:Connect(function(char)
	humanoid = char:WaitForChild("Humanoid")
	humanoid.WalkSpeed = normalSpeed
end)
