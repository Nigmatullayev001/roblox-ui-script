-- RunSpeed + GUI + Trail + Infinite Health
local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

-- GUI yaratish
local ScreenGui = Instance.new("ScreenGui", PlayerGui)
ScreenGui.Name = "RunSpeedGui"

local Button = Instance.new("TextButton", ScreenGui)
Button.Size = UDim2.new(0, 140, 0, 40)
Button.Position = UDim2.new(0, 10, 0, 60)
Button.Text = "Run: ENABLED"
Button.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
Button.TextColor3 = Color3.fromRGB(255, 255, 255)
Button.BorderSizePixel = 2
Button.TextScaled = true

-- Sozlamalar
local enabled = true
local normalSpeed = 160
local runSpeed = 300
local humanoid = nil
local trail = nil

-- Trail yasash funksiyasi
local function createTrail(character)
	if trail then trail:Destroy() end

	local att1 = Instance.new("Attachment", character:WaitForChild("LeftFoot"))
	local att2 = Instance.new("Attachment", character:WaitForChild("RightFoot"))

	trail = Instance.new("Trail", character)
	trail.Attachment0 = att1
	trail.Attachment1 = att2
	trail.Lifetime = 0.2
	trail.Enabled = false
	trail.Color = ColorSequence.new(Color3.fromRGB(255, 255, 255))
	trail.Transparency = NumberSequence.new(0.2, 1)
end

-- Humanoid olish va tayyorlash
local function getHumanoid()
	local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
	createTrail(char)
	return char:WaitForChild("Humanoid")
end

humanoid = getHumanoid()

-- Shift bosilganda speed + trail yoqiladi
UIS.InputBegan:Connect(function(input, gpe)
	if gpe or not enabled then return end
	if input.KeyCode == Enum.KeyCode.LeftShift and humanoid then
		humanoid.WalkSpeed = runSpeed
		if trail then trail.Enabled = true end
	end
end)

-- Shift qo‘yilganda asl speed va trail o‘chadi
UIS.InputEnded:Connect(function(input, gpe)
	if gpe or not enabled then return end
	if input.KeyCode == Enum.KeyCode.LeftShift and humanoid then
		humanoid.WalkSpeed = normalSpeed
		if trail then trail.Enabled = false end
	end
end)

-- Button bosilganda yoqish/o‘chirish
Button.MouseButton1Click:Connect(function()
	enabled = not enabled
	Button.Text = enabled and "Run: ENABLED" or "Run: DISABLED"
	if humanoid then
		humanoid.WalkSpeed = normalSpeed
		if trail then trail.Enabled = false end
	end
end)

-- Respawn bo‘lganda yangidan sozlash
LocalPlayer.CharacterAdded:Connect(function()
	humanoid = getHumanoid()
	humanoid.WalkSpeed = normalSpeed
end)

-- 💖 Infinite Health (God Mode)
RunService.Heartbeat:Connect(function()
	if humanoid and humanoid.Health < humanoid.MaxHealth then
		humanoid.Health = humanoid.MaxHealth
	end
end)
