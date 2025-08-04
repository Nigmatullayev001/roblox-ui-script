local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Player = Players.LocalPlayer

local function createGUI()
    local Character = Player.Character or Player.CharacterAdded:Wait()
    local Humanoid = Character:WaitForChild("Humanoid")
    local HRP = Character:WaitForChild("HumanoidRootPart")

    local DEFAULTS = {
        WalkSpeed = 16,
        JumpPower = 50,
        Gravity = 196.2,
        AnimSpeed = 1
    }

    local Gui = Instance.new("ScreenGui", game.CoreGui)
    Gui.Name = "EgorUI"

    local Frame = Instance.new("Frame", Gui)
    Frame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    Frame.Size = UDim2.new(0, 160, 0, 180)
    Frame.Position = UDim2.new(0, 50, 0, 300)
    Frame.Active = true
    Frame.Draggable = true
    Instance.new("UICorner", Frame).CornerRadius = UDim.new(0, 6)

    local Title = Instance.new("TextLabel", Frame)
    Title.Text = "Created by jonhfoer"
    Title.Font = Enum.Font.SourceSansBold
    Title.TextSize = 16
    Title.TextColor3 = Color3.new(1, 1, 1)
    Title.BackgroundTransparency = 1
    Title.Size = UDim2.new(0.7, 0, 0, 25)
    Title.Position = UDim2.new(0, 5, 0, 5)
    Title.TextXAlignment = Enum.TextXAlignment.Left

    local CloseBtn = Instance.new("TextButton", Frame)
    CloseBtn.Text = "X"
    CloseBtn.Size = UDim2.new(0, 30, 0, 30)
    CloseBtn.Position = UDim2.new(1, -35, 0, 5)
    CloseBtn.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
    CloseBtn.TextColor3 = Color3.new(1, 1, 1)

    local ExpandBtn = Instance.new("TextButton", Frame)
    ExpandBtn.Text = ">"
    ExpandBtn.Size = UDim2.new(0.3, 0, 0, 25)
    ExpandBtn.Position = UDim2.new(0.35, 0, 1, -30)
    ExpandBtn.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
    ExpandBtn.TextColor3 = Color3.new(1, 1, 1)

    local EgorBtn = Instance.new("TextButton", Frame)
    EgorBtn.Size = UDim2.new(0.8, 0, 0, 30)
    EgorBtn.Position = UDim2.new(0.1, 0, 0, 35)
    EgorBtn.Text = "Egor = off"
    EgorBtn.BackgroundColor3 = Color3.fromRGB(90, 90, 90)
    EgorBtn.TextColor3 = Color3.new(1, 1, 1)

    local AnchorBtn = Instance.new("TextButton", Frame)
    AnchorBtn.Size = UDim2.new(0.8, 0, 0, 30)
    AnchorBtn.Position = UDim2.new(0.1, 0, 0, 75)
    AnchorBtn.Text = "Anchor"
    AnchorBtn.BackgroundColor3 = Color3.fromRGB(90, 90, 90)
    AnchorBtn.TextColor3 = Color3.new(1, 1, 1)


    local labels = {"WalkSpeed", "JumpPower", "Gravity", "AnimSpeed"}
    local Boxes = {}
    local spacingY = 115

    for _, stat in ipairs(labels) do
        local label = Instance.new("TextLabel", Frame)
        label.Text = stat
        label.Size = UDim2.new(0.8, 0, 0, 15)
        label.Position = UDim2.new(0.1, 0, 0, spacingY)
        label.TextColor3 = Color3.new(1, 1, 1)
        label.BackgroundTransparency = 1
        label.Visible = false

        local box = Instance.new("TextBox", Frame)
        box.Size = UDim2.new(0.8, 0, 0, 25)
        box.Position = UDim2.new(0.1, 0, 0, spacingY + 15)
        box.PlaceholderText = tostring(DEFAULTS[stat])
        box.BackgroundColor3 = Color3.fromRGB(120, 120, 120)
        box.TextColor3 = Color3.new(1, 1, 1)
        box.Visible = false
        Boxes[stat] = box

        spacingY += 45
    end

    local egorActive = false
    local anchorActive = false
    local expanded = false
    local currentAnimSpeed = DEFAULTS.AnimSpeed

    EgorBtn.MouseButton1Click:Connect(function()
        egorActive = not egorActive
        EgorBtn.Text = egorActive and "Egor = on" or "Egor = off"
        if egorActive then
            Humanoid.WalkSpeed = 2 --change to what u want
            Humanoid.JumpPower = 10
            workspace.Gravity = 10
            currentAnimSpeed = tonumber(Boxes.AnimSpeed.Text) or 5
        else
            Humanoid.WalkSpeed = DEFAULTS.WalkSpeed
            Humanoid.JumpPower = DEFAULTS.JumpPower
            workspace.Gravity = DEFAULTS.Gravity
            currentAnimSpeed = DEFAULTS.AnimSpeed
        end
    end)

    RunService.Stepped:Connect(function()
        if egorActive and Humanoid:FindFirstChild("Animator") then
            for _, track in Humanoid.Animator:GetPlayingAnimationTracks() do
                track:AdjustSpeed(currentAnimSpeed)
            end
        end
    end)

    AnchorBtn.MouseButton1Click:Connect(function()
        anchorActive = not anchorActive
        HRP.Anchored = anchorActive
    end)

    ExpandBtn.MouseButton1Click:Connect(function()
        expanded = not expanded
        ExpandBtn.Text = expanded and "<" or ">"
        for _, box in Boxes do box.Visible = expanded end
        for _, child in Frame:GetChildren() do
            if child:IsA("TextLabel") and table.find(labels, child.Text) then
                child.Visible = expanded
            end
        end
        Frame:TweenSize(expanded and UDim2.new(0, 160, 0, 340) or UDim2.new(0, 160, 0, 180), "Out", "Quad", 0.3, true)
    end)

    for stat, box in Boxes do
        box.FocusLost:Connect(function()
            local val = tonumber(box.Text)
            if stat == "WalkSpeed" and val then Humanoid.WalkSpeed = val end
            if stat == "JumpPower" and val then Humanoid.JumpPower = val end
            if stat == "Gravity" and val then workspace.Gravity = val end
            if stat == "AnimSpeed" and val then currentAnimSpeed = val end
        end)
    end

    CloseBtn.MouseButton1Click:Connect(function()
        Humanoid.WalkSpeed = DEFAULTS.WalkSpeed
        Humanoid.JumpPower = DEFAULTS.JumpPower
        workspace.Gravity = DEFAULTS.Gravity
        currentAnimSpeed = DEFAULTS.AnimSpeed
        HRP.Anchored = false
        Gui:Destroy()
    end)
end


Players.LocalPlayer.CharacterAdded:Connect(function()
    wait(1)
    createGUI()
end)

createGUI()
