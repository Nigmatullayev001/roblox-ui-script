-- RunSpeed + GUI Toggle (Shift + Button)
local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")
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

-- Tezlik sozlamalari
local enabled = true
local normalSpeed = 160
local runSpeed = 300
local humanoid = nil

-- Karakter tayyor bo'lishini kut
local function getHumanoid()
	local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
	return char:WaitForChild("Humanoid")
end

humanoid = getHumanoid()

-- Shift bosilganda speed o'zgaradi
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

-- Button orqali yoqib/o‘chirish
Button.MouseButton1Click:Connect(function()
	enabled = not enabled
	Button.Text = enabled and "Run: ENABLED" or "Run: DISABLED"
	if humanoid then
		humanoid.WalkSpeed = normalSpeed
	end
end)

-- Karakter respawn bo‘lsa ham ishlashi uchun
LocalPlayer.CharacterAdded:Connect(function()
	humanoid = getHumanoid()
	humanoid.WalkSpeed = normalSpeed
end)
