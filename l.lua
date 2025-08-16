-- 🔥 Spooky + Cape + Fly + Dash System (All-in-One)
-- Delta Executor uchun

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

-- 🔹 RemoteEventlarni yaratamiz (agar bo‘lmasa)
local function createEvent(name)
    local ev = ReplicatedStorage:FindFirstChild(name)
    if not ev then
        ev = Instance.new("RemoteEvent")
        ev.Name = name
        ev.Parent = ReplicatedStorage
    end
    return ev
end

local ToggleMain = createEvent("ToggleMain")
local DashEvent = createEvent("DashEvent")

-- =====================================================
--  GUI Qismi
-- =====================================================
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "SpookyGUI"
screenGui.Parent = PlayerGui

local function createButton(name, text, pos)
    local btn = Instance.new("TextButton")
    btn.Name = name
    btn.Size = UDim2.new(0, 200, 0, 50)
    btn.Position = pos
    btn.BackgroundColor3 = Color3.fromRGB(30, 0, 30)
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.TextSize = 20
    btn.Font = Enum.Font.GothamBold
    btn.Text = text
    btn.Parent = screenGui
    return btn
end

local mainBtn = createButton("MainBtn", "👻 Spooky + Cape + Fly", UDim2.new(0, 20, 0, 300))
local dashBtn = createButton("DashBtn", "⚡ Dash", UDim2.new(0, 20, 0, 360))

-- Tugma bosilganda event yuborish
mainBtn.MouseButton1Click:Connect(function()
    ToggleMain:FireServer()
end)

dashBtn.MouseButton1Click:Connect(function()
    DashEvent:FireServer()
end)

-- =====================================================
--  SERVER LOGIKA (RemoteEvent orqali)
-- =====================================================
local activePlayers = {}

ToggleMain.OnServerEvent:Connect(function(player)
    local char = player.Character or player.CharacterAdded:Wait()
    local humanoid = char:FindFirstChildOfClass("Humanoid")
    if not humanoid then return end

    if activePlayers[player] then
        -- O'chirish
        humanoid.WalkSpeed = 16
        humanoid.JumpPower = 50
        char.Head.Color = Color3.fromRGB(255, 255, 255)
        local cape = char:FindFirstChild("Cape")
        if cape then cape:Destroy() end
        activePlayers[player] = nil
    else
        -- Yoqish (Spooky mode)
        humanoid.WalkSpeed = 50
        humanoid.JumpPower = 120
        if char:FindFirstChild("Head") then
            char.Head.Color = Color3.fromRGB(60, 0, 60)
        end

        -- Cape yaratish
        local torso = char:FindFirstChild("Torso") or char:FindFirstChild("UpperTorso")
        if torso and not char:FindFirstChild("Cape") then
            local cape = Instance.new("Part")
            cape.Name = "Cape"
            cape.Size = Vector3.new(2, 4, 0.2)
            cape.Color = Color3.fromRGB(30, 0, 30)
            cape.Anchored = false
            cape.CanCollide = false
            cape.Parent = char

            local weld = Instance.new("WeldConstraint")
            weld.Part0 = torso
            weld.Part1 = cape
            weld.Parent = cape

            cape.Position = torso.Position + Vector3.new(0, 1, 1)
        end

        activePlayers[player] = true
    end
end)

-- Dash Event
DashEvent.OnServerEvent:Connect(function(player)
    local char = player.Character
    local root = char and char:FindFirstChild("HumanoidRootPart")
    if root then
        root.Velocity = root.CFrame.LookVector * 150
    end
end)
