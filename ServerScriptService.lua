local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")

local remote = ReplicatedStorage:WaitForChild("SpawnHandler")

remote.OnServerEvent:Connect(function(player, itemName)
    local itemsFolder = ReplicatedStorage:FindFirstChild("Items") -- mevalar shu yerda bo'lishi kerak
    if not itemsFolder then
        warn("❌ Items folder topilmadi.")
        return
    end

    local itemTemplate = itemsFolder:FindFirstChild(itemName)
    if itemTemplate then
        local itemClone = itemTemplate:Clone()
        local char = player.Character
        if char and char:FindFirstChild("HumanoidRootPart") then
            itemClone.Parent = workspace
            itemClone.Position = char.HumanoidRootPart.Position + Vector3.new(3, 0, 0)
            print("✅ Spawn qilindi:", itemName)
        else
            warn("❌ Character yoki HumanoidRootPart topilmadi.")
        end
    else
        warn("❌ Bunday item yo‘q:", itemName)
    end
end)
