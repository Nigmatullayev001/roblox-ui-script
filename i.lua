-- Safe Speed toggle script
local UIS = game:GetService("UserInputService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Humanoid = LocalPlayer.Character:WaitForChild("Humanoid")

local NormalSpeed = 16 -- default Roblox speed
local FastSpeed = 25 -- pastroq boost (anticheatdan o‘tishi mumkin)
local Speeding = false

UIS.InputBegan:Connect(function(input, gpe)
	if gpe then return end
	if input.KeyCode == Enum.KeyCode.LeftShift then
		Speeding = not Speeding
		Humanoid.WalkSpeed = Speeding and FastSpeed or NormalSpeed
	end
end)
