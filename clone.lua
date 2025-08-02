local Players = game:GetService("Players")
local player = Players.LocalPlayer

-- Funksiya: hozir ushlab turgan itemni topib, duplicate qilish
local function duplicateHeldTool()
	local character = player.Character
	if not character then return end

	local tool = character:FindFirstChildOfClass("Tool")
	if tool then
		local clone = tool:Clone()
		-- Qayerga qo‘yishni xohlaysan, masalan Backpack yoki Workspace
		clone.Parent = player.Backpack
		print("✅ Nusxa yaratildi:", clone.Name)
	else
		warn("❌ Sizda hozir hech qanday item yo‘q (qo‘lda).")
	end
end

-- Test tugmasi (UIsiz ishlatmoqchi bo‘lsang)
game:GetService("UserInputService").InputBegan:Connect(function(input, gpe)
	if gpe then return end
	if input.KeyCode == Enum.KeyCode.F then
		duplicateHeldTool()
	end
end)
