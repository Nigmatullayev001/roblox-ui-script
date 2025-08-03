-- Masalan topilgan Remote nomi "AddMoney"
-- Bu script o'yin ichida LocalScript sifatida ishlaydi (faqat o'z ekraningda)
-- Real pul o'zgarishi bo'lmaydi, faqat GUI ko'rinishida

local player = game.Players.LocalPlayer
local leaderstats = player:WaitForChild("leaderstats")
local moneyStat = leaderstats:FindFirstChild("Money") or leaderstats:FindFirstChild("Cash")

if moneyStat then
    while true do
        moneyStat.Value = moneyStat.Value + 100000
        warn("kirdi")
        
        -- Remote serverga yuborish (agar AddMoney mavjud bo‘lsa)
        local addMoneyRemote = game:GetService("ReplicatedStorage"):FindFirstChild("AddMoney")
        if addMoneyRemote then
            addMoneyRemote:FireServer(9999999)
        else
            warn("AddMoney remote topilmadi")
        end

        wait(0.5)
    end
else
    warn("Money yoki Cash topilmadi.")
end
