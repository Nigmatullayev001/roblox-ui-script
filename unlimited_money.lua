-- Bu script o'yin ichida LocalScript sifatida ishlaydi (faqat o'z ekraningda)
-- Real pul o'zgarishi bo'lmaydi, faqat GUI ko'rinishida

local player = game.Players.LocalPlayer
local leaderstats = player:WaitForChild("leaderstats")
local moneyStat = leaderstats:FindFirstChild("Money") or leaderstats:FindFirstChild("Cash")

if moneyStat then
    while true do
        moneyStat.Value = moneyStat.Value + 100000
        wait(0.5)
    end
else
    warn("Money yoki Cash topilmadi.")
end
