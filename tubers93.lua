--== CONFIGURATION ==--
local FLY_IDLE_ANIM = "rbxassetid://118497393030591"
local FLY_MOVE_ANIM = "rbxassetid://70723459243126"
local DASH_ANIM = "rbxassetid://115080435169903"
local LASER_COLOR = Color3.fromRGB(255, 0, 0)
local LASER_SPEED = 200
local LASER_LIFETIME = 2

--== VARIABLES ==--
local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")
local RS = game:GetService("RunService")

local player = Players.LocalPlayer
local char = player.Character or player.CharacterAdded:Wait()
local hum = char:WaitForChild("Humanoid")
local root = char:WaitForChild("HumanoidRootPart")
local mouse = player:GetMouse()

local flying = false
local laserOn = false
local velocity = Instance.new("BodyVelocity")
velocity.MaxForce = Vector3.new(1e5, 1e5, 1e5)
velocity.Velocity = Vector3.zero

--== ANIMATION LOADER ==--
local function loadAnim(id)
	local anim = Instance.new("Animation")
	anim.AnimationId = id
	return hum:LoadAnimation(anim)
end

local flyIdle = loadAnim(FLY_IDLE_ANIM)
local flyMove = loadAnim(FLY_MOVE_ANIM)
local dashAnim = loadAnim(DASH_ANIM)

--== FLY TOGGLE ==--
UIS.InputBegan:Connect(function(input, gp)
	if gp then return end
	if input.KeyCode == Enum.KeyCode.R then
		flying = not flying
		if flying then
			velocity.Parent = root
			flyIdle:Play()
		else
			velocity.Parent = nil
			flyIdle:Stop()
			flyMove:Stop()
		end
	elseif input.KeyCode == Enum.KeyCode.Q and flying then
		-- DASH
		dashAnim:Play()
		velocity.Velocity = root.CFrame.LookVector * 150
		task.delay(0.2, function()
			velocity.Velocity = Vector3.zero
		end)
	elseif input.KeyCode == Enum.KeyCode.E then
		-- LASER TOGGLE
		laserOn = not laserOn
	end
end)

--== FLY MOVEMENT ==--
RS.RenderStepped:Connect(function()
	if flying then
		local moveDir = Vector3.zero
		if UIS:IsKeyDown(Enum.KeyCode.W) then
			moveDir = moveDir + root.CFrame.LookVector
		end
		if UIS:IsKeyDown(Enum.KeyCode.S) then
			moveDir = moveDir - root.CFrame.LookVector
		end
		if UIS:IsKeyDown(Enum.KeyCode.A) then
			moveDir = moveDir - root.CFrame.RightVector
		end
		if UIS:IsKeyDown(Enum.KeyCode.D) then
			moveDir = moveDir + root.CFrame.RightVector
		end

		if moveDir.Magnitude > 0 then
			velocity.Velocity = moveDir.Unit * 80
			if not flyMove.IsPlaying then
				flyIdle:Stop()
				flyMove:Play()
			end
		else
			velocity.Velocity = Vector3.zero
			if not flyIdle.IsPlaying then
				flyMove:Stop()
				flyIdle:Play()
			end
		end
	end
end)

--== LASER FIRE ==--
mouse.Button1Down:Connect(function()
	if laserOn then
		local laser = Instance.new("Part")
		laser.Size = Vector3.new(0.2, 0.2, 4)
		laser.Anchored = false
		laser.CanCollide = false
		laser.Material = Enum.Material.Neon
		laser.Color = LASER_COLOR
		laser.CFrame = CFrame.new(char.Head.Position, mouse.Hit.Position)
		laser.Parent = workspace

		local bv = Instance.new("BodyVelocity")
		bv.MaxForce = Vector3.new(1e5, 1e5, 1e5)
		bv.Velocity = laser.CFrame.LookVector * LASER_SPEED
		bv.Parent = laser

		game:GetService("Debris"):AddItem(laser, LASER_LIFETIME)
	end
end)
