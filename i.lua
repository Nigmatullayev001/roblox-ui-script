-- Speed GUI (Button bilan)
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

-- GUI yaratish
local ScreenGui = Instance.new("ScreenGui", PlayerGui)
ScreenGui.Name = "SpeedGui"

local Button = Instance.new("TextButton", ScreenGui)
Button.Size = UDim2.new(0, 120, 0, 40)
Button.Position = UDim2.new(0, 10, 0, 10)
Button.Text = "Speed: OFF"
Button.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Button.TextColor3 = Color3.fromRGB(255, 255, 255)
Button.BorderSizePixel = 2
Button.TextScaled = true

-- Speed logika
local speedOn = false
local normalSpeed = 16
local fastSpeed = 500

local function toggleSpeed()
	local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
	local humanoid = character:FindFirstChildOfClass("Humanoid")

	if humanoid then
		speedOn = not speedOn
		humanoid.WalkSpeed = speedOn and fastSpeed or normalSpeed
		Button.Text = speedOn and "Speed: ON" or "Speed: OFF"
	end
end

Button.MouseButton1Click:Connect(toggleSpeed)
