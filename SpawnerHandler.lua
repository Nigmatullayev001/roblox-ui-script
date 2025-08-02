-- Bu kodni ServerScriptService ichidagi yangi Scriptga yoz
local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- Faqat oldin mavjud emasligini tekshiradi
if not ReplicatedStorage:FindFirstChild("SpawnHandler") then
    local remote = Instance.new("RemoteEvent")
    remote.Name = "SpawnHandler"
    remote.Parent = ReplicatedStorage
    print("✅ SpawnHandler RemoteEvent yaratildi.")
else
    print("ℹ️ SpawnHandler allaqachon mavjud.")
end
